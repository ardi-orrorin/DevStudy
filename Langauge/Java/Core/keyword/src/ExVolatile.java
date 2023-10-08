public class ExVolatile {
    public static void main(String[] args) {

        // volatile 란?
        // java 변수를 Main Memory 저장하겠다는 것을 명시하는 키워드
        // 매번 변수의 값을 호출할 때 CPU Cache에 저장되는 것이 아닌 Main Memory에서 읽거나 쓰는 것
        // 사용처 : 주로 Multi Thread환경에서 하나의 스레드 별로 사용 조건이 다른 경우 적합
        // ex : thread1 : read & write, thread2 : read, thread3 : write
        // Main Memory를 사용하므로 리소스 비용이 CPU Cache보다 많아 멀티스레드 환경에서 변 수의 값 일치를 보장해야할 경우 사용
        // 즉 멀티스레드 환경에서 변수의 원자성을 보장해야할 때 사용

        volatile int counter = 0;

    }
}
