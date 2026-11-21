// AI sağlayıcı katmanı. Fonksiyonlar yalnızca `LlmProvider` arayüzünü bilir;
// sağlayıcıyı (Gemini, Claude, ...) değiştirmek bu dosyada yeni bir sınıf demektir.
import { HttpError } from "./http.ts";

export type JsonSchema = Record<string, unknown>;

export interface LlmRequest {
  system: string;
  user: string;
  /** Yanıtın uyması gereken JSON şeması (OpenAPI alt kümesi). */
  schema: JsonSchema;
  temperature?: number;
  maxOutputTokens?: number;
  /** Modelin cevaptan önce ne kadar "düşüneceği"; düşük seviye gecikmeyi ciddi azaltır. */
  thinkingLevel?: "minimal" | "low" | "medium" | "high";
}

export interface LlmProvider {
  generateJson(request: LlmRequest): Promise<unknown>;
}

/** Hız/kalite seviyesi: soru üretimi hızlı, değerlendirme daha güçlü model ister. */
export type ModelTier = "fast" | "smart";

// 2026-11-21 ölçümü (ücretsiz katman): değerlendirmede flash-lite 2.5–4 sn,
// 3.5 Flash 33–39 sn sürdü ve puanlar aynı çıktı. Bu yüzden ikisi de lite ile
// başlıyor; 3.5 Flash yoğunluk (503) ve geçersiz çıktı durumunda yedek.
// "smart" seviyesi daha yüksek düşünme bütçesiyle çağrılır (bkz. evaluate-answer).
const DEFAULT_MODELS: Record<ModelTier, string[]> = {
  fast: ["gemini-3.5-flash-lite", "gemini-3.5-flash"],
  smart: ["gemini-3.5-flash-lite", "gemini-3.5-flash"],
};

export function createProvider(tier: ModelTier): LlmProvider {
  // Model adları secret ile değiştirilebilir: GEMINI_MODELS_FAST="a,b"
  const override = Deno.env.get(`GEMINI_MODELS_${tier.toUpperCase()}`);
  const models = override ? override.split(",").map((m) => m.trim()) : DEFAULT_MODELS[tier];
  return new GeminiProvider(Deno.env.get("GEMINI_API_KEY") ?? "", models);
}

class GeminiProvider implements LlmProvider {
  constructor(
    private readonly apiKey: string,
    private readonly models: string[],
    private readonly timeoutMs = 40_000,
  ) {}

  async generateJson(request: LlmRequest): Promise<unknown> {
    let lastError: HttpError | undefined;
    // Sırayla dene: ilk model yoğunsa veya düşmüşse yedeğe geç.
    for (const model of this.models) {
      try {
        return await this.call(model, request);
      } catch (error) {
        if (!(error instanceof HttpError)) throw error;
        lastError = error;
        // Yalnızca AI kaynaklı hatalarda yedek modele geçilir.
        if (!error.code.startsWith("ai_")) throw error;
        console.warn(`Model ${model} failed: ${error.code} ${error.message}`);
      }
    }
    throw lastError ?? new HttpError("ai_unavailable", "No model available");
  }

  private async call(model: string, request: LlmRequest): Promise<unknown> {
    let response: Response;
    try {
      response = await fetch(
        `https://generativelanguage.googleapis.com/v1beta/models/${model}:generateContent`,
        {
          method: "POST",
          signal: AbortSignal.timeout(this.timeoutMs),
          headers: { "content-type": "application/json", "x-goog-api-key": this.apiKey },
          body: JSON.stringify({
            systemInstruction: { parts: [{ text: request.system }] },
            contents: [{ role: "user", parts: [{ text: request.user }] }],
            generationConfig: {
              responseMimeType: "application/json",
              responseSchema: request.schema,
              temperature: request.temperature ?? 0.7,
              maxOutputTokens: request.maxOutputTokens ?? 4096,
              thinkingConfig: { thinkingLevel: request.thinkingLevel ?? "low" },
            },
          }),
        },
      );
    } catch (error) {
      throw new HttpError("ai_unavailable", `Request to ${model} failed: ${error}`);
    }

    if (response.status === 429) throw new HttpError("ai_rate_limited", `${model} rate limited`);
    if (!response.ok) {
      const detail = await response.text();
      throw new HttpError("ai_unavailable", `${model} returned ${response.status}: ${detail.slice(0, 200)}`);
    }

    const body = await response.json();
    const candidate = body.candidates?.[0];
    if (!candidate || candidate.finishReason === "SAFETY") {
      throw new HttpError("ai_invalid_output", `${model} returned no usable candidate`);
    }
    const text: string = (candidate.content?.parts ?? [])
      .map((part: { text?: string }) => part.text ?? "")
      .join("");
    try {
      return JSON.parse(text);
    } catch {
      throw new HttpError("ai_invalid_output", `${model} returned non-JSON output`);
    }
  }
}
