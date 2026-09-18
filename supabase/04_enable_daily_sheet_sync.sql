-- Set existing Google Sheet connections to automatic daily sync.
update public.google_sheet_settings
set sync_interval = 86400,
    enabled = case when nullif(trim(sheet_url), '') is not null then 1 else enabled end
where id = 1;
