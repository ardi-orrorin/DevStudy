# Gateway Predicate Facttories

## Overview
요청을 실행하거나 처리하기 전에 요청이 조건 집합을 충족하는지 확인하는 객체

| Predicate  | description                                                   | example                                                                                     |
|------------|---------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| Before     | 설정된 일시 전에 발생한 요청인지 확인                                         | before=2017-01-20T17:42:47.789-07:00[Seoul/Asia]                                            |
| After      | 설정된 일시 이후에 발생한 요청인지 확인                                        | after=2017-01-20T17:42:47.789-07:00[Seoul/Asia]                                             |
| Between    | 설정된 두 일시 사이에 발생한 호출인지 확인 시작은 (이상)[포함] 끝은 (미만)[비포함]            | between=2017-01-20T17:42:47.789-07:00[Seoul/Asia],2017-01-20T17:42:47.789-07:00[Seoul/Asia] |
| Header     | 헤더 이름과 정규식 매개변수를 사용하여 해당 값과 정규식을 확인                           | header=Host, example.com                                                                    |
| Host       | "." 호스트 이름 패턴으로 구분된 안티-스타일 패턴을 매개변수로 받아 host 헤더를 주어진 패턴과 비교   | host=**.example.**com                                                                       |
| Method     | HTTP 메서드(verb)를 비교한다.                                         | Method=GET                                                                                  |
| Path       | 스프링 PathMatcher를 사용한다.                                        | Path=/hamony/**                                                                             |
| Query      | 필수 매개변수와 정규식 매개변수를 사용하여 쿼리 매개변수와 비교한다.                        | Query=foo, ba.                                                                             |
| Cookie     | 쿠키 이름과 정규식 매개변수를 사용하여 HTTP 요청 헤더에서 쿠키를 차아 그 값과 정규식이 일치하는 지 비교 | Cookie=SessionID, abc|
| RemoteAddr | IP 목록에서 요청의 원격주소와 비교한다                                        | RemoteAddr=192.168.0.1/24|


```yaml
predicates:
    - Path=/foo/**
    - Method=GET
    - Query=foo, ba.
    - Cookie=SessionID, abc
    - Header=X-Request-Id, \d+
    - Host=**.example.kr,**.example.kr
    - RemoteAddr=192.168.0.4/24
```


# GateWay Filter Factories
정책 시행 지점(PEP)을 삽입하여 모든 서비스 호출에 대해 일관ㄷ된 방식으로 작업을 수행하며
이런한 필터로 수발신하는 HTTP의 요청과 응답을 수정할 수 있다.

| Filter              | description                                             | example                                          |
|---------------------|---------------------------------------------------------|--------------------------------------------------|
| AddRequestHeader    | 매개 변수로 받은 이름과 값을 HTTP 요청 헤더에 헤더를 추가한다.                  | addRequestHeader=X-Request-Foo, Bar              |
| AddRsponseHeader    | 매개 변수로 받은 이름과 값을 응답 헤더에 헤더를 추가한다.                       | addResponseHeader=X-Response-Foo, Bar            |
| AddRequestParameter | 매개 변수로 받은 이름과 값을 HTTP 쿼리 매개변수에 추가한다.                    | addRequestParameter=foo, bar                     |
| PrefixPath          | HTTP 요청 경로에 접두사를 추가한다.                                  | prefixPath=/api                                  |
| RequestRatelimiter  | replenisRate: 초당 허용된 요청수를 나타낸다.<br/>capacity: 폭증 허용 용량을 정의한다.<br/>Resolver 인터페이스를 구현하는 bean 이름을 정의한다.                         | RequestRateLimiter =10, 20, #{@userKeyResolver}  |
| RedirectTo          | HTTP 상태 코드와 URL을 받는다. 상태 코드는 300 Redirect HTTP 코드가 되어야 한다. | RedirecTo=302, http://example.org                |
| RemoveNonProxy      | KeepAlive, Proxy-Authenticate, Proxy-Authorization 같은 헤드를 제거한다. | NA                                               |
| RemoveRequestHeader | 매개 변수로 받은 이름과 값을 HTTP 요청 헤더에서 제거한다.                  | removeRequestHeader=X-Request-Foo                |
| RemoveResponseHeader| 매개 변수로 받은 이름과 값을 HTTP 응답 헤더에서 제거한다.                  | removeResponseHeader=X-Response-Foo              |
| RewritePath         | 정규식을 사용하여 HTTP 요청 경로를 다시 작성한다.                          | rewritePath=/foo/(?<segment>.*), /bar/${segment} |
| SecureHeaders | 응답에 secure header를 추가하고 요청 경로를 수정할 경로 템플릿 매개변수로 받는다. | NA                                               |
| SetPath| 매개변수로 경로 템플릿을 받는다. 경로애 대한 템플릿화된 세그먼트로 요청 경로를 조작한다. <br/> 스프링 프레임워크의 URI템플릿을 사용하며, 복수로 매칭되는 세그먼트가 허용된다. | SetPath=/foo/{segment}                           |
| SetStatus | 유효한 HTTP 상태 코드를 받고 응답 상태 코드를 수정한다. | SetStatus=500                                    |
| SetrequestHeader | 매개변수로 받은 이름과 값을 HTTP 요청 헤더를 설정한다. | setRequestHeader=X-Request-Foo, Bar              |