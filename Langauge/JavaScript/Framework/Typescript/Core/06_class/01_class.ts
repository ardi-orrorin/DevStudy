// javascript와 다르게 클래스 생성자 생성시 미리 변수를 선언해야 한다.


// javascript 버전
// class Javascript {
//     constructor(name, skill){
//         this.name = name;
//         this.skill = skill;
//     }
// }


// typescript 버전
class Person {

    name: string;
    skill: string;

    constructor(name: string, skill: string){
        this.name = name;
        this.skill= skill;
    }

    sum(a: number, b: number): number{
        return a + b;
    }
}

let user1 = new Person('유저1','없음');
console.log(user1.name);
console.log(user1.skill);
console.log(user1.sum(1,2));

