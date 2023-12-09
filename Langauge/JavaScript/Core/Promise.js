// Promise.all
// 여러 개의 비동기 처리를 모두 병렬로 처리하고 싶을 때 사용


// sequential
const requestData1 = () => 
    new Promise(resolve => setTimeout(() => resolve(1), 3000));
const requestData2 = () => 
    new Promise(resolve => setTimeout(() => resolve(2), 2000));
const requestData3 = () => 
    new Promise(resolve => setTimeout(() => resolve(3), 1000));
const requestData4 = () => 
    new Promise((_, reject) => setTimeout(() => reject(4), 1000));

const res = [];
let start = null;
let end = null;


// start = Date.now();
// requestData1()
//     .then(data =>{
//         res.push(data);
//         return requestData2();
//     })
//     .then(data =>{
//         res.push(data);
//         return requestData3();
//     })
//     .then(data =>{
//         res.push(data);
//         console.log(res);
//         end = Date.now();
//         console.log(`sequential time: ${end - start}ms`); // 6000ms 정도 걸림
//     })
//     .catch(err=> {
//         console.error(err);
//         end = Date.now();
//         console.log(`sequential time: ${end - start}ms`);
//     });


// parallel 
// start = Date.now();
// Promise.all([requestData2(), requestData1(), requestData3(), requestData4()])
//     .then(res=> {
//         console.log(res);
//         end = Date.now();
//         console.log(`time: ${end - start}ms`); // 3000ms 정도 걸림
//     })
//     .catch(err=> {
//         console.error(err);
//         end = Date.now();
//         console.log(`parallel time: ${end - start}ms`); // 1000ms 정도 걸림
//     });

// Promise.race
// 여러 개의 비동기 처리 중 가장 빨리 처리되는 것 하나만 처리하고 싶을 때 사용

// Promise.race([
//     requestData1(),
//     requestData2(),
//     requestData3(),
//     requestData4()
// ]).then(res=> console.log(res))
// .catch(err=> console.error(err));


// Promise.allSettled
// 여러 개의 비동기 처리 중 하나라도 실패하더라도 모든 처리가 끝날 때까지 기다렸다가 처리 결과를 반환
// Promise.allSettled([
//     requestData1(),
//     requestData2(),
//     requestData3(),
//     requestData4()
// ]).then(res=> console.log(res))
/*
[
  { status: 'fulfilled', value: 1 },
  { status: 'fulfilled', value: 2 },
  { status: 'fulfilled', value: 3 },
  { status: 'rejected', reason: 4 }
]
*/

let res1 = null;
let res2 = null;

// Promise.allSettled([
//     requestData1(),
//     requestData2()
// ]).then(res => {
//     [res1, res2] = res;
//     console.log(res1, res2);
// });

async function asyncFunc() {
    start = Date.now();
    const [res1, res2] = await Promise.all([
        requestData1(),
        requestData2()
    ]);
    end = Date.now();
    console.log(res1, res2);
    console.log(`time: ${end - start}ms`);
}

async function asyncFunc2() {
    start = Date.now();
    const res1 = await requestData1();
    const res2 = await requestData2();

    end = Date.now();
    console.log(res1, res2);
    console.log(`time: ${end - start}ms`);
}

asyncFunc(); // tiem: 3000ms 
asyncFunc2(); // time: 5000ms
