// Sequnces
/*

*/

fun main() {
    val numbers = sequenceOf("four", "three", "two", "one")
    println(numbers.take(2).toList())

    val oddNumbers = generateSequence(2) { it + 2 }
    println(oddNumbers.take(5).toList())
    // println(oddNumbers.count()) // error Count overflow has happened.
    // 무한한 시퀀스이기 때문에 count를 사용할 수 없다.

    // 유한한 시퀀스를 만들고 싶다면, null을 반환하는 람다를 사용하면 된다.
    val oddNumbersLessThan10 = generateSequence(1) { if (it + 2 < 10) it + 2 else null }
    println(oddNumbersLessThan10.count()) // 5

    // yierld(), yieldAll() 함수는 스퀸스를 반환하고 다음 요청이 있을 때까지 sequence를 일시 중단한다.
    // yield()는 단일 요소를 인자로 받고, yieldAll()은 iterable , sequence를 인자로 받는다.

    val oddNumbers2 = sequence {
        yield(1)
        yieldAll(listOf(3, 5))
        yieldAll(generateSequence(7) { it + 2 })
    }
    print(oddNumbers2.take(5).toList()) // [1, 3, 5, 7, 9]

    // Sequence Operations
    val words = "The quick brown fox jumps over the lazy dog".split(" ")
    val lengthsList =
            words
                    .filter {
                        println("filter: $it")
                        it.length > 3
                    }
                    .map {
                        println("length: ${it.length}")
                        it.length
                    }
                    .take(4)
    println("Lengths of first 4 words longer than 3 chars:")
    println(lengthsList)

    val wordsSequence = words.asSequence()
    val lengthsSequence =
            wordsSequence
                    .filter {
                        println("filter: $it")
                        it.length > 3
                    }
                    .map {
                        println("length: ${it.length}")
                        it.length
                    }
                    .take(4)
    println("Lengths of first 4 words longer than 3 chars")
    println(lengthsSequence.toList())
}
