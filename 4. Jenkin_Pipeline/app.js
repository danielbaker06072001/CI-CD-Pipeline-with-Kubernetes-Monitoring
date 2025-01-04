// Import Express

const express = require("express");
const app = express();

const port = 3000;

app.get("/v1/healthz", (req, res) => {
	res.send({ message: "API is healthy, current version: 1.0.0" });
});

app.get("/v2/healthz", (req, res) => {
	res.send({ message: "API is healthy, current version: 2.0.0" });
});

app.get("/v3/healthz", (req, res) => {
	res.send({ message: "API is healthy, current version: 3.0.12" });
});

app.get("/v4/healthz", (req, res) => {
	res.send({ message: "API is healthy, current version: 4.0.0" });
});

app.listen(port, () => {
	console.log(`Server is running on port ${port}`);
});
