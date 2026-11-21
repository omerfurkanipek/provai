-- Kullanıcı başına günlük AI istek sayacı. Edge Function'lar her istekten önce
-- consume_ai_quota çağırır; limit dolduysa istek AI sağlayıcısına gitmez.

create table public.ai_usage (
  user_id uuid not null references auth.users (id) on delete cascade,
  usage_date date not null default (now() at time zone 'utc')::date,
  request_count integer not null default 0 check (request_count >= 0),
  primary key (user_id, usage_date)
);

comment on table public.ai_usage is
  'Daily AI request counter per user; written only by edge functions via consume_ai_quota.';

-- İstemciler bu tabloyu hiç görmez: RLS açık ve politika yok, yetkiler geri alındı.
-- service_role RLS'i bypass ettiği için yalnızca sunucu tarafı yazabilir.
alter table public.ai_usage enable row level security;
revoke all on table public.ai_usage from anon, authenticated;

-- Sayaç artırma ve limit kontrolü tek atomik ifadede: eşzamanlı isteklerde yarış yok.
-- Limit doluysa upsert hiçbir satırı güncellemez ve fonksiyon false döner.
create or replace function public.consume_ai_quota(
  p_user_id uuid,
  p_daily_limit integer
)
returns boolean
language plpgsql
security invoker
set search_path = ''
as $$
declare
  v_count integer;
begin
  insert into public.ai_usage as u (user_id, usage_date, request_count)
  values (p_user_id, (now() at time zone 'utc')::date, 1)
  on conflict (user_id, usage_date)
  do update set request_count = u.request_count + 1
  where u.request_count < p_daily_limit
  returning u.request_count into v_count;

  return v_count is not null;
end;
$$;

revoke execute on function public.consume_ai_quota(uuid, integer) from public, anon, authenticated;
grant execute on function public.consume_ai_quota(uuid, integer) to service_role;
