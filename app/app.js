const http = require("http");

const server = http.createServer((req, res) => {
  res.writeHead(200, { "Content-Type": "text/html" });

  res.end(`
    <html>
      <head>
        <title>Docker + Terraform</title>
      </head>
      <body style="
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-color: #f4f6f8;
      ">
        <h1 style="
          color: #1e90ff;
          font-size: 48px;
          font-weight: bold;
          font-family: Arial, Helvetica, sans-serif;
        ">
           Hello from Docker + Terraform on AWS EC2 
        </h1>
      </body>
    </html>
  `);
});

server.listen(3000, () => {
  console.log("Server running on port 3000");
});
