const target = 'Is thi1s all there is?';
const idExp = /[a-z]+[A-Z]+[0-9]+/
const validExp = /[a-z0-9]+[A-Z]/

console.log(idExp.test(target)); // false
console.log(validExp.test(target)); // true

console.log(/[[a-z]/.test(target)); // true
console.log(/[A-Z]/.test(target)); // true
console.log(/[0-9]/.test(target)); // true
console.log('id: ',/[a-zA-Z0-9]+$/.test(target));

// pattern
/*
    매칭 패턴
    a-z: 소문자
    A-Z: 대문자
    0-9: 숫자
    [a-z]: a-z 문자열
    [A-Z]: A-Z 문자열
    [0-9]: 0-9 문자열
    \d: 숫자
    \D: 숫자가 아닌 것
    \w: 문자, 숫자, _ [A-Za-z0-9_]와 동일
    \W: \w의 반대
    \s: 공백 문자
    \S: \s의 반대
    \특수문자 : \* \+ \? \. \^ \$ \[ \] \( \) \{ \} \| \\
    \b: 63개 문자 (영문 대소문자 52개 + 숫자 10개 + _(underscore))를 제외한 나머지 문자와 경계(boundary)
    \B: \b에서 말하는 63개의 문자
    \x: 16진수 /\x41/은 A와 동일
    \O: 8진수 /\0101/은 A와 동일
    \u: 유니코드 /\u0041/은 A와 동일
    \t: 탭
    \r: 캐리지 리턴
    \n: 라인 피드

    검색기준 패턴
    |: or
    []: 문자열 집합 [abc]는 a, b, c 중 하나
    [^]: 부정 [^abc]는 a, b, c가 아닌 문자열
    ^문자열: 문자열의 시작
    문자열$: 문자열의 끝

    갯수 패턴
    ? : 없거나 or 최대 한개만
    * : 없거나 or 하나 이상
    + : 최소 한 개 이상
    *? : 없거나, 있거나 and 없거나, 최대한개: 없음{0}와 동일
    +? : 최소 한 개 이상 and 최대 한 개 이상: 한개{1}와 동일
    {n} : n개
    {n,} : n개 이상
    {n, m} : n개 이상 m개 이하

    그룹 패턴
    (): 그룹 및 캡처
    (?:): 그룹만
    (?=): 앞쪽 일치
    (?!): 앞쪽 부정 일치
    (?<=): 뒤쪽 일치
    (?<!): 뒤쪽 부정 일치
    (?<name>): 이름 붙인 그룹
*/

// 그룹패턴
console.log('kokoko'.match(/(ko)+/)); // ['kokoko','ko']
console.log('koooookooooo'.match(/(ko)+/)); // ['ko','ko'] /g 플래그가 없어도 모두 찾음
// 위 ko가 추가로 찾아지는 이유는 캡처링 때문이다.
// 캡처링이란? 정규식에서 괄호로 감싼 부분을 말한다.

// 캡처링을 하지 않으려면 (?:)를 사용한다.
// 정상적으로 찾은 값만 반환된다.
console.log('kokoko'.match(/(?:ko)+/)); // ['kokoko']
console.log('koooookooooo'.match(/(?:ko)+/)); // ['ko']


