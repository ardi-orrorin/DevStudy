
package mono;

import java.util.ArrayList;
import java.util.List;

import reactor.core.publisher.Flux;

public class App {
    public static void main(String[] args) throws InterruptedException {
        List<Long> test1 = new ArrayList<>();

        for (long i = 0; i < 60000000; i++) {
            test1.add(i);
        }
        int i = 0;
        while (i < 10) {
            test01(test1);
            i++;
        }

        // test02();

    }

    static void test01(List<Long> test1) throws InterruptedException {
        Long startTime = 0L;
        Long endTime = 0L;

        Flux<Long> test = Flux.fromIterable(test1);

        Thread.sleep(5000);

        startTime = System.currentTimeMillis();
        test1.forEach(e -> {
        });
        test1.forEach(e -> {
        });
        test1.forEach(e -> {
        });
        endTime = System.currentTimeMillis();
        System.out.println("------------------");
        System.out.println("list : " + (endTime - startTime));
        System.out.println("------------------");

        Thread.sleep(5000);

        startTime = System.currentTimeMillis();
        Flux.just(test1.toArray())
                // .buffer(10)
                .doOnNext(e -> {
                    // e.subscribe(e1 -> {
                    // System.out.println("doOnNext1 : " + e);
                    // });
                }).doOnNext(e -> {
                    // e.subscribe(e1 -> {
                    // System.out.println("doOnNext2 : " + e);
                    // });
                }).subscribe(e -> {
                    // e.subscribe(e2 -> {
                    // System.out.println("subscribe : " + e);
                    // });
                });

        endTime = System.currentTimeMillis();
        System.out.println("------------------");
        System.out.println("stream : " + (endTime - startTime));
        System.out.println("------------------");

    }

    static void test02() {
        Flux.just("1", "2", "3").doOnNext(e -> {
            System.out.println(e);
        }).subscribe();
    }
}
