-- Run in Supabase SQL Editor after creating your project.
create table if not exists public.designs (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  name text not null,
  design jsonb not null,
  created_at timestamptz not null default now()
);
create index if not exists designs_user_id_idx on public.designs(user_id);
alter table public.designs enable row level security;
create policy "Users read their designs" on public.designs for select to authenticated using ((select auth.uid()) = user_id);
create policy "Users create their designs" on public.designs for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "Users update their designs" on public.designs for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "Users delete their designs" on public.designs for delete to authenticated using ((select auth.uid()) = user_id);
-- This starter does not implement real payment/order processing or public image storage.
