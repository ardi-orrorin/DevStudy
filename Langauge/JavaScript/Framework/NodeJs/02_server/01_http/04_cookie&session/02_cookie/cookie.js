const http = require('http');
const fs = require('fs').promises;
const path = require('path');

const parseCookies = (cookie = '') => (
    cookie.split(';')
    .map(v => v.split('='))
    .reduce((acc, [k, v]) => {
        acc[k.trim()] = decodeURIComponent(v);
        return acc;
    },{})
);

http.createServer(async (req, res) => {
    const cookies = parseCookies(req.headers.cookie);

    if(req.url.startsWith('/login')){
        const url = new URL(req.url, 'http://localhost:8080');
        const name = url.searchParams.get('name');
        const expires = new Date();
        expires.setMinutes(expires.getMinutes() + 10);
        res.writeHead(302, {
            Location: '/',
            'Set-Cookie': `name=${encodeURIComponent(name)}; Expires=${expires.toUTCString()}; HttpOnly; Path=`,});
        res.end()

        // Set-Cookie params
        // 1. cookieName = cookieValue 쿠키 이름 = 쿠키 값
        // 2. Expires=날짜  만료기한
        // 3. Max-age=초   Expires와 비슷하지만 초 단위로 입력할 수 있고, Expires 보다 우선한다.
        // 4. domain=도메인명 쿠기각 전송도리 도메인을 특정할 수 있다.
        // 5. path=URL 쿠기가 전송될 URL을 특정할 수 있다. 기본값은 '/'이고 이 경우 모든 URL에서 쿠키를 전송할 수 있다.
        // 6. Secure HTTPS일 경우에만 쿠키가 전송된다.
        // 7. HttpOnly 자바스크립트에서 쿠기에 접근할 수 없다. 쿠키 조작을 방지하기 위해 설정 추천
        
    }else if(cookies.name){
        res.writeHead(200, {'Content-Type': 'text/plain; charset=utf-8'});
        res.end(`${cookies.name}님 안녕하셍료`);
    }else{
        try{
            const data = await fs.readFile(path.join(__dirname, 'cookie.html'));
            res.writeHead(200, {'Content-Type': 'text/html; chatset=utf-8'});
            res.end(data);
        }catch(err){
            res.writeHead(200, {'Content-Type': 'text/plain; charset=utf-8'});
            res.end(err.message);
        }
    }
}).listen(8080, ()=>{console.log('8080 서버 포트 사용중');})