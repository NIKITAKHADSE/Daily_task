-- Allow tasks and synced Google Sheet rows to identify incomplete or unclear content.
alter table public.tasks
  drop constraint if exists tasks_status_check;

alter table public.tasks
  add constraint tasks_status_check
  check (status in (
    'Not Started',
    'In Progress',
    'Completed',
    'Pending',
    'Content Not Given Properly',
    'Blocked',
    'Cancelled'
  ));
