// Ortak HTTP yardımcıları: yanıt zarfı, hata kodları, güvenli JSON okuma.
//
// Başarılı yanıt: { "data": ... }
// Hatalı yanıt:   { "error": { "code": "...", "message": "..." } }
// İstemci `code` alanına göre hata tipini seçer; `message` yalnızca loglama içindir.

export type ErrorCode =
  | "unauthorized"
  | "invalid_input"
  | "quota_exceeded"
  | "ai_rate_limited"
  | "ai_unavailable"
  | "ai_invalid_output"
  | "method_not_allowed"
  | "internal";

const STATUS: Record<ErrorCode, number> = {
  unauthorized: 401,
  invalid_input: 400,
  quota_exceeded: 429,
  ai_rate_limited: 503,
  ai_unavailable: 502,
  ai_invalid_output: 502,
  method_not_allowed: 405,
  internal: 500,
};

export class HttpError extends Error {
  constructor(readonly code: ErrorCode, message: string) {
    super(message);
  }
}

const corsHeaders = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Headers": "authorization, x-client-info, apikey, content-type",
  "Access-Control-Allow-Methods": "POST, OPTIONS",
};

export function ok(data: unknown): Response {
  return Response.json({ data }, { headers: corsHeaders });
}

export function fail(code: ErrorCode, message: string): Response {
  return Response.json(
    { error: { code, message } },
    { status: STATUS[code], headers: corsHeaders },
  );
}

/** Gövdeyi en fazla [maxBytes] boyutunda JSON olarak okur. */
export async function readJson(req: Request, maxBytes = 32_000): Promise<unknown> {
  const text = await req.text();
  if (text.length > maxBytes) throw new HttpError("invalid_input", "Body too large");
  try {
    return JSON.parse(text);
  } catch {
    throw new HttpError("invalid_input", "Body is not valid JSON");
  }
}

/** Fonksiyon gövdesini sarmalar: CORS, metod kontrolü ve hata eşleme tek yerde. */
export function serve(handler: (req: Request) => Promise<Response>): void {
  Deno.serve(async (req) => {
    if (req.method === "OPTIONS") return new Response("ok", { headers: corsHeaders });
    if (req.method !== "POST") return fail("method_not_allowed", "Use POST");
    try {
      return await handler(req);
    } catch (error) {
      if (error instanceof HttpError) return fail(error.code, error.message);
      console.error("Unhandled error", error);
      return fail("internal", "Unexpected error");
    }
  });
}
