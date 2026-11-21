// Kimlik doğrulama ve kullanıcı başına günlük kota.
import { createClient } from "npm:@supabase/supabase-js@2";
import { HttpError } from "./http.ts";

const supabaseUrl = Deno.env.get("SUPABASE_URL")!;
const serviceRoleKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")!;

// Service role yalnızca sunucuda; RLS'i bypass edip kota sayacına yazabilir.
const admin = createClient(supabaseUrl, serviceRoleKey, {
  auth: { persistSession: false, autoRefreshToken: false },
});

/** Authorization başlığındaki JWT'yi doğrular ve kullanıcı kimliğini döner. */
export async function requireUser(req: Request): Promise<string> {
  const token = req.headers.get("Authorization")?.replace(/^Bearer\s+/i, "");
  if (!token) throw new HttpError("unauthorized", "Missing bearer token");

  // getClaims imzayı projenin JWKS'iyle doğrular (asimetrik anahtarlarda ağ çağrısı yok).
  const { data, error } = await admin.auth.getClaims(token);
  const userId = data?.claims?.sub;
  if (error || !userId) throw new HttpError("unauthorized", "Invalid token");
  return userId;
}

/** Günlük limiti aşmadıysa sayacı artırır; aştıysa quota_exceeded fırlatır. */
export async function consumeQuota(userId: string, dailyLimit: number): Promise<void> {
  const { data, error } = await admin.rpc("consume_ai_quota", {
    p_user_id: userId,
    p_daily_limit: dailyLimit,
  });
  if (error) {
    console.error("consume_ai_quota failed", error);
    throw new HttpError("internal", "Quota check failed");
  }
  if (data !== true) throw new HttpError("quota_exceeded", "Daily AI limit reached");
}
