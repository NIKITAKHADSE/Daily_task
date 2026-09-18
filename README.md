# Daily Task Manager — Supabase + Vercel

This version converts the original local PHP + SQLite project to:

- **Frontend:** the same existing HTML/CSS/JavaScript UI
- **Backend:** Vercel Node.js Function
- **Database:** Supabase Postgres
- **Google Sheet:** the same public-viewer CSV connection and the same column/status/priority mapping

The original `assets/style.css` and `assets/app.js` are unchanged.

## 1. Create the Supabase database

1. Create/open your Supabase project.
2. Open **SQL Editor**.
3. Run `supabase/01_schema.sql`.
4. Run `supabase/02_migrate_current_data.sql`.

The second file migrates the current data from the uploaded SQLite database, including:

- 28 users
- 27 categories
- the existing connected Google Sheet URL/tab
- 708 currently synced Google Sheet tasks
- the existing admin account/password hash

Default admin remains:

- Email: `admin@example.com`
- Password: `Admin123!`

## 2. Get Supabase values

From your Supabase project, copy:

- Project URL → `SUPABASE_URL`
- Server-side Secret key (`sb_secret_...`) → `SUPABASE_SECRET_KEY`

Keep the Secret key only in Vercel/backend environment variables. Never place it in `assets/app.js` or browser code.

Older Supabase projects can use the legacy `SUPABASE_SERVICE_ROLE_KEY` fallback included in the backend.

## 3. Add Vercel environment variables

In Vercel Project → Settings → Environment Variables add:

```text
SUPABASE_URL=https://YOUR_PROJECT_REF.supabase.co
SUPABASE_SECRET_KEY=sb_secret_...
SESSION_SECRET=<a-long-random-secret-at-least-32-characters>
CRON_SECRET=<a-different-random-secret-at-least-32-characters>
```

Generate `SESSION_SECRET` with any secure random generator, for example:

```bash
openssl rand -hex 32
```

## 4. Deploy to Vercel

Upload/import this project folder to Vercel or push it to GitHub and import the repository.

No framework selection is required. Vercel serves `index.html` and `assets/` statically, and runs `api/router.js` as the backend Function.

The included `vercel.json` keeps the old frontend request path working:

```text
/api.php?action=...
```

It transparently rewrites that path to the new Vercel API Function, so the existing `assets/app.js` did not need to change.

## 5. Google Sheet behavior

The existing Google Sheet connection is preserved. The application still:

- accepts the normal Google Sheet browser URL
- reads the selected tab using its `gid`
- requires **Anyone with the link → Viewer**
- reads Google CSV output without Google OAuth/API credentials
- uses the same column mapping
- creates missing employees/categories automatically
- replaces the previous Google Sheet snapshot on successful sync
- keeps Google Sheet tasks read-only in the app

The migrated setting currently preserves the original auto-sync enabled/disabled state exactly as it was in SQLite.

## Automatic Google Sheet sync

When automatic sync is enabled in the Google Sheet settings, the browser checks at the selected interval while the app is open. A Vercel Cron also calls `/api/cron-sync` once daily at 09:00 India time, so syncing continues when nobody has the app open.

The cron endpoint requires `CRON_SECRET`. Add it to the Vercel Production environment and redeploy; Vercel automatically sends it as a Bearer token to cron requests. Use a different random value from `SESSION_SECRET`.

## Local testing

After setting `.env.local` with the same environment variables:

```bash
npm install
npx vercel dev
```

Then open the local URL printed by Vercel CLI.

## Important files

```text
index.html                       Same normal application UI, PHP wrapper removed
assets/style.css                 Unchanged original design CSS
assets/app.js                    Unchanged original frontend logic
api/router.js                     Vercel API replacement for public/api.php
api/_lib/googleSheet.js          Port of the existing Google Sheet connector
supabase/01_schema.sql           Supabase tables, indexes, RLS, sync RPC
supabase/02_migrate_current_data.sql  Current SQLite data migration
vercel.json                      /api.php compatibility rewrite
.env.example                     Required environment variable template
```
