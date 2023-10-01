function getText<T>(text:T): T{
    console.log(typeof text, text);
    return text;
}

console.log(getText<string>('123'));
console.log(getText<number>(123));
// console.log(getText<number>(true)); // 타입 에러

// interface 사용 예시

interface DropDown<T> {
    value: T,
    selected: boolean
}

let product: DropDown<string>;
let stock: DropDown<number>;
let address: DropDown<{city: string, detail: string}>;

