// 클래스 호이스팅
// 클래스는 함수로 평간된다.

// 선언문
// class C {}
// console.log(typeof C); // function

// 클래스 선언문으로 정의한 클래스는 함순 선언문과 같이 소스코드 평가 과정, 런타임 이전에 머너 평가되어 함수 객체를 생성한다.

// console.log(C); // Cannot access 'C' before initialization
// class C {}
// 클래스 선언문은 호이스팅이 발생하지 않는 것 보이나 그렇지 않다.

const C = '1';

{
    // 호이스팅이 발생하지 않는 다면 1이 출력 되어야 한다.
    console.log(C); // Cannot access 'C' before initializatio

    // 하지만 초기화 전에 엑세스 할 수 없다는 에러가 발생한다.
    class C {}
}

// 즉 var, let, const ,function, function* class 키워드를 사용하여 선언된 모든 식별자는 호이스팅이 된다.



