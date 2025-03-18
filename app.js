const http = require('http');
const port = process.env.PORT || 8080;

const requestHandler = (req, res) => {
    res.end('Hello from Group 8\'s DevSecOps pipeline!');
};

http.createServer(requestHandler).listen(port, () => {
  console.log(`Server running at http://localhost:${port}/`);
});

// Changes made
