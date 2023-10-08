public class ExSynchronized {

    private int count = 0;

    public static void main(String[] args) {
        // 스레드 동기화란?
        // 멀티스레드 환경에서 여러 스레드가 하나의 공유자원ㄴ에 동시에 접근하지 못하도록 막는 것
        // 공유데이터가 사용되어 동기화가 필요한 부분을 임계영역(Critical Section)이라 부르며,
        // 이 임계영역에 synchronized 키워드를 사용하여 여러 스레드가 동시에 접근하는 것을 금지함으로써
        // 동기화를 할 수 있다.

        StringDisplay sd = new StringDisplay();
        MyThread[] mtd = new MyThread[5];
        for (int i = 0; i < mtd.length; i++) {
            mtd[i] = new MyThread(sd, Integer.toString(i));
            mtd[i].run();
        }

        SharedThread[] mst = new SharedThread[5];
        for (int i = 0; i < mst.length; i++) {
            mst[i] = new SharedThread();
            mst[i].run();
        }

    }

    // 메소드에서 synchronized 사용 기본
    // synchronized void increase() {
    // count++;
    // System.out.println(count);
    // }

    void increase() {
        synchronized (this) { // 참조변수 객체의 lock를 사용
            count++;
        }
        System.out.println(count);
    }

}

class StringDisplay {
    synchronized void display(String str) {
        for (int i = 0; i < 5; i++) {
            System.out.print(str);
        }
        System.out.println("");
    }
}

class MyThread extends Thread {
    StringDisplay sd;
    String str = "";

    public MyThread(StringDisplay sd, String str) {
        this.sd = sd;
        this.str = str;
    }

    @Override
    public void run() {
        sd.display(this.str);
    }
}

class SharedThread extends Thread {
    public static int number = 0; // 데이터 공유됨
    public static Object lock = new Object();

    @Override
    public void run() {
        synchronized (lock) {
            for (int i = 0; i < 10; i++) {
                number += 1;
                System.out.print(i);
            }
            System.out.println(": " + number + " - " + this.getName() + " - " + lock.hashCode());
        }

    }

}