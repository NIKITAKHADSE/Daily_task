const crypto = require('crypto');
const jwt = require('jsonwebtoken');
const { db } = require('./db');

const COOKIE = 'daily_task_manager_session';
const MAX_AGE = 60 * 60 * 24 * 7;

function secret() {
  const value = process.env.SESSION_SECRET;
  if (!value || value.length < 32) {
    throw new Error('SESSION_SECRET is missing or too short. Use a random value of at least 32 characters.');
  }
  return value;
}

function cookieMap(req) {
  const raw = req.headers.cookie || '';
  return Object.fromEntries(raw.split(';').map(v => v.trim()).filter(Boolean).map(pair => {
    const i = pair.indexOf('=');
    if (i < 0) return [pair, ''];
    return [pair.slice(0, i), decodeURIComponent(pair.slice(i + 1))];
  }));
}

function publicUser(u) {
  return {
    id: Number(u.id),
    name: u.name,
    email: u.email,
    role: u.role,
    department: u.department || '',
    status: u.status
  };
}

function setSession(res, user) {
  const csrf = crypto.randomBytes(24).toString('hex');
  const token = jwt.sign({ uid: Number(user.id), csrf }, secret(), { expiresIn: MAX_AGE });
  const secure = process.env.VERCEL_ENV || process.env.NODE_ENV === 'production';
  res.setHeader('Set-Cookie', `${COOKIE}=${encodeURIComponent(token)}; Path=/; HttpOnly; SameSite=Lax; Max-Age=${MAX_AGE}${secure ? '; Secure' : ''}`);
  return csrf;
}

function clearSession(res) {
  const secure = process.env.VERCEL_ENV || process.env.NODE_ENV === 'production';
  res.setHeader('Set-Cookie', `${COOKIE}=; Path=/; HttpOnly; SameSite=Lax; Max-Age=0${secure ? '; Secure' : ''}`);
}

async function getSession(req) {
  const token = cookieMap(req)[COOKIE];
  if (!token) return null;
  try {
    const payload = jwt.verify(token, secret());
    const { data, error } = await db().from('users')
      .select('id,name,email,role,department,status')
      .eq('id', payload.uid)
      .maybeSingle();
    if (error || !data || data.status !== 'active') return null;
    return { user: publicUser(data), csrf: payload.csrf || '' };
  } catch (_) {
    return null;
  }
}

function requireCsrf(req, session) {
  const token = req.headers['x-csrf-token'] || '';
  if (!session?.csrf || token !== session.csrf) {
    const e = new Error('Security token expired. Refresh the page and try again.');
    e.status = 419;
    throw e;
  }
}

module.exports = { publicUser, setSession, clearSession, getSession, requireCsrf };
