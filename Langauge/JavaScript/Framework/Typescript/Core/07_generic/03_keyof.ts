// keyof란 특정 타입의 키 값을 추출해서 문자열 유이언 타입으로 변환해준다.

type keys = keyof {name: string; age: number;}



function printKey<T extends keys>(value: T): void { // name, age 문자열만 입력 가능
    console.log(value);
}


printKey('name');