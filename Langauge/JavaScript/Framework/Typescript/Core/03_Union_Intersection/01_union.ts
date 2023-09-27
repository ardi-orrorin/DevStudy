// union type

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