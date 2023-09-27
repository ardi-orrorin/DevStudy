// 타입 별칭
// 특정 타입이나 인터페이스 등을 참조할 수 있는 타입 변수를 의미

type Myname = string;
let sc: Myname = '문자열';
// let te: Myname = 123; // error


type Message = string | number;
function logText(text: Message): void{
    console.log(text);
}

let message = '문자열'
logText(message);

// 타입 별칭으로만 정의 할 수 있는 타입
type Name = string; // 타입별칭
type DateString = Date | string; // 유니온 타입 
type BodyString = Name & DateString; // 인터섹션 타입
type Admin = {name: string, age: number; role: string;} // 객체 타입
type OnlyName = Pick<Admin, 'name'> 

// 맵드 타입
type Picker <T, K extends keyof T> = {
    [P in K]: T[P];
};



