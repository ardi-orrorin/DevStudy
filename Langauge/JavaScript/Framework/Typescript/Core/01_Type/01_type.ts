// string
let str:string = '문자열';

// number
// let num1:number = '123'; // error TS2322: Type 'string' is not assignable to type 'number'
let num2:number = 123;
let num3:number = parseInt('1123');

// boolean
let bool:boolean = true;

// Object
let obj:object = {name:'name', count:12}


// Array
let arrStr:Array<string> = ['홍길동', '심사임당','유관순'];
let arrStr2:string[] = ['홍길동', '심사임당','유관순'];

let arrNum1:Array<number> = [1,2,3,4];
let arrNum2:number[] = [1,2,3,4];
 
// let arr2:Array<number> = [1,2,3,4,'12']; // err 

// tuple
// 튜플 배열의 길이와 타입이 고정된다.
let tuple1:[string, number, string] = ['hi',1,'12'];

// error TS2322: Type '[string, number, string]' is not assignable to type '[string, number]'. Source has 3 element(s) but target allows only 2.
// let tuple2:[string, number] = ['hi',1,'12']; 

// any
// 아무 타입이나 허용
let any1:any = '12';
any1 = 123;
let any2:any = 12;
any2 = [];
let any3:any = true;
let any4:any = ['홍길동',123];
let any5:any = {name:'name'};

// null 빈값
// undefined 정의되지 않은 값
// strict 옵션에 따라 사용 여부가 결정된다.
let empty:null = null;
// /let empty1:null = '12'; // error TS2322: Type '"12"' is not assignable to type 'null'.
let undefine:undefined;
// let undefine:undefined = null; //error TS2322: Type 'null' is not assignable to type 'undefined'.


// function
function test(word: any): void{
    console.log(word);
    
}

function sayHi(word:string):string{
    console.log('type', typeof word);
    
    return word;
}
console.log('sayHi type', typeof sayHi('1'));
// console.log('sayHi type', typeof sayHi('1','12')); // error TS2554: Expected 1 arguments, but got 2.

// optional
function sayName(firstName: string, lastName?: string): string{
    return firstName + ' ' + lastName;
}
console.log(sayName('hong'));
console.log(sayName('hong','gildong'));
