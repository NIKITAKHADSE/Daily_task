-- Apply this migration to an already-deployed database.
-- Browser clients will request a sync every 30 seconds while the app is open.
update public.google_sheet_settings
set sync_interval = 30,
    enabled = case when nullif(trim(sheet_url), '') is not null then 1 else enabled end
where id = 1;
