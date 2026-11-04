const http = require('http');
const fs = require('fs');

const PORT = parseInt(process.env.PORT || '3081', 10);
const LOG = process.env.DSH_LOG || '/tmp/dsh.log';

function findUrl() {
  try {
    const text = fs.readFileSync(LOG, 'utf8');
    const m = text.match(/dsh web:\s*(https?:\/\/\S+)/);
    if (m) return m[1].trim();
    const m2 = text.match(/(https?:\/\/[^\s]+\/\?token=[^\s]+)/);
    if (m2) return m2[1].trim();
  } catch (_) {}
  return null;
}

const server = http.createServer((req, res) => {
  const url = findUrl();
  if (url) {
    res.writeHead(302, { Location: url, 'Cache-Control': 'no-store' });
    res.end();
  } else {
    res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8', 'Cache-Control': 'no-store' });
    res.end('<meta http-equiv="refresh" content="3"><title>DSH starting</title><h1>DSH is starting…</h1><p>Refresh in a few seconds.</p>');
  }
});

server.listen(PORT, '0.0.0.0', () => {
  console.log('DSH redirector listening on port ' + PORT);
});
