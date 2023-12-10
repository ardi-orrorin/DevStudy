// 타입 가드
// 여러 개의 타입으로 지정된 값을 특정 위치에서 원하는 타입으로 구분하는 것
// 타입 시스템 관점에서는 넓은 타입에서 좁은 타입으로 범위를 좁힌다고 생각해도 된다,


// typeof 연산자를 사용한 타입 가드
function updateInput(value: string | number | boolean) {
    if(typeof value === 'string'){
        console.log(value.toUpperCase());
    } else if(typeof value === 'number'){
        console.log(value.toFixed(4));
    } else if(typeof value === 'boolean') {
        console.log(value.valueOf());
    }
}

updateInput('text');
updateInput(1001);
updateInput(true);

// 타입 단언을로 타입 에러 해결하기

function typeTest(input: number | string | boolean) {
    (input as number).toFixed(4);
    // (input as string).toUpperCase();
    // (input as boolean).valueOf();
}

typeTest(1004);

// 실행시점의 에러는 막을 수 없다.
// typeTest('test');
// typeTest(true);


// instanceof 연산자를 사용한 타입 가드

class Person {
    name: string;
    age: number;

    constructor(name: string, age: number) {
        this.name = name;
        this.age = age;
    }
}

class Car {
    brand: string;
    wheel: number;

    constructor(brand: string, wheel: number) {
        this.brand = brand;
        this.wheel = wheel;
    }
}

function sportsCar(profile: Person | Car): void {
    if(profile instanceof Person) {
        console.log('Person');
        
        console.log(profile.name);
        console.log(profile.age);
    } else if (profile instanceof Car) {
        console.log('Car');
        console.log(profile.brand);
        console.log(profile.wheel);
    }

    console.log(profile);
    
}

sportsCar(new Person('Mark', 36));
sportsCar(new Car('BMW', 4));


// in 연산자를 사용한 타입 가드
interface Person2 {
    name: string;
    age: number;
}

interface Car2 {
    brand: string;
    wheel: number;
}

function myTypeTest(input: Person2 | Car2) {
    if('name' in input){
        console.log(input.name);
        console.log(input.age);
    } else if ('brand' in input) {
        console.log(input.brand);
        console.log(input.wheel);
    }
}

myTypeTest({name: 'Lee', age: 40});
myTypeTest({brand: 'Ford', wheel: 10});


// function type guard is 연산자
function isPerson(x: Person2 | Car2): x is Person2  {
    return (x as Person2).name !== undefined;
}

function isCar(x: Person2 | Car2): x is Car2 {
    return (x as Car2).brand !== undefined;
}

function myTypeTest2(input: Person2 | Car2) {
    if(isPerson(input)){
        console.log(input.name);
        console.log(input.age);
    } else if (isCar(input)) {
        console.log(input.brand);
        console.log(input.wheel);
    }
}

myTypeTest2({name: 'Lee', age: 40});
myTypeTest2({brand: 'Ford', wheel: 10});


// switch 문을 사용한 타입 가드
interface Person3 {
    name: string;
    age: number;
    common: 'human';
}

interface Car3 {
    brand: string;
    wheel: number;
    common: 'car';
}

function myTypeTest3(input: Person3 | Car3) {
    switch(input.common) {
        case 'human':
            console.log(input.name);
            console.log(input.age);
            break;
        case 'car':
            console.log(input.brand);
            console.log(input.wheel);
            break;
        default:
            break;
    }
}

myTypeTest3({name: 'Lee', age: 40, common: 'human'});
myTypeTest3({brand: 'Ford', wheel: 10, common: 'car'});

