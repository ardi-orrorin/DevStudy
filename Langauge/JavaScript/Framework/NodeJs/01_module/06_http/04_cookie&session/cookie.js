const http = require('http');

http.createServer((req, res) => {
    console.log(req.url, req.headers.cookie);
    res.writeHead(200, {'Set-Cookie': 'mycookie=test'});
    res.end('Hello world');
}).listen(8080,()=>{console.log('8080 서버 실행중');})