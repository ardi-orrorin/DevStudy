const http = require('http');
http.createServer((req, res) => {
    res.writeHead(200, {'Content-Type': 'text/html; charset=utf-8'});
    
    res.write('<h1>Hello World</h1>');
    res.end('<p>Server End</p>'); // 응답 종료 
}).listen(8080, ()=>{
    console.log('8080번 포트를 이용하고 있습니다.');
})