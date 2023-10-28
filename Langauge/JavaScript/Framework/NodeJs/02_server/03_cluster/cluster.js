// node의 경우 코어를 하나만 쓰게 되는데,
// cluster를 사용하면 코어당 node을 실행할 수 있게 된다.
// node 의 분산처리 능력이 올라 가는 것이 아닌 물리적으로 node 서버를 늘려
// 서버의 부하를 분산할 수 있게 된다.
// 이러한 현상으로 node 별로 메모리가 공유 되지 않아 세션 정보를 공유 할 수 없어
// redis 같은 memoryDB로 세션 정보를 공유한다.


const cluster = require('cluster');
const http = require('http');
const numCPUs = require('os').cpus().length;


if(cluster.isMaster){
    console.log(`마스터 프로세스 아이디 : ${process.pid}`);
    for(let i = 0; i < numCPUs; i++){
        cluster.fork(); // 워커 생성
    }

    cluster.on('exit', (worker, code, signal) => {
        console.log(`${worker.process.pid}번 워커가 종료되었습니다.`);
        console.log('code', code, 'signal', signal);
        // cluster.fork();
    });
}else{
    http.createServer((req, res) => {
        res.writeHead(200, {'Content-Type': 'text/html; chatset=utf-8'});
        res.write('<h1>Hello Node!</h1>');
        res.end('<p>Hello Cluster!</p>');
        setTimeout(()=>{
            process.exit(1);
        },1000)
    }).listen(8080);

    console.log(`${process.pid}번 워커 실행`);
}