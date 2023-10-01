// 클래스 접근제어자 public, private, protected

// public
// 클래스 안에서 선언된 속성과 메서드를 어디서든 접근할 수 있다.
class Public {
    public name:string;

    constructor(name: string){
        this.name = name;
    }

    public print(): void{
        console.log(this.name);
    }
}

let test1: Public = new Public('홍길동');
console.log(test1.name);
test1.print();


// private
// 클래스 코드 외부에서 클래스의 속성과 메서드를 접근할 수 없다.
// ECMA2020에서 private -> # 으로 표현 가능 #name:string
// typescript 3.8 버전 부터 사용 가능


class Private {
    private name: string;
    #skill: string

    constructor(name: string, skill: string){
        this.name = name;
        this.#skill = skill
    }
    private print():void {
        console.log(this.name);
        console.log(this.#skill);
    }
}

let test2: Private = new Private('심사일당','스킬');
console.log(test2);
// test2.name = '심사';
// test2.#skill = '스킬2';
// test2.print(); // 접근 불가


// protected
// 클래스 외부에서는 사용이 불가능 하지만 상속받은 클래스에서는 사용이 가능하다
// 상속받은 클래스를 통해 부모 클래스 접근 가능
class Protected {
    protected name: string;

    constructor(name: string){
        this.name = name;
    }

    protected print(): void {
        console.log('Protected', this.name);
    }
}

class ExProtected extends Protected {
    skill: string;

    constructor(name: string, skill: string){
        super(name);
        super.print();
        this.skill = skill;
    }

    print():void {
        console.log('ExProtected', this.name);
        console.log('ExProtected', this.skill);
    }
}

let test3: ExProtected = new ExProtected('홍길동', '스킬');
console.log(test3.skill);
test3.print();

