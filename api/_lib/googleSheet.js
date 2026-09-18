const crypto = require('crypto');
const bcrypt = require('bcryptjs');
const { parse } = require('csv-parse/sync');
const { db, fetchAll } = require('./db');
const { indiaDateTimeString } = require('./utils');

function normalizeHeader(value) {
  return String(value ?? '').replace(/^\uFEFF/, '').trim().toLowerCase().replace(/[^a-z0-9]+/g, '');
}

function parseGoogleSheetUrl(url) {
  url = String(url || '').trim();
  if (!url) throw userError('Paste your Google Sheet link first.');
  const m = url.match(/spreadsheets\/d\/([a-zA-Z0-9_-]+)/);
  if (!m) throw userError('This does not look like a Google Sheet link. Open the sheet, copy the browser URL, and paste it here.');
  const sheetId = m[1];
  const gidMatch = url.match(/(?:[?&#]|%3F|%26)gid(?:=|%3D)(\d+)/i);
  const gid = gidMatch ? gidMatch[1] : '0';
  return {
    sheet_id: sheetId,
    gid,
    sheet_key: `${sheetId}:${gid}`,
    csv_url: `https://docs.google.com/spreadsheets/d/${sheetId}/gviz/tq?tqx=out:csv&gid=${gid}`
  };
}

function userError(message, status=422) { const e = new Error(message); e.status = status; return e; }

async function httpGetText(url) {
  const controller = new AbortController();
  const timer = setTimeout(() => controller.abort(), 30000);
  try {
    const r = await fetch(url, { headers: { 'User-Agent':'DailyTaskManager/2.0', Accept:'text/csv,text/plain,*/*' }, signal: controller.signal, redirect:'follow' });
    if (!r.ok) throw userError(`Google Sheets returned HTTP ${r.status}. Check that the sheet is shared as Anyone with the link - Viewer.`);
    return await r.text();
  } catch (e) {
    if (e.name === 'AbortError') throw userError('Google Sheets took too long to respond. Try again.');
    throw e;
  } finally { clearTimeout(timer); }
}

function csvRows(csv) {
  return parse(csv, { relax_column_count:true, skip_empty_lines:false, bom:true }).map(row => row.map(v => String(v ?? '').trim()));
}

function findSheetHeader(rows) {
  for (let rowIndex=0; rowIndex<Math.min(20,rows.length); rowIndex++) {
    const map = {};
    rows[rowIndex].forEach((cell,i) => { const k=normalizeHeader(cell); if(k) map[k]=i; });
    if (map.tasks !== undefined && (map.date !== undefined || map.responsibleeditor !== undefined)) return [rowIndex,map];
  }
  throw userError('Could not find the header row. Keep column names like Date, Name, Type, Tasks and Responsible editor in the sheet.');
}

function sheetCell(row,map,keys) {
  for (const key of keys) {
    const k=normalizeHeader(key);
    if (Object.prototype.hasOwnProperty.call(map,k)) return String(row[map[k]] ?? '').trim();
  }
  return '';
}

const MONTHS = {jan:1,january:1,feb:2,february:2,mar:3,march:3,apr:4,april:4,may:5,jun:6,june:6,jul:7,july:7,aug:8,august:8,sep:9,sept:9,september:9,oct:10,october:10,nov:11,november:11,dec:12,december:12};
function validDate(y,m,d) {
  const x=new Date(Date.UTC(y,m-1,d));
  if(x.getUTCFullYear()!==y||x.getUTCMonth()!==m-1||x.getUTCDate()!==d) return null;
  return `${String(y).padStart(4,'0')}-${String(m).padStart(2,'0')}-${String(d).padStart(2,'0')}`;
}
function parseSheetDate(value, defaultYear) {
  let v=String(value||'').trim();
  if(!v) return null;
  v=v.replace(/[,.]/g,' ').replace(/\s+/g,' ').trim();
  let m;
  if((m=v.match(/^(\d{4})-(\d{1,2})-(\d{1,2})$/))) return validDate(+m[1],+m[2],+m[3]);
  if((m=v.match(/^(\d{1,2})[-/](\d{1,2})[-/](\d{4})$/))) return validDate(+m[3],+m[2],+m[1]);
  if((m=v.match(/^(\d{1,2})\s+([A-Za-z]+)(?:\s+(\d{4}))?$/))) {
    const mon=MONTHS[m[2].toLowerCase()]; if(mon) return validDate(m[3]?+m[3]:defaultYear,mon,+m[1]);
  }
  if((m=v.match(/^([A-Za-z]+)\s+(\d{1,2})(?:\s+(\d{4}))?$/))) {
    const mon=MONTHS[m[1].toLowerCase()]; if(mon) return validDate(m[3]?+m[3]:defaultYear,mon,+m[2]);
  }
  const candidate = /\b\d{4}\b/.test(v) ? v : `${v} ${defaultYear}`;
  const d=new Date(candidate);
  if(!Number.isNaN(d.getTime())) return validDate(d.getFullYear(),d.getMonth()+1,d.getDate());
  return null;
}

function normalizeSheetStatus(raw) {
  let v=String(raw||'').trim().toLowerCase().replace(/[^a-z]+/g,' ').trim();
  if(!v) return 'Not Started';
  if(v.includes('done')||v.includes('complete')) return 'Completed';
  if(v==='wip'||v.includes('in progress')||v.includes('working')) return 'In Progress';
  if(v.includes('pending')) return 'Pending';
  if(v.includes('block')||v.includes('hold')) return 'Blocked';
  if(v.includes('cancel')) return 'Cancelled';
  if(v.includes('not started')) return 'Not Started';
  return 'Not Started';
}
function normalizeSheetPriority(raw) {
  const v=String(raw||'').trim().toLowerCase();
  if(!v) return 'Medium';
  if(v.includes('urgent')||v.includes('critical')) return 'Critical';
  if(v.includes('high')||v==='imp'||v.includes('important')) return 'High';
  if(v.includes('low')) return 'Low';
  return 'Medium';
}
function emailSlug(name) {
  return String(name||'employee').toLowerCase().replace(/[^a-z0-9]+/g,'.').replace(/^\.+|\.+$/g,'') || 'employee';
}
function employeeNameKey(name) {
  return String(name||'').trim().replace(/\s+/g,' ').toLowerCase();
}

async function getSettings() {
  const {data,error}=await db().from('google_sheet_settings').select('*').eq('id',1).maybeSingle();
  if(error) throw new Error(error.message);
  return data || {};
}
async function markSync(status,message,count=0) {
  const {error}=await db().from('google_sheet_settings').update({last_sync_at:indiaDateTimeString(),last_sync_status:status,last_sync_message:message,last_sync_count:count}).eq('id',1);
  if(error) throw new Error(error.message);
}

async function ensureUsersAndCategories(parsed) {
  const supa=db();
  let users=await fetchAll(()=>supa.from('users').select('id,name,email'));
  let cats=await fetchAll(()=>supa.from('categories').select('id,name'));
  const userMap=new Map(users.map(u=>[employeeNameKey(u.name),u]));
  const emailSet=new Set(users.map(u=>String(u.email).toLowerCase()));
  const missingUsers=[];
  for(const item of parsed) {
    const key=employeeNameKey(item.editor);
    if(userMap.has(key)) continue;
    const slug=emailSlug(item.editor); let email=`sheet.${slug}@local.invalid`, n=2;
    while(emailSet.has(email.toLowerCase())) email=`sheet.${slug}.${n++}@local.invalid`;
    emailSet.add(email.toLowerCase());
    const row={name:item.editor,email,password_hash:bcrypt.hashSync(crypto.randomBytes(20).toString('hex'),10),role:'employee',department:'Google Sheet',status:'active'};
    missingUsers.push(row); userMap.set(key,row);
  }
  if(missingUsers.length) {
    const {error}=await supa.from('users').insert(missingUsers); if(error) throw new Error(error.message);
    users=await fetchAll(()=>supa.from('users').select('id,name,email'));
  }
  const catMap=new Map(cats.map(c=>[String(c.name).toLowerCase(),c]));
  const missingCats=[];
  for(const item of parsed) {
    const name=item.type.trim(); if(!name) continue;
    const key=name.toLowerCase(); if(catMap.has(key)) continue;
    const row={name,status:'active'}; missingCats.push(row); catMap.set(key,row);
  }
  if(missingCats.length) {
    const {error}=await supa.from('categories').insert(missingCats); if(error) throw new Error(error.message);
    cats=await fetchAll(()=>supa.from('categories').select('id,name'));
  }
  return {
    userMap:new Map(users.map(u=>[employeeNameKey(u.name),u])),
    catMap:new Map(cats.map(c=>[String(c.name).toLowerCase(),c]))
  };
}

async function testGoogleSheet(url) {
  const info=parseGoogleSheetUrl(url);
  const csv=await httpGetText(info.csv_url);
  if(/<html|<!doctype/i.test(csv)) throw userError('Google returned a web/login page. Share the sheet as Anyone with the link - Viewer and try again.');
  const rows=csvRows(csv); const [headerRow,map]=findSheetHeader(rows);
  let taskRows=0;
  for(let i=headerRow+1;i<rows.length;i++) if(sheetCell(rows[i],map,['Tasks','Task','Task Description'])) taskRows++;
  return {ok:true,message:'Connection successful. The sheet can be read.',task_rows:taskRows,gid:info.gid,headers:Object.keys(map)};
}

async function syncGoogleSheet(force=false) {
  const settings=await getSettings();
  const url=String(settings.sheet_url||'').trim();
  if(!url) return {ok:true,skipped:true,message:'No Google Sheet is connected yet.'};
  if(!force && !Number(settings.enabled||0)) return {ok:true,skipped:true,message:'Auto sync is off.'};
  if(!force && settings.last_sync_at) {
    const last=new Date(String(settings.last_sync_at).replace(' ','T')+'+05:30').getTime();
    const interval=Math.max(30,Math.min(86400,Number(settings.sync_interval||60)));
    if(Number.isFinite(last) && (Date.now()-last)<interval*1000) return {ok:true,skipped:true,message:'Already up to date.',last_sync_at:settings.last_sync_at};
  }
  try {
    const info=parseGoogleSheetUrl(url);
    const csv=await httpGetText(info.csv_url);
    if(/<html|<!doctype/i.test(csv)) throw userError('Google returned a login/web page instead of Sheet data. Share the sheet as Anyone with the link - Viewer, then try again.');
    const rows=csvRows(csv); if(!rows.length) throw userError('The Google Sheet returned no rows.');
    const [headerRow,map]=findSheetHeader(rows);
    const year=Number(settings.sync_year)||new Date().getFullYear();
    const parsed=[]; let lastDate=null;
    for(let i=headerRow+1;i<rows.length;i++) {
      const row=rows[i]; const task=sheetCell(row,map,['Tasks','Task','Task Description']); if(!task) continue;
      const dateRaw=sheetCell(row,map,['Date','Date.']); let date=parseSheetDate(dateRaw,year);
      if(date) lastDate=date; if(!date) date=lastDate; if(!date) continue;
      const client=sheetCell(row,map,['Name','Client','Client Name']);
      const type=sheetCell(row,map,['Type','Category']);
      const poc=sheetCell(row,map,['POC']);
      const contentResponsible=sheetCell(row,map,['Content Responsible']);
      const editorRaw=sheetCell(row,map,['Responsible editor','Responsible Editor','Editor']);
      const reference=sheetCell(row,map,['Reference links','Reference link','References']);
      const timeTaken=sheetCell(row,map,['Time Taken ( Videos)','Time Taken (Videos)','Time Taken']);
      const priorityRaw=sheetCell(row,map,['Priority']);
      const statusRaw=sheetCell(row,map,['Remarks filled by editors','Editor Status','Status']);
      const editorRemarks=sheetCell(row,map,['Editors Remarks','Editor Remarks']);
      const accRemark=sheetCell(row,map,['Acc manager remark','Account manager remark','Account Manager Remark']);
      const managerRemark=sheetCell(row,map,['Manager Remark','Manager Remarks']);
      const d=new Date(`${date}T12:00:00Z`);
      const day=sheetCell(row,map,['Day']) || new Intl.DateTimeFormat('en-US',{weekday:'long',timeZone:'UTC'}).format(d);
      const employeeName=editorRaw || contentResponsible || 'Unassigned';
      parsed.push({row_number:i+1,date,day,client,type,poc,task,content_responsible:contentResponsible,editor:employeeName,reference,time_taken:timeTaken,priority_raw:priorityRaw,priority:normalizeSheetPriority(priorityRaw),status_raw:statusRaw,status:normalizeSheetStatus(statusRaw),editor_remarks:editorRemarks,acc_remark:accRemark,manager_remark:managerRemark});
    }
    if(!parsed.length) throw userError('No task rows could be read. Check the Date and Tasks columns in the connected sheet tab.');
    const {userMap,catMap}=await ensureUsersAndCategories(parsed);
    const now=indiaDateTimeString();
    const snapshot=parsed.map(item=>({
      employee_id:Number(userMap.get(employeeNameKey(item.editor)).id), task_date:item.date, task_description:item.task,
      category_id:item.type ? Number(catMap.get(item.type.toLowerCase())?.id || 0) || null : null,
      priority:item.priority, due_date:null, status:item.status, remarks:item.editor_remarks,
      client_name:item.client, task_type:item.type, poc:item.poc, content_responsible:item.content_responsible,
      responsible_editor:item.editor, reference_links:item.reference, time_taken:item.time_taken, editor_remarks:item.editor_remarks,
      acc_manager_remark:item.acc_remark, manager_remark:item.manager_remark, sheet_day:item.day, raw_status:item.status_raw,
      raw_priority:item.priority_raw, source:'google_sheet', source_sheet_key:info.sheet_key, source_row:item.row_number,
      synced_at:now, updated_at:now
    }));
    const {data,error}=await db().rpc('replace_google_sheet_tasks',{p_tasks:snapshot});
    if(error) throw new Error(error.message);
    const count=Number(data ?? snapshot.length);
    const message=`${count} tasks synced from Google Sheet.`;
    await markSync('success',message,count);
    return {ok:true,message,count,sheet_key:info.sheet_key,last_sync_at:now};
  } catch(e) {
    try { await markSync('error',e.message,0); } catch(_) {}
    throw e;
  }
}

module.exports = { parseGoogleSheetUrl, testGoogleSheet, syncGoogleSheet, getSettings };
