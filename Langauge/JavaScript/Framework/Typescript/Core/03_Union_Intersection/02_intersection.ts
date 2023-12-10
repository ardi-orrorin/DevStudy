interface Avenger {
    name: string
}

interface Hero {
    skill: string
}
interface Extra {
    body: string
}


// intersection
// 2개 이상의 타입을 하나로 합쳐서 사용할 수 있는 타입
function introduceIntersection(somone: Avenger & Hero & Extra){
    console.log(somone.name);
    console.log(somone.skill);
    console.log(somone.skill);
    
}
introduceIntersection({name:'name', skill:'123', body:'1223'});