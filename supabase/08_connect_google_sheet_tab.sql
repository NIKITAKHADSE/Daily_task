-- Point an already-deployed database at the requested Google Sheet tab.
-- The workbook ID is unchanged; this updates the fallback/initial tab.
update public.google_sheet_settings
set sheet_url = 'https://docs.google.com/spreadsheets/d/1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0/edit?gid=1803981173#gid=1803981173',
    sheet_id = '1K-3mIZ13QCZBK4f5mL2AghR6vL4BALsS4oPIyOsyNw0',
    gid = '1803981173',
    sync_interval = 30,
    sync_year = 2026,
    enabled = 1,
    last_sync_status = null,
    last_sync_message = 'Google Sheet connection updated. Waiting for sync.'
where id = 1;
