package com.db.plugins

import com.db.router.diaryRouting
import io.ktor.server.application.*
import io.ktor.server.auth.*
import org.slf4j.LoggerFactory


fun Application.authenticationConfig() {
    val log = LoggerFactory.getLogger(this.javaClass)
    install(Authentication) {
        bearer("auth") {
            log.info("res")
            realm = "/diary/test123"
            authenticate {
                log.info("[{}]({}) : {}: {}",
                    object{}.javaClass.enclosingClass.name,
                    object{}.javaClass.enclosingMethod.name,
                    "this", this
                )

                log.info("[{}]({}) : {}: {}",
                    object{}.javaClass.enclosingClass.name,
                    object{}.javaClass.enclosingMethod.name,
                    "it", it
                )

                // it.token 을 jwt 검증
                // token에서 userID 찾고
                // id 검증 후
                // UserIdPrincipal 객체 넣고
                // 라우트 이동

                UserIdPrincipal("test")

          }
      }
  }
}