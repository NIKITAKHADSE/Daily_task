function cleanString(value, max = 5000) {
  return String(value ?? '').trim().slice(0, max);
}

function pad2(n) { return String(n).padStart(2, '0'); }
function ymd(d) { return `${d.getUTCFullYear()}-${pad2(d.getUTCMonth()+1)}-${pad2(d.getUTCDate())}`; }
function ymdDate(value) {
  const m = String(value || '').match(/^(\d{4})-(\d{2})-(\d{2})$/);
  return m ? new Date(Date.UTC(+m[1], +m[2]-1, +m[3])) : null;
}
function addDays(d, n) { const x = new Date(d); x.setUTCDate(x.getUTCDate()+n); return x; }
function firstMonth(d) { return new Date(Date.UTC(d.getUTCFullYear(), d.getUTCMonth(), 1)); }
function lastMonth(d) { return new Date(Date.UTC(d.getUTCFullYear(), d.getUTCMonth()+1, 0)); }

function indiaToday() {
  const parts = new Intl.DateTimeFormat('en-CA', { timeZone:'Asia/Kolkata', year:'numeric', month:'2-digit', day:'2-digit' }).formatToParts(new Date());
  const get = t => parts.find(p => p.type === t)?.value;
  return new Date(Date.UTC(+get('year'), +get('month')-1, +get('day')));
}

function indiaDateTimeString() {
  const parts = new Intl.DateTimeFormat('en-GB', {
    timeZone:'Asia/Kolkata', year:'numeric', month:'2-digit', day:'2-digit', hour:'2-digit', minute:'2-digit', second:'2-digit', hourCycle:'h23'
  }).formatToParts(new Date());
  const get = t => parts.find(p => p.type === t)?.value;
  return `${get('year')}-${get('month')}-${get('day')} ${get('hour')}:${get('minute')}:${get('second')}`;
}

function dateRange(q = {}) {
  const range = q.range || 'this_month';
  const today = indiaToday();
  let from, to;
  switch (range) {
    case 'all_data': from = new Date(Date.UTC(2000,0,1)); to = new Date(Date.UTC(2100,11,31)); break;
    case 'selected_month': {
      const m = String(q.month || '').match(/^(\d{4})-(\d{2})$/);
      const d = m ? new Date(Date.UTC(+m[1], +m[2]-1, 1)) : firstMonth(today);
      from = firstMonth(d); to = lastMonth(d); break;
    }
    case 'exact_date': from = to = ymdDate(q.date) || today; break;
    case 'today': from = to = today; break;
    case 'yesterday': from = to = addDays(today, -1); break;
    case 'this_week': {
      const day = today.getUTCDay() || 7;
      from = addDays(today, 1-day); to = addDays(from, 6); break;
    }
    case 'last_week': {
      const day = today.getUTCDay() || 7;
      const thisMon = addDays(today, 1-day);
      from = addDays(thisMon, -7); to = addDays(from, 6); break;
    }
    case 'last_month': {
      const prev = new Date(Date.UTC(today.getUTCFullYear(), today.getUTCMonth()-1, 1));
      from = firstMonth(prev); to = lastMonth(prev); break;
    }
    case 'custom': {
      from = ymdDate(q.from) || today; to = ymdDate(q.to) || today;
      if (from > to) [from, to] = [to, from];
      break;
    }
    default: from = firstMonth(today); to = lastMonth(today);
  }
  return [ymd(from), ymd(to)];
}

function perfLevel(p) {
  if (p >= 90) return 'Excellent';
  if (p >= 75) return 'Good';
  if (p >= 50) return 'Average';
  return 'Needs Improvement';
}
function completion(completed, eligible) { return eligible ? Math.round((completed*1000)/eligible)/10 : 0; }
function normalizedDue(value='') { return String(value).replace('T',' ').slice(0,19); }

module.exports = { cleanString, dateRange, perfLevel, completion, indiaDateTimeString, normalizedDue };
