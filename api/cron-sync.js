const crypto = require('crypto');
const { syncGoogleSheet } = require('./_lib/googleSheet');

function send(res, status, data) {
  res.statusCode = status;
  res.setHeader('Content-Type', 'application/json; charset=utf-8');
  res.setHeader('Cache-Control', 'no-store');
  res.end(JSON.stringify(data));
}

function safeEqual(left, right) {
  const a = Buffer.from(String(left || ''));
  const b = Buffer.from(String(right || ''));
  return a.length === b.length && crypto.timingSafeEqual(a, b);
}

module.exports = async function handler(req, res) {
  if ((req.method || 'GET').toUpperCase() !== 'GET') {
    res.setHeader('Allow', 'GET');
    return send(res, 405, { ok: false, message: 'Method not allowed.' });
  }

  const cronSecret = process.env.CRON_SECRET;
  const authorization = req.headers.authorization || '';
  if (!cronSecret || !safeEqual(authorization, `Bearer ${cronSecret}`)) {
    return send(res, 401, { ok: false, message: 'Unauthorized.' });
  }

  try {
    const result = await syncGoogleSheet(false);
    return send(res, 200, result);
  } catch (error) {
    console.error('Automatic Google Sheet sync failed:', error);
    return send(res, 500, { ok: false, message: error.message || 'Automatic sync failed.' });
  }
};
