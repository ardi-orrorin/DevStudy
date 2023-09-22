const {Worker, isMainThread, parentPort} = require('worker_threads');

if(isMainThread){ // 부모일때
    const worker = new Worker(__filename);
    const worker1 = new Worker(__filename);
    worker.on('message', message => console.log('from worker', message));
    worker1.on('message1', message => console.log('from worker1', message));
    worker.on('exit', () => console.log('worker exit'));
    worker.on('exit', () => console.log('worker exit1'));
    worker1.postMessage('ping1')
    worker.postMessage('ping')
}else{ // 워커 일때 
    parentPort.on('message', value => {
        console.log('from parent', value);
        parentPort.postMessage('pong');
        for(let i =0 ; i < 10000000; i++){}
        parentPort.close()
    });

    parentPort.on('message1', value => {
        console.log('from parent1', value);
        parentPort.postMessage('pong1');
        parentPort.close()
    });
}