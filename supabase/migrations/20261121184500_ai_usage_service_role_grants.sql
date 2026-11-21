-- Yeni Supabase projelerinde public şemadaki tablolara varsayılan yetki verilmiyor.
-- consume_ai_quota security invoker olduğu için çağıran service_role'ün
-- tabloda okuma/yazma yetkisi olmalı. Silme yetkisi bilerek verilmedi.
grant select, insert, update on table public.ai_usage to service_role;
