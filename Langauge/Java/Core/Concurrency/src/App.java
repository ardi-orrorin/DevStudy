public class App {
    public static void main(String[] args) throws Exception {
        // 쓰레드 생성
        // MyRunnable myRunnable = new MyRunnable();
        // Thread thread = new Thread(myRunnable);
        // 쓰레드 시작
        // thread.start();

        // counter
        Counter counter = new Counter();
        Thread thread1 = new Thread(() -> {
            for (int i = 0; i < 10000; i++) {
                counter.increment();
            }
        });
        Thread thread2 = new Thread(() -> {
            for (int i = 0; i < 10000; i++) {
                counter.decrement();
            }
        });
        thread1.start();
        thread2.start();
        thread1.join();
        thread2.join();

        // Counter 클래스의 메서드는 동시성을 지원하지 않는 메서드이기 때문에
        System.out.println(counter.getCount()); // 실행 시 마다 다른 값이 출력

        Counter2 counter2 = new Counter2();
        Thread thread3 = new Thread(() -> {
            for (int i = 0; i < 10000; i++) {
                counter2.increment();
            }
        });
        Thread thread4 = new Thread(() -> {
            for (int i = 0; i < 10000; i++) {
                counter2.decrement();
            }
        });

        thread3.start();
        thread4.start();
        thread3.join();
        thread4.join();

        System.out.println(counter2.getCount()); // 0으로 항상 같은 값이 출력됨

    }
}
