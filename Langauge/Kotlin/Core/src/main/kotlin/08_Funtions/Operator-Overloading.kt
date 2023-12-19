package `08_Funtions`

data class Point(
        val x: Int,
        val y: Int,
)

data class Bool(
        val x: Boolean,
        val y: Boolean,
)

/*
   Unary operators
   +a	a.unaryPlus()
   -a	a.unaryMinus()
   !a	a.not()
   a++	a.inc() (a를 증가시키고 a를 반환)
   a--	a.dec() (a를 감소시키고 a를 반환)
*/
operator fun Point.unaryMinus() = Point(-x, -y)

operator fun Point.unaryPlus() = Point(+x, +y)

operator fun Bool.not() = Bool(!x, !y)

operator fun Point.inc() = Point(x + 2, y + 2)

operator fun Point.dec() = Point(x - 2, y - 2)

val point = Point(10, 20)
val pointplus = Point(-10, -20)
val bool = Bool(true, false)
var pointinc = Point(10, 20)
var pointdec = Point(10, 20)

fun main() {
    println(-point) // prints "Point(x=-10, y=-20)"
    println(+pointplus) // prints "Point(x=20, y=40)"
    println(!bool) // prints "Point(x=false, y=true)"
    println(pointinc++) // prints "Point(x=10, y=20)"
    println(pointinc) // prints "Point(x=12, y=22)"
    println(pointdec--) // prints "Point(x=10, y=20)"
    println(pointdec) // prints "Point(x=8, y=18)"
}

/*
    basic operators
    a + b	a.plus(b)
    a - b	a.minus(b)
    a * b	a.times(b)
    a / b	a.div(b)
    a % b	a.rem(b), a.mod(b) (deprecated)
    a..b	a.rangeTo(b)
    a..<b   a.rangeUntil(b)
*/
