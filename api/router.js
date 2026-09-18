const bcrypt = require('bcryptjs');
const { db, fetchAll } = require('./_lib/db');
const { publicUser, setSession, clearSession, getSession, requireCsrf } = require('./_lib/auth');
const { cleanString, dateRange, perfLevel, completion, indiaDateTimeString, normalizedDue } = require('./_lib/utils');
const { parseGoogleSheetUrl, testGoogleSheet, syncGoogleSheet, getSettings } = require('./_lib/googleSheet');

function send(res, data, status=200) {
  res.statusCode=status;
  res.setHeader('Content-Type','application/json; charset=utf-8');
  res.end(JSON.stringify(data));
}
function fail(message,status=400){const e=new Error(message);e.status=status;throw e;}
function employeeNameKey(name) { return String(name||'').trim().replace(/\s+/g,' ').toLowerCase(); }
async function body(req) {
  if (req.body && typeof req.body === 'object') return req.body;
  if (typeof req.body === 'string') { try { return JSON.parse(req.body); } catch (_) { return {}; } }
  const chunks=[]; for await (const c of req) chunks.push(c);
  if(!chunks.length) return {};
  try{return JSON.parse(Buffer.concat(chunks).toString('utf8'));}catch(_){return {};}
}
function params(req) {
  const u=new URL(req.url,'http://localhost');
  return Object.fromEntries(u.searchParams.entries());
}
function normalizeHash(hash='') { return String(hash).replace(/^\$2y\$/,'$2b$'); }
async function maps() {
  const supa=db();
  const [users,cats]=await Promise.all([
    fetchAll(()=>supa.from('users').select('id,name,email,designation,department,role,status,created_at')),
    fetchAll(()=>supa.from('categories').select('id,name,status'))
  ]);
  return {
    users, cats,
    userMap:new Map(users.map(x=>[Number(x.id),x])),
    catMap:new Map(cats.map(x=>[Number(x.id),x]))
  };
}
async function tasksQuery(filters={}, user=null, columns='*') {
  const supa=db();
  const make=()=>{
    let q=supa.from('tasks').select(columns);
    if(user && user.role!=='admin') q=q.eq('employee_id',Number(user.id));
    if(filters.employee_id && (!user || user.role==='admin')) q=q.eq('employee_id',Number(filters.employee_id));
    if(filters.status) q=q.eq('status',filters.status);
    if(filters.priority) q=q.eq('priority',filters.priority);
    if(filters.source) q=q.eq('source',filters.source);
    if(filters.from) q=q.gte('task_date',filters.from);
    if(filters.to) q=q.lte('task_date',filters.to);
    return q;
  };
  return fetchAll(make);
}
async function rangeTasks(q,user,columns='*') {
  const [from,to]=dateRange(q);
  const tasks=await tasksQuery({from,to},user,columns);
  return {from,to,tasks};
}

