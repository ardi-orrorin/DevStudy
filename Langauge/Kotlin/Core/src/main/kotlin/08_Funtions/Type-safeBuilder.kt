package `08_Funtions`

import javax.swing.text.html.*

fun main() {
    fun html(init: HTML.() -> Unit): HTML {
        val html = HTML()
        html.init()
        return html
    }

    fun head(init: Head.() -> Unit): Head {
        val head = Head()
        head.init()
        return head
    }

    fun body(init: Body.() -> Unit): Body {
        val body = Body()
        body.init()
        return body
    }
}
