// string 타입 추론
let nameText = '문자열';

// 타입 단언
let nameText2 = '홍길동' as string;
let nameText3 = 1 as any as string;
console.log(typeof nameText2, nameText2);
console.log(typeof nameText3, nameText3);


// not Null 보장 연산자 !
function isExist(text: string | null): number{
    return text!.length;
}

console.log(isExist(null));
