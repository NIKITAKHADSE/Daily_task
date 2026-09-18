-- Add designation to existing Supabase projects.
alter table public.users
  add column if not exists designation text;

alter table public.users
  drop constraint if exists users_designation_check;

alter table public.users
  add constraint users_designation_check
  check (designation is null or designation in ('Graphic','Video','POC','Content Responsible'));
