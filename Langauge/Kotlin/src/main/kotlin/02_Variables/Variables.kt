package `02_Variables`

fun main() {
    // 변수 선언
    // var : 변경 수정 가능 변수
    // val : 변경 불가 상수

    var gilDong: String = "홍길동";
    val gilSoon: String = "홍길순";

    gilDong = "김길동";
//    gilSoon = "김길순"; // error 변경 불가

    println(gilDong)
    println(gilSoon)
}