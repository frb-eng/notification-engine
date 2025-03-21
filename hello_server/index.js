const http = require('http');

const port = 8080;

const server = http.createServer((req, res) => {
  console.log(`Request received for ${req.url}`);

  if (req.url === '/health' && req.method === 'GET') {
    res.writeHead(200);
    res.end('Health check passed!');
    return;
  }
  
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello, World!\n');
});

server.listen(port, () => {
  console.log(`server started on port: ${port}/`);
});

// Graceful shutdown on SIGTERM signal
process.on('SIGTERM', () => {
  console.info('Received SIGTERM signal. Closing server gracefully.');
  server.close(() => {
    console.log('Server closed. Exiting process.');
    process.exit(0);
  });
});