module.exports = async function handler(req,res) {
  try {
    const q=params(req);
    const action=q.action || '';
    const method=(req.method||'GET').toUpperCase();

    if(action==='login' && method==='POST') {
      const input=await body(req);
      const email=cleanString(input.email,180).toLowerCase();
      const password=String(input.password||'');
      const {data:u,error}=await db().from('users').select('id,name,email,password_hash,role,department,status').eq('email',email).maybeSingle();
      if(error) throw new Error(error.message);
      const ok=u && u.status==='active' && await bcrypt.compare(password,normalizeHash(u.password_hash));
      if(!ok) return send(res,{ok:false,message:'Email or password is wrong.'},401);
      const user=publicUser(u); const csrf=setSession(res,user);
      return send(res,{ok:true,user,csrf});
    }

    const session=await getSession(req);
    if(action==='logout' && method==='POST') {
      if(!session) return send(res,{ok:false,message:'Please login first.'},401);
      requireCsrf(req,session); clearSession(res); return send(res,{ok:true});
    }
    if(action==='me') {
      if(!session) return send(res,{ok:false,message:'Please login first.'},401);
      return send(res,{ok:true,user:session.user,csrf:session.csrf});
    }
    if(!session) return send(res,{ok:false,message:'Please login first.'},401);
    const user=session.user;
    const admin=()=>{if(user.role!=='admin') fail('Admin access required.',403);};

    if(action==='meta') {
      const {users,cats}=await maps();
      const visible=user.role==='admin' ? users.filter(x=>x.role==='employee').sort((a,b)=>a.name.localeCompare(b.name)) : [user];
      return send(res,{ok:true,users:visible,categories:cats.filter(x=>x.status==='active').sort((a,b)=>a.name.localeCompare(b.name))});
    }

    if(action==='google_sheet.settings') {
      admin();
      if(method==='GET') return send(res,{ok:true,settings:await getSettings()});
      if(method!=='POST') fail('Method not allowed.',405);
      requireCsrf(req,session);
      const input=await body(req);
      const url=cleanString(input.sheet_url,2000);
      const info=parseGoogleSheetUrl(url);
      let interval=Number(input.sync_interval||86400);
      if(![30,60,120,300,600,86400].includes(interval)) interval=86400;
      let year=Number(input.sync_year||new Date().getFullYear());
      if(year<2020||year>2100) year=new Date().getFullYear();
      const enabled=input.enabled?1:0;
      const {error}=await db().from('google_sheet_settings').update({sheet_url:url,sheet_id:info.sheet_id,gid:info.gid,sync_interval:interval,sync_year:year,enabled}).eq('id',1);
      if(error) throw new Error(error.message);
      return send(res,{ok:true,message:'Google Sheet settings saved.',settings:await getSettings()});
    }
    if(action==='google_sheet.test' && method==='POST') {
      admin(); requireCsrf(req,session); const input=await body(req); return send(res,await testGoogleSheet(cleanString(input.sheet_url,2000)));
    }
    if(action==='google_sheet.sync' && method==='POST') {
      requireCsrf(req,session); const input=await body(req); const force=!!input.force && user.role==='admin';
      return send(res,await syncGoogleSheet(force));
    }
    if(action==='google_sheet.status') {
      const s=await getSettings();
      const status={enabled:Number(s.enabled||0),connected:!!s.sheet_url,last_sync_at:s.last_sync_at||null,last_sync_status:s.last_sync_status||null,last_sync_message:s.last_sync_message||null,last_sync_count:Number(s.last_sync_count||0),sync_interval:Number(s.sync_interval||86400)};
      if(user.role==='admin') status.sheet_url=s.sheet_url||'';
      return send(res,{ok:true,status});
    }

    if(action==='tasks') {
      if(method==='GET') {
        const allowed={task_date:'task_date',due_date:'due_date',priority:'priority',status:'status',created_at:'created_at',client:'client_name'};
        const sort=allowed[q.sort||'task_date']||'task_date'; const ascending=String(q.dir||'DESC').toUpperCase()==='ASC';
        const supa=db();
        const make=()=>{
          let x=supa.from('tasks').select('*');
          if(user.role!=='admin') x=x.eq('employee_id',Number(user.id));
          if(q.employee_id && user.role==='admin') x=x.eq('employee_id',Number(q.employee_id));
          if(q.status) x=x.eq('status',cleanString(q.status,40));
          if(q.priority) x=x.eq('priority',cleanString(q.priority,40));
          if(q.source) x=x.eq('source',cleanString(q.source,40));
          if(q.from) x=x.gte('task_date',cleanString(q.from,10));
          if(q.to) x=x.lte('task_date',cleanString(q.to,10));
          return x.order(sort,{ascending}).order('id',{ascending:false});
        };
        let rows=await fetchAll(make);
        const {userMap,catMap}=await maps();
        rows=rows.map(t=>({...t,employee_name:userMap.get(Number(t.employee_id))?.name||'',category_name:t.category_id?catMap.get(Number(t.category_id))?.name||null:null}));
        if(q.search) {
          const s=cleanString(q.search,120).toLowerCase();
          rows=rows.filter(t=>[t.task_description,t.remarks,t.employee_name,t.client_name,t.poc,t.content_responsible].some(v=>String(v||'').toLowerCase().includes(s)));
        }
        return send(res,{ok:true,tasks:rows});
      }
      requireCsrf(req,session); const input=await body(req);
      if(method==='POST') {
        const employeeId=user.role==='admin'?Number(input.employee_id||user.id):Number(user.id);
        const desc=cleanString(input.task_description,2000); if(!desc) fail('Task description is required.',422);
        let priority=cleanString(input.priority||'Medium',20); if(!['Low','Medium','High','Critical'].includes(priority)) priority='Medium';
        let status=cleanString(input.status||'Not Started',30); if(!['Not Started','In Progress','Completed','Pending','Blocked','Cancelled'].includes(status)) status='Not Started';
        const row={employee_id:employeeId,task_date:cleanString(input.task_date||indiaDateTimeString().slice(0,10),10),task_description:desc,category_id:input.category_id!==''&&input.category_id!=null?Number(input.category_id):null,priority,due_date:cleanString(input.due_date,30)||null,status,remarks:cleanString(input.remarks,2000),source:'manual',updated_at:indiaDateTimeString()};
        const {data,error}=await db().from('tasks').insert(row).select('id').single(); if(error) throw new Error(error.message);
        return send(res,{ok:true,message:'Task added.',id:Number(data.id)},201);
      }
      if(method==='PUT' || method==='DELETE') {
        const id=Number(q.id||0); if(!id) fail('Task ID is required.',422);
        const {data:task,error}=await db().from('tasks').select('employee_id,source').eq('id',id).maybeSingle(); if(error) throw new Error(error.message);
        if(!task) fail('Task not found.',404);
        if((task.source||'manual')==='google_sheet') fail(method==='DELETE'?'This task comes from Google Sheet. Delete it in the Google Sheet; it will sync automatically.':'This task comes from Google Sheet. Edit it in the Google Sheet; it will sync automatically.',409);
        if(user.role!=='admin' && Number(task.employee_id)!==Number(user.id)) fail(method==='DELETE'?'You can delete only your own tasks.':'You can edit only your own tasks.',403);
        if(method==='DELETE') { const {error:e}=await db().from('tasks').delete().eq('id',id); if(e) throw new Error(e.message); return send(res,{ok:true,message:'Task deleted.'}); }
        let priority=cleanString(input.priority||'Medium',20); if(!['Low','Medium','High','Critical'].includes(priority)) priority='Medium';
        let status=cleanString(input.status||'Not Started',30); if(!['Not Started','In Progress','Completed','Pending','Blocked','Cancelled'].includes(status)) status='Not Started';
        const update={employee_id:user.role==='admin'?Number(input.employee_id||task.employee_id):Number(user.id),task_date:cleanString(input.task_date||indiaDateTimeString().slice(0,10),10),task_description:cleanString(input.task_description,2000),category_id:input.category_id!==''&&input.category_id!=null?Number(input.category_id):null,priority,due_date:cleanString(input.due_date,30)||null,status,remarks:cleanString(input.remarks,2000),updated_at:indiaDateTimeString()};
        const {error:e}=await db().from('tasks').update(update).eq('id',id); if(e) throw new Error(e.message);
        return send(res,{ok:true,message:'Task updated.'});
      }
      fail('Method not allowed.',405);
    }

    if(action==='users') {
      admin();
      if(method==='GET') {
        const rows=await fetchAll(()=>db().from('users').select('id,name,email,designation,role,department,status,created_at').order('name',{ascending:true}));
        return send(res,{ok:true,users:rows});
      }
      requireCsrf(req,session); const input=await body(req);
      if(method==='POST') {
        const name=cleanString(input.name,120), email=cleanString(input.email,180).toLowerCase(), pass=String(input.password||'');
        if(!name || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email) || pass.length<6) fail('Enter name, valid email and password of at least 6 characters.',422);
        const designations=['Graphic','Video','POC','Content Responsible'];
        const row={name,email,password_hash:await bcrypt.hash(pass,10),designation:designations.includes(input.designation)?input.designation:null,role:input.role==='admin'?'admin':'employee',department:cleanString(input.department,120),status:input.status==='inactive'?'inactive':'active'};
        const {error}=await db().from('users').insert(row); if(error){if(error.code==='23505') fail('This email already exists.',409); throw new Error(error.message);}
        return send(res,{ok:true,message:'User added.'},201);
      }
      if(method==='PUT') {
        const id=Number(q.id||0); if(!id) fail('User ID is required.',422);
        const designations=['Graphic','Video','POC','Content Responsible'];
        const update={name:cleanString(input.name,120),email:cleanString(input.email,180).toLowerCase(),designation:designations.includes(input.designation)?input.designation:null,role:input.role==='admin'?'admin':'employee',department:cleanString(input.department,120),status:input.status==='inactive'?'inactive':'active'};
        if(String(input.password||'')!=='') update.password_hash=await bcrypt.hash(String(input.password),10);
        const {error}=await db().from('users').update(update).eq('id',id); if(error){if(error.code==='23505') fail('This email already exists.',409); throw new Error(error.message);}
        return send(res,{ok:true,message:'User updated.'});
      }
      if(method==='DELETE') {
        const id=Number(q.id||0); if(!id) fail('Employee ID is required.',422);
        if(id===Number(user.id)) fail('You cannot delete your own account.',409);
        const {data:target,error:targetError}=await db().from('users').select('id,name,role').eq('id',id).maybeSingle();
        if(targetError) throw new Error(targetError.message);
        if(!target) fail('Employee not found.',404);
        const {count,error:countError}=await db().from('tasks').select('id',{count:'exact',head:true}).eq('employee_id',id);
        if(countError) throw new Error(countError.message);
        if(Number(count||0)>0) fail(`${target.name} has ${count} task(s). Deactivate the employee, or use Remove duplicates to merge duplicate records without losing tasks.`,409);
        const {error}=await db().from('users').delete().eq('id',id); if(error) throw new Error(error.message);
        return send(res,{ok:true,message:'Employee deleted.'});
      }
      fail('Method not allowed.',405);
    }

    if(action==='users.dedupe' && method==='POST') {
      admin(); requireCsrf(req,session);
      const users=await fetchAll(()=>db().from('users').select('id,name,email,role,status,created_at').eq('role','employee').order('id',{ascending:true}));
      const groups=new Map();
      for(const item of users) {
        const key=employeeNameKey(item.name); if(!key) continue;
        const group=groups.get(key)||[]; group.push(item); groups.set(key,group);
      }
      let removed=0, reassigned=0, groupsMerged=0;
      for(const group of groups.values()) {
        if(group.length<2) continue;
        group.sort((a,b)=>{
          const aSheet=String(a.email||'').endsWith('@local.invalid')?1:0;
          const bSheet=String(b.email||'').endsWith('@local.invalid')?1:0;
          return aSheet-bSheet || (a.status==='active'?-1:1)-(b.status==='active'?-1:1) || Number(a.id)-Number(b.id);
        });
        const keep=group[0], duplicates=group.slice(1), duplicateIds=duplicates.map(x=>Number(x.id));
        const {count,error:updateError}=await db().from('tasks').update({employee_id:Number(keep.id)},{count:'exact'}).in('employee_id',duplicateIds);
        if(updateError) throw new Error(updateError.message);
        const {error:deleteError}=await db().from('users').delete().in('id',duplicateIds);
        if(deleteError) throw new Error(deleteError.message);
        reassigned+=Number(count||0); removed+=duplicateIds.length; groupsMerged++;
      }
      const message=removed ? `Removed ${removed} duplicate employee record(s) across ${groupsMerged} name(s) and preserved ${reassigned} task assignment(s).` : 'No duplicate employee names were found.';
      return send(res,{ok:true,message,removed,reassigned,groups_merged:groupsMerged});
    }

    if(action.startsWith('analytics.')) {
      const {from,to,tasks}=await rangeTasks(q,user,'id,employee_id,task_date,task_description,category_id,priority,due_date,status,client_name,poc,content_responsible');
      if(action==='analytics.dashboard') {
        const total=tasks.length, completed=tasks.filter(t=>t.status==='Completed').length, pending=tasks.filter(t=>t.status==='Pending').length,
          in_progress=tasks.filter(t=>t.status==='In Progress').length, blocked=tasks.filter(t=>t.status==='Blocked').length,
          eligible=tasks.filter(t=>t.status!=='Cancelled').length, now=indiaDateTimeString(),
          overdue=tasks.filter(t=>t.due_date && normalizedDue(t.due_date)<now && !['Completed','Cancelled'].includes(t.status)).length,
          score=tasks.reduce((n,t)=>n+(t.status==='Completed'?1:t.status==='In Progress' ? 0.5 : 0),0);
        return send(res,{ok:true,range:[from,to],data:{total,completed,pending,in_progress,blocked,overdue,completion:completion(completed,eligible),productivity:eligible?Math.round(score*1000/eligible)/10:0}});
      }
      if(action==='analytics.employees' || action==='analytics.todayEmployees') {
        let source=tasks;
        if(action==='analytics.todayEmployees') {
          const todayRange=dateRange({range:'today'}); source=await tasksQuery({from:todayRange[0],to:todayRange[1]},user,'id,employee_id,status');
        }
        const {users}=await maps();
        const employees=users.filter(u=>u.status==='active'&&u.role==='employee'&&(user.role==='admin'||Number(u.id)===Number(user.id))).map(u=>{
          const mine=source.filter(t=>Number(t.employee_id)===Number(u.id)); const elig=mine.filter(t=>t.status!=='Cancelled').length; const comp=mine.filter(t=>t.status==='Completed').length;
          return {id:u.id,name:u.name,department:u.department,total:mine.length,completed:comp,pending:mine.filter(t=>t.status==='Pending').length,in_progress:mine.filter(t=>t.status==='In Progress').length,eligible:elig,completion:completion(comp,elig)};
        }).filter(employee=>employee.total>0).sort((a,b)=>b.completion-a.completion||b.total-a.total||a.name.localeCompare(b.name));
        employees.forEach((r,i)=>{r.rank=i+1;r.level=perfLevel(r.completion);});
        return send(res,{ok:true,employees});
      }
      if(action==='analytics.designations') {
        const {users}=await maps();
        const userMap=new Map(users.map(item=>[Number(item.id),item]));
        const labels=['Graphic','Video','POC','Content Responsible'];
        const groups=new Map(labels.map(label=>[label,{label,total:0,completed:0,eligible:0,employees:new Map()}]));
        tasks.forEach(task=>{
          const employee=userMap.get(Number(task.employee_id));
          const designation=employee?.designation;
          const row=groups.get(designation); if(!row) return;
          row.total++; if(task.status==='Completed') row.completed++; if(task.status!=='Cancelled') row.eligible++;
          const employeeRow=row.employees.get(Number(task.employee_id))||{id:Number(task.employee_id),name:employee.name,total:0,completed:0,eligible:0};
          employeeRow.total++; if(task.status==='Completed') employeeRow.completed++; if(task.status!=='Cancelled') employeeRow.eligible++;
          row.employees.set(Number(task.employee_id),employeeRow);
        });
        const items=[...groups.values()].map(row=>({...row,completion:completion(row.completed,row.eligible),employees:[...row.employees.values()].map(employee=>({...employee,completion:completion(employee.completed,employee.eligible)})).sort((a,b)=>b.completion-a.completion||b.total-a.total||a.name.localeCompare(b.name))})).sort((a,b)=>b.completion-a.completion||b.total-a.total||a.label.localeCompare(b.label));
        return send(res,{ok:true,items});
      }
      if(action==='analytics.clientResponsibilities') {
        const {users}=await maps();
        const userMap=new Map(users.map(item=>[Number(item.id),item]));
        const clients=new Map();
        tasks.forEach(task=>{
          const editor=userMap.get(Number(task.employee_id));
          if(!['Graphic','Video'].includes(editor?.designation)) return;
          const client=String(task.client_name||'').trim()||'Unassigned Client';
          const row=clients.get(client)||{client,total:0,completed:0,eligible:0,pocs:new Map(),contentResponsible:new Map()};
          row.total++; if(task.status==='Completed') row.completed++; if(task.status!=='Cancelled') row.eligible++;
          const poc=String(task.poc||'').trim(); if(poc) row.pocs.set(poc,(row.pocs.get(poc)||0)+1);
          const content=String(task.content_responsible||'').trim(); if(content) row.contentResponsible.set(content,(row.contentResponsible.get(content)||0)+1);
          clients.set(client,row);
        });
        const rank=map=>[...map.entries()].sort((a,b)=>b[1]-a[1]||a[0].localeCompare(b[0])).map(([name,total])=>({name,total}));
        const items=[...clients.values()].map(row=>({client:row.client,total:row.total,completed:row.completed,completion:completion(row.completed,row.eligible),topPoc:rank(row.pocs)[0]||null,topContentResponsible:rank(row.contentResponsible)[0]||null,pocs:rank(row.pocs),contentResponsible:rank(row.contentResponsible)})).sort((a,b)=>b.total-a.total||b.completion-a.completion||a.client.localeCompare(b.client));
        return send(res,{ok:true,range:[from,to],items});
      }
      if(action==='analytics.performance') {
        const allTasks=await tasksQuery({},user,'id,employee_id,task_date,status');
        const {userMap}=await maps();
        const groups={week:new Map(),month:new Map()};
        allTasks.forEach(task=>{
          const date=String(task.task_date||'').slice(0,10); if(!/^\d{4}-\d{2}-\d{2}$/.test(date)) return;
          const day=new Date(`${date}T00:00:00Z`); const monday=new Date(day); const offset=(day.getUTCDay()+6)%7; monday.setUTCDate(day.getUTCDate()-offset);
          const weekStart=monday.toISOString().slice(0,10); const month=date.slice(0,7);
          [[groups.week,weekStart],[groups.month,month]].forEach(([map,key])=>{
            const row=map.get(key)||{period:key,total:0,completed:0,eligible:0,employeeTotals:new Map()}; row.total++;
            if(task.status==='Completed') row.completed++; if(task.status!=='Cancelled') row.eligible++;
            const employeeId=Number(task.employee_id); const employee=row.employeeTotals.get(employeeId)||{employeeId,total:0,completed:0}; employee.total++; if(task.status==='Completed') employee.completed++; row.employeeTotals.set(employeeId,employee); map.set(key,row);
          });
        });
        const best=(map,format)=>[...map.values()].flatMap(row=>[...row.employeeTotals.values()].map(employee=>{
          const userInfo=userMap.get(employee.employeeId);
          return {period:format(row.period),total:employee.total,completed:employee.completed,completion:completion(employee.completed,employee.total),employee_name:userInfo?.name||'Unassigned'};
        })).sort((a,b)=>b.total-a.total||b.completed-a.completed||b.completion-a.completion||b.period.localeCompare(a.period))[0]||null;
        return send(res,{ok:true,week:best(groups.week,key=>`Week of ${key}`),month:best(groups.month,key=>key)});
      }
      if(action==='analytics.daily') {
        const g=new Map(); for(const t of tasks){const r=g.get(t.task_date)||{date:t.task_date,total:0,completed:0,pending:0,eligible:0};r.total++;if(t.status==='Completed')r.completed++;if(t.status==='Pending')r.pending++;if(t.status!=='Cancelled')r.eligible++;g.set(t.task_date,r);}
        const daily=[...g.values()].sort((a,b)=>a.date.localeCompare(b.date)).map(r=>({...r,completion:completion(r.completed,r.eligible)})); return send(res,{ok:true,daily});
      }
      if(action==='analytics.status') {
        const g=new Map(); tasks.filter(t=>t.status!=='Cancelled').forEach(t=>g.set(t.status,(g.get(t.status)||0)+1));
        return send(res,{ok:true,items:[...g].map(([label,value])=>({label,value})).sort((a,b)=>b.value-a.value)});
      }
      if(action==='analytics.categories') {
        const {catMap}=await maps(); const g=new Map();
        tasks.forEach(t=>{const label=t.category_id?(catMap.get(Number(t.category_id))?.name||'Uncategorized'):'Uncategorized';const r=g.get(label)||{label,total:0,completed:0,pending:0,eligible:0};r.total++;if(t.status==='Completed')r.completed++;if(t.status==='Pending')r.pending++;if(t.status!=='Cancelled')r.eligible++;g.set(label,r);});
        return send(res,{ok:true,items:[...g.values()].map(r=>({...r,completion:completion(r.completed,r.eligible)})).sort((a,b)=>b.total-a.total)});
      }
      if(action==='analytics.clients') {
        const g=new Map(); tasks.forEach(t=>{const label=String(t.client_name||'').trim()||'Manual / No Client';const r=g.get(label)||{label,total:0,completed:0,eligible:0};r.total++;if(t.status==='Completed')r.completed++;if(t.status!=='Cancelled')r.eligible++;g.set(label,r);});
        return send(res,{ok:true,items:[...g.values()].map(r=>({...r,completion:completion(r.completed,r.eligible)})).sort((a,b)=>b.total-a.total).slice(0,30)});
      }
      if(action==='analytics.priorities') {
        const g=new Map(); tasks.forEach(t=>{const label=t.priority;const r=g.get(label)||{label,total:0,completed:0,eligible:0};r.total++;if(t.status==='Completed')r.completed++;if(t.status!=='Cancelled')r.eligible++;g.set(label,r);});
        return send(res,{ok:true,items:[...g.values()].map(r=>({...r,completion:completion(r.completed,r.eligible)}))});
      }
      if(action==='analytics.overdue') {
        const now=indiaDateTimeString(); const {userMap}=await maps();
        const rows=tasks.filter(t=>t.due_date&&normalizedDue(t.due_date)<now&&!['Completed','Cancelled'].includes(t.status)).sort((a,b)=>normalizedDue(a.due_date).localeCompare(normalizedDue(b.due_date))).slice(0,100).map(t=>({id:t.id,employee_name:userMap.get(Number(t.employee_id))?.name||'',task_description:t.task_description,due_date:t.due_date,priority:t.priority,status:t.status}));
        return send(res,{ok:true,tasks:rows});
      }
      if(action==='analytics.employee') {
        const employeeId=user.role==='admin'?Number(q.employee_id||0):Number(user.id); if(!employeeId) fail('Select employee.',422);
        const mine=tasks.filter(t=>Number(t.employee_id)===employeeId); const g=new Map();
        mine.forEach(t=>{const r=g.get(t.task_date)||{date:t.task_date,total:0,completed:0,eligible:0};r.total++;if(t.status==='Completed')r.completed++;if(t.status!=='Cancelled')r.eligible++;g.set(t.task_date,r);});
        const daily=[...g.values()].sort((a,b)=>a.date.localeCompare(b.date)).map(r=>({...r,completion:completion(r.completed,r.eligible)}));
        const elig=mine.filter(t=>t.status!=='Cancelled').length, comp=mine.filter(t=>t.status==='Completed').length;
        return send(res,{ok:true,summary:{total:mine.length,completed:comp,pending:mine.filter(t=>t.status==='Pending').length,completion:completion(comp,elig)},daily});
      }
    }

    return send(res,{ok:false,message:'API action not found.'},404);
  } catch(e) {
    console.error(e);
    return send(res,{ok:false,message:e.status ? e.message : `Server error: ${e.message||'Unknown error'}`},e.status||500);
  }
};
