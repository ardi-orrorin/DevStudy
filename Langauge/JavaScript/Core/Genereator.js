// Generator
// ES6 도입된 새로운 타입의 함수
// 함수의 실행을 중간에 멈췄다가 재개할 수 있는 기능
// 1. 제너레이터 함수는 함수 호출자에게 함수 실행의 제어권을 양도할 수 있다.
// 2. 제너레이터 함수는 함수 호출자와 함수의 상태를 주고 받을 수 있다.
// 3. 제너레이터 함수를 호출하면 제너레이터 객체르 반환한다.
// 4. 제너레이터 함수를 호출하면 함수 코드를 실행하는 것이 아니라 iterable이면서 동시에 iterator인 제너레이터 객체를 반환한다.


// 제너레이터 함수 정의
function* genDecFunc() {
    yield 1;
    yield 2;
    yield 3;
}

const genExpfunc = function* () {
    yield 2;
}

// 애스터리스크(*)는 function 키워드와 함수명 사이이면 어디든 위치해도 상관없다.
function*genfunc1(){yield 1;}
function* genfunc2(){yield 1;}
function * genfunc3(){yield 1;}
function  *genfunc4(){yield 1;}

// 제너레이터 함수는 화살표 함수로 정의 할 수 없다.
// const genArrowFunc = * () => {yield 1;}; // SyntaxError: Unexpected token '*'

// 제너레이터 함수는 new 연산자와 함께 호출할 수 없다.
function* genFuncNew(){yield 1;}
// new genFuncNew(); // TypeError: genFuncNew is not a constructor


function* genFunc() {
    console.log('genFunc started');
    console.log('yield 1');
    console.log('yield 1');
    console.log('yield 1');
    yield 1;
    console.log('yield 2');
    console.log('yield 2');
    console.log('yield 2');
    yield 2;
    yield 3;
}

const generator = genFunc();
console.log(generator); // Object [Generator] {}

while(generator){
    const res = generator.next();
    console.log(res.done);
    if(res.done) break;
    console.log(res.value);
}

function* genFuncR() {
    try {
        yield 1;
        yield 2;
        yield 3;
    } catch (e) {
        console.error(`resolve : ${e}`);
    }
}

const rGenerator = genFuncR();
console.log(rGenerator.next());
console.log(rGenerator.return('End!'));
console.log(rGenerator.next());

console.log('--------------------------');
const rGenerator2 = genFuncR();
console.log(rGenerator2.next());
console.log(rGenerator2.throw('Error!'));
// console.log(rGenerator2.next());


// 제너레이터는 yield 키워드를 사용하여 함수의 실행을 중간에 멈췄다가 재개할 수 있다.
// yield 키워드는 제너레이터 함수의 실행을 일시 중지시키거나 yield 키워드 뒤에 오는 표현식의 평가 결ㅈ과를 제너레이터 함수 호출자에게 반환한다.
// next()메서드를 호출하면 yield 표현식까지 실행되고 일시 중지 된다. 이때 함수의 제어권은 호출자로 양도(yield)된다.
// generator.next() -> yield -> generator.next() -> yield -> generator.next() -> return 

const gen = function* () {
    // next() 호출 시 첫번째 yield까지 실행된다.
    const x = yield 1; // next 메서드가 두번째 호출될 때까지 평가되지 않는다.
    console.log(x); // 4
    const y = yield (x + 10); // next 메서드가 세번째 호출될 때까지  yield (x + 3) 표현식이 평가되지 않는다.
    console.log(x, y); // 4 5
    return x + y; 
}

console.log('--------------------------');
const generator3 = gen();
// 첫번째 호출할 때 yield
console.log(generator3.next()); // {value: 1, done: false}
console.log(generator3.next(4)); // {value: 7, done: false}
console.log(generator3.next(5)); // {value: 9, done: true}


