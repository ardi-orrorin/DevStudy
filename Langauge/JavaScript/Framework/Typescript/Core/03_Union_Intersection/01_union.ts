// union type
// 여러 개의 타입 중 한 개만 쓰고 싶을 때 사용하는 문법

function logText(text: string){
    console.log(typeof text, text);
}

logText('123');
// logText(123); // error

function logTextAndNum(text: string | number):string | number{
    console.log(typeof text, text);
    return text
}
logTextAndNum('문자열');
logTextAndNum(123);


// 주의사항
interface Person {
    name: string;
    age: number;
}

interface Developer {
    name: string;
    skill: string;
}

function introduce(somone: Person | Developer): void{
    if('age' in somone){
        console.log(somone.age);
    }else if('skill' in somone){
        console.log(somone.skill);
    }
    
}

introduce({name: '홍길동', skill: 'java'});
introduce({name: '홍길동', age: 123});

// 타입 가드 정의
function logText2(text: string | number){
    switch(typeof text){
        case 'string':
            console.log(`string: ${text}`);
            break;
        case 'number':
            console.log(`number: ${text}`);
            break;
        default:
            throw new Error('string 도 number 도 아닙니다.');
    }
}

logText2('123');
logText2(123);
