// 용어 정리

`` // 템플릿 문자열
let string = '문자열'
let template = `템플릿 ${string}`

// 구조분해 할당 1
const candyMachine = {
    status: {
        name: 'node',
        count: 5,
    },
    getCandy(){
        this.status.count--;
        return this.status.count;
    }
}

const {getCandy, status:{ count }} = candyMachine;
console.log(count);
console.log(getCandy());

// 구조분해 할당 2
let array = ['node',{},10,true];
const [node,object,int,bool] = array;
console.log(node);
console.log(object);
console.log(int);
console.log(bool);

