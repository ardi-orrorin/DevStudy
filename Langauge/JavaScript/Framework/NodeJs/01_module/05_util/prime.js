const {Worker, isMainThread, parentPort, workerData} = require('worker_threads')

const min = 2;
const max = 10000000;
let primes = [];

const findPirmes = (start , range) => {
    let isPrimes = true;
    let end = start + range;

    for(let i = start; i < end; i++){
        for(let j = min; j < Math.sqrt(end); j++){
            if(i !== j && i % j === 0 ){
                isPrimes = false;
                break;
            }
        }

        if(isPrimes){
            primes.push(i);
        }
        isPrimes= true;
    }
}


console.time('prime');
findPirmes(min, max); // single thread
console.timeEnd('prime');
console.log(primes.length);

// primes = [];

if(isMainThread){
    const max = 10000000;
    const threadCount = 8;
    const threads = new Set();
    const range = Math.floor((max-min) / threadCount );
    let start = min;
    
    console.time('multi');

    for(let i = 0; i < threadCount - 1; i++ ){
        const wStart = start;
        threads.add(new Worker(__filename, {workerData: {start: wStart, range}}))
        start += range;
    }
    
    threads.add(new Worker(__filename, {workerData: {start, range: max - start}}));

    for(let worker of threads){
        worker.on('error', (err) => {
            throw err;
        });
        
        worker.on('exit', () => {
            threads.delete(worker);
            if(threads.size === 0){
                console.timeEnd('multi');
                console.log(primes.length);
            }
        });

        worker.on('message', msg => {
            primes = primes.concat(msg);
        });
    }
}else{
    findPirmes(workerData.start, workerData.range)
    parentPort.postMessage(primes);
}