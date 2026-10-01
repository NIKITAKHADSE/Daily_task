-- Prevent concurrent browser and cron syncs from duplicating the snapshot.
create or replace function public.replace_google_sheet_tasks(p_tasks jsonb)
returns integer
language plpgsql
security definer
set search_path = public
as $$
declare
  v_count integer := 0;
begin
  perform pg_advisory_xact_lock(hashtext('replace_google_sheet_tasks'));

  delete from public.tasks where source = 'google_sheet';

  insert into public.tasks (
    employee_id, task_date, task_description, category_id, priority, due_date, status, remarks,
    client_name, task_type, poc, content_responsible, responsible_editor, reference_links, time_taken,
    editor_remarks, acc_manager_remark, manager_remark, sheet_day, raw_status, raw_priority,
    source, source_sheet_key, source_row, synced_at, updated_at
  )
  select
    (x->>'employee_id')::bigint,
    (x->>'task_date')::date,
    x->>'task_description',
    nullif(x->>'category_id','')::bigint,
    coalesce(nullif(x->>'priority',''),'Medium'),
    nullif(x->>'due_date',''),
    coalesce(nullif(x->>'status',''),'Not Started'),
    coalesce(x->>'remarks',''),
    coalesce(x->>'client_name',''),
    coalesce(x->>'task_type',''),
    coalesce(x->>'poc',''),
    coalesce(x->>'content_responsible',''),
    coalesce(x->>'responsible_editor',''),
    coalesce(x->>'reference_links',''),
    coalesce(x->>'time_taken',''),
    coalesce(x->>'editor_remarks',''),
    coalesce(x->>'acc_manager_remark',''),
    coalesce(x->>'manager_remark',''),
    coalesce(x->>'sheet_day',''),
    coalesce(x->>'raw_status',''),
    coalesce(x->>'raw_priority',''),
    'google_sheet',
    x->>'source_sheet_key',
    nullif(x->>'source_row','')::bigint,
    nullif(x->>'synced_at','')::timestamp,
    coalesce(nullif(x->>'updated_at','')::timestamp, current_timestamp)
  from jsonb_array_elements(coalesce(p_tasks,'[]'::jsonb)) as x;

  get diagnostics v_count = row_count;
  return v_count;
end;
$$;

revoke all on function public.replace_google_sheet_tasks(jsonb) from public, anon, authenticated;
grant execute on function public.replace_google_sheet_tasks(jsonb) to service_role;
