const http = require("http");
const os = require("os");

const port = 8080;
let requestCount = 0;

const server = http.createServer((req, res) => {
  requestCount++;

  if (req.url === "/health" && req.method === "GET") {
    res.writeHead(200);
    res.end("Health check passed!");
    return;
  }

  res.statusCode = 200;
  res.setHeader("Content-Type", "text/html");

  const osDetails = `
    <html>
      <head>
        <meta http-equiv="refresh" content="1">
      </head>
      <body>
        <p>Image hash: ${process.env.IMAGE_HASH}</p>
        <p>Hostname: ${os.hostname()}</p>
        <p>IP Address: ${os.networkInterfaces().eth0[0].address}</p>
        <p>Requests served: ${requestCount}</p>
      </body>
    </html>
  `;

  res.end(osDetails);
});

server.listen(port, () => {
  console.log(`server started on port: ${port}/`);
});

// Graceful shutdown on SIGTERM signal
process.on("SIGTERM", () => {
  console.info("Received SIGTERM signal. Closing server gracefully.");
  server.close(() => {
    console.log("Server closed. Exiting process.");
    process.exit(0);
  });
});
