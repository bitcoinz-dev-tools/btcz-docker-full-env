process.env.NODE_TLS_REJECT_UNAUTHORIZED = '0';

const http = require('http');
const config = require('config');
const app = require('./src/lib/server');
const log = require('./src/lib/log');

const server = http.createServer(app);

server.listen(3333, () => {
  log.info(`App listening on port 3333 !`);
});