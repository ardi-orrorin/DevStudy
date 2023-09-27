// 인덱스 시그니처
interface User {
    name: string;
    age: number;
}

// 상속 가능
interface Userinfo extends User {
    phone: number;
    address?: string; // optional 처리 가능
}

let test1: User = {name: '123', age: 13};
console.log(test1);

let test1info: Userinfo = {phone: 123, address: '서울', ...test1};
let test2info: Userinfo = {phone: 1233, ...test1};
console.log(test1info);
console.log(test2info);


// function
function addDetail(user: User): Userinfo{
    return {phone: 123, address:'경기도', ...user};
}

let test3info: Userinfo = addDetail(test1);
console.log(test3info);


interface Cache {
    cache: number;
}
interface Id {
   id: string;
}
interface Password {
   password: string;
}

interface Account extends User, Cache, Id, Password {}


let account1: Account = {
    name: '홍길동', age: 123, id: 'hong', password: '123123', cache: 10000,
};
console.log(account1);


// 배열 인덱싱 타입 정의
interface StringArray {
    [index: number]: string;
}

let com: StringArray = ['상섬','애플','샤오미'];
console.log(com[1]);

// 객체 인덱싱 타입 정의
interface SalaryMap {
    [level: string]: number;
}

let salary: SalaryMap = {
    junior: 100,
    export: 200,
    high: 300,
}

console.log(salary['junior']);

interface MoneyMap {
    [money: number]: string;
}

let money = {
    100: 'apple',
    200: 'samsung',
    300: 'lg'
}

console.log(money[100]);

// 인덱스 시그니처
interface User1 {
    [property: string]: string;
    name: string;
    id: string;
}

let user1: User1 = {
    name: '123',
    id: '123',
}
console.log(user1['name']);


