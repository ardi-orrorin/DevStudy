package `08_Funtions`


// 코틀린 1.3 버전 이전에는 java와 비슷하게 Array인수를 받도록 코드를 작성해야 했다.
//fun main(args: Array<String>) {
//
//}

// 코틀린 1.3 버전 이후 부터 main() 함수만 사용 가능하도록 되었다.
fun main() {
    test()
    params("테스트")
    multiParams("홍길동", 12)
    println("sum : " + sum(1,2).toString())
}

// 코틀린의 함수는 무조간 리턴을 해야한다.
fun test(): Unit { // 리턴값이 없을 경우 Unit 타입 지정
    println("테스트 함수입니다.")

}

// Single Parameter
fun params(name: String): Unit {
    println(name)
}

// Multi Parameter
fun multiParams(name: String , age: Int): Unit {
    println("이름 : " + name + ", 나이 : " + age.toString())
}

// Shorter Syntax for Return Values
fun sum (x: Int, y: Int) = x + y

