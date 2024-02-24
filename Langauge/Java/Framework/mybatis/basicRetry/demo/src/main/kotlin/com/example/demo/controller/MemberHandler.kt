package com.example.demo.controller


//@Configuration
//@EnableWebFlux
//class MemberHandler {
////    @Bean
//    fun memberRouter(): RouterFunction<ServerResponse> = coRouter {
//        GET("/members", accept(MediaType.TEXT_PLAIN)) { ServerResponse.ok().bodyValueAndAwait("hello world" ) }
//    }
//}

//@Component
//class MemberHandler(
//    private val memberRepository: MemberRepository
//) {
//    fun selectAll(request: ServerRequest): Mono<ServerResponse> {
//        return ServerResponse.ok().body(memberRepository.findAll())
//    }
//}
