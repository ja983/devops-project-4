const express = require("express");
const os = require("os");

const app = express();
const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.json({
    message: "Hello from inside a Docker container!",
    hostname: os.hostname(), // the container ID when running in Docker
    node: process.version,
    time: new Date().toISOString(),
  });
});

app.get("/health", (req, res) => res.send("OK"));

app.listen(PORT, "0.0.0.0", () => console.log(`Server listening on port ${PORT}`));
