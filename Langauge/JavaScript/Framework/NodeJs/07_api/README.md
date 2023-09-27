### pm2
<pre>

// start
npx pm2 start server.js

// start multithreads
npx pm2 start server -i 0 
// 0 전체
// > 0 코어 갯수

// list
npx pm2 list

// stop
npx pm2 kill

// reload
npx pm2 reload name
// start 사용된 서버 파일 이름

// scale
npx pm2 scale name 4 // 4개로 조절
npx pm2 scale name +4 // 4개 추가
// start 사용된 서버 파일 이름
// 4 코어 갯수

// monitor
npx pm2 monit
</pre>