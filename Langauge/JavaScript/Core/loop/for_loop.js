// 1. for 문 : 고전적인 for 문
for(let i = 0; i < 10; i++) {
    console.log(i);
}

// 2. for in 문 : 객체의 속성을 순회
const obj = {
    name: 'Lee',
    age: 20,
    alive: true,
};

for (const key in obj) {
    console.log(key, obj[key]);
}

const arrObj = [
    { id: 0, name: 'Lee', age: 20 },
    { id: 1, name: 'Kim', age: 30 },
    { id: 2, name: 'Park',  age: 40 },
    { id: 3, name: 'Choi', age: 50 },
];

for (const key in arrObj) {
    console.log(`${key} : ${arrObj[key]}`);
}

// 3. for of 문 : 배열의 요소를 순회
const arr = [1, 2, 3];
for (const item of arr) {
    console.log(item);
}

// 4. in vs of
// in : 객체의 key를 순회
// of : 배열의 요소를 순회

for (const key in arrObj) {
    console.log(key);
}

for (const item of arrObj) {
    console.log(item);
}