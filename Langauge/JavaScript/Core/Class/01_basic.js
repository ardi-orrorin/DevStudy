class Person {}

const Person1 = class {};
const Person2 = class Class {};


console.log(Person); // [class Person]
console.log(Person1); // [class Person1]
console.log(Person2); // [class Class]


// Es5 constructor function
const Es5Person = (function(){

    // 생성자 함수
    function Es5Person(name){
        this.name = name;
    }

    // 프로토타입 메서드
    Es5Person.prototype.myName = function(){
        return this.name;
    };

    return Es5Person;
}()); // 즉시 실행 함수로 Es5Person 생성자 함수를 감싸서 반환함

const es5Person = new Es5Person('es5 function class'); 
console.log(es5Person.myName()); // es5 function class

class Es6Class {
    constructor(name){
        this.name = name;
    }

    myName(){
        console.log(this.name);
    }

    static Hello(){
        console.log('Hello') 
    }
}


const es6Class = new Es6Class('es6 class');
es6Class.myName(); // es6 class
es6Class.Hello(); // Hello
Es6Class.Hello(); // Hello




