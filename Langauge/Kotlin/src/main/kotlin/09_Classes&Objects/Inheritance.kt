package `09_Classes&Objects`

// 상속
// 코틀린에서 상속은 superClass(부모) subClass(자식)으로 정의한다

// superClass
// 상속을 가능하게 위해 open 키워드 사용
open class ParentClass {
    var x = 5
}

class ChildClass: ParentClass() {
    fun print() {
        println("child : " + x)
    }
}

fun main() {
    val parent: ParentClass = ParentClass()
    println("parent : " + parent.x)

    parent.x = 10 // 상속 받는 개체에 영향을 미치지 않는다.

    val  child: ChildClass = ChildClass()
    child.print()

    println("=== parent x value update ===")

    println("parent : " + parent.x)
    child.print()

}
