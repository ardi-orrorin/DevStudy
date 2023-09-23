const http = require('http');
const fs = require('fs').promises;
const path = require('path');
const session = {};


const parseCookies = (cookie = '') => (
    cookie.split(';')
    .map(v => v.split('='))
    .reduce((acc, [k, v]) => {
        acc[k.trim()] = decodeURIComponent(v);
        return acc;
    },{})
);


// session 과 cookie의 차이
// cookie는 클라이언트가 사용자의 정보의 일부를 갖고 이를 서버와 통신할 때 검증할 때 사용할 때 사용하고,
// session는 사용자의 정보를 서버가 갖고 그에 따른 서버만이 알아 볼 수 있는 코드를 반환하여 클라이언트가 서버로 부터 인증 받는 티켓으로써의 역할


http.createServer(async (req, res) => {
    const cookies = parseCookies(req.headers.cookie);

    if(req.url.startsWith('/login')){
        const url = new URL(req.url, 'http://localhost:8080');
        const name = url.searchParams.get('name');
        const expires = new Date();
        expires.setMinutes(expires.getMinutes() + 10);
        
        const uniqueInt = Date.now();
        session[uniqueInt] = {
            name, expires
        };

        res.writeHead(302, {
            Location: '/',
            'Set-Cookie': `session=${uniqueInt}; Expires=${expires.toUTCString()}; HttpOnly; Path=/`,});
        res.end()
        
    }else if(cookies.session && session[cookies.session].expires > new Date()){
        res.writeHead(200, {'Content-Type': 'text/plain; charset=utf-8'});
        res.end(`${session[cookies.session].name}님 안녕하셍료`);
    }else{
        try{
            const data = await fs.readFile(path.join(__dirname, 'session.html'));
            res.writeHead(200, {'Content-Type': 'text/html; chatset=utf-8'});
            res.end(data);
        }catch(err){
            res.writeHead(500, {'Content-Type': 'text/plain; charset=utf-8'});
            res.end(err.message);
        }
    }
}).listen(8080, ()=>{console.log('8080 서버 포트 사용중');})