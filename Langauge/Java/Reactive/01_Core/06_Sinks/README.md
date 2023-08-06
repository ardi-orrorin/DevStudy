# Sinks
리액티브 스트림즈의 Signal을 프로그래밍 방식으로 푸시할 수 있는 구조이며 Flux 또는 mono 의미 치계를 가진다.

Flux 또는 Mono가 같은 Signal을 내부적으로 전송해주는 방식인 반면, Sinks는 프로그래밍 코드를 통해 명시적으로 Signal을 전송할 수 있다.

일반적으로 generate(), create() Operator는 싱글스레드 기반에 Signal을 전송하는 데 사용하는 반면, Sinks는 멀티스레드 방식으로 Signal을 전송해도 스레드 안전성을 보장하기 때문에 예기치 않는 동작으로 이어지는 것을 방지 해준다.



