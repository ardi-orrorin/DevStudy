
// 숫자형 enum type
enum ShoesBrand {
    Nike,
    Adidas,
    NewBalance
}

let myShoes: ShoesBrand = ShoesBrand.Adidas;
console.log(myShoes);
console.log(ShoesBrand[myShoes]);


// 문자형 enum type
enum Direction {
    Up = 'Up',
    Down = 'Down',
    Left = 'Left',
    Right = 'Right',
}

let dir = Direction.Down;
console.log(dir);


// 혼합 enum type
enum Answer {
    yes = 'Yes',
    No = 0
}

let no = Answer.No;
let yes = Answer.yes;
console.log(no, yes);


// 다양한 enum type
enum Authorization {
    User,
    Admin,
    SuperAdmin = User + Admin,
    God = 'abc'.length
}

let user = Authorization.User;
let admin = Authorization.Admin;
let superadmin = Authorization.SuperAdmin;
let god = Authorization.God;
console.log(user, admin, superadmin, god);

// const enum
enum logLevel { // js compile 시 function을 생성하는 식으로 컴파일 됨
    Debug = 'Debug',
    Info = 'Info',
    Error = 'Error',
}

const enum logLevel1 { // js complie 시 function을 생성하지 않고 값만 변수에 대입
    Debug = 'Debug',
    Info = 'Info',
    Error = 'Error',
}