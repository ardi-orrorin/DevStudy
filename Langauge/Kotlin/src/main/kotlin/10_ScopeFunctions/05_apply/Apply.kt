package `10_ScopeFunctions`.`05_apply`

// Apply
// Context Object를 this로 참조한다.
// 리턴값은 Obejct 자신을 반환한다.
// 컨텍스트 객체 자체를 반환하므로 객체에 다음 내용을 적용한다로 생각하면 된다.


class Person(var name: String ){
    var age: Int = 0
    var city: String = ""

    override fun toString(): String {
        return "Person(name='$name', age=$age, city='$city')"
    }

}
fun main() {
    val adam = Person("adam").apply {
        age = 32
        city = "London"
    }

    val gildong = Person("gildong")

    println(adam)
    println(gildong)

}