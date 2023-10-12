package `11_Optional`


// 코틀린은 자료형은 기본적으로 non-null이다.
// nullable을 하기 위해서는 자료형에 ? 명시해야 한다.
fun main() {
    var a: String = "hello"
    a = "Goodbye"
//    a = null // error
    println(a)

    // Safe Call 안전 호출
    var b: String? = "hello" // 자료형? 표시로 nullable 되도록 변경
    b = "Goodbye"
    b = null // nullalbe
    println(b)

    // 단 메소드를 호출시 에러가 밣생한다.
//    println(b.length) // error
    println(b?.length)

    // 또다른 방법으로 ?: 표기법을 이용해서
    // left ?: right left의 값이 null 일경우 right을 대입하는 방법으로 null 처리를 하는 방법도 있다.
    var c: String = "hello"
    c = "Goodbye"
    c = null ?: "notNull"
    println(c)


    // null이 아닌 것을 강조하는 !!연산자 (not-null assertion operator)
    var d: String? = "hello"
    println(d?.length) // nullable null시 오류가 발생함
    println(d!!.length)  // notnull이라는 것을 강조한다.

    d = null
//    println(d!!.length) // 런타임 에러 발생

}