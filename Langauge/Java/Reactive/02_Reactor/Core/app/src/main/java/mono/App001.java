
package mono;

import java.util.ArrayList;
import java.util.List;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

public class App001 {
    public static void main(String[] args) throws InterruptedException {
        List<Long> test1 = new ArrayList<>();

        for (long i = 0; i < 90000000; i++) {
            test1.add(i);
        }
        int i = 0;
        while (i < 10) {
            test01(test1);
            // test02(test1);
            i++;
        }

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
        System.out.println("동기(ms) : " + (endTime - startTime));
        System.out.println("------------------");

        Thread.sleep(5000);

        startTime = System.currentTimeMillis();
        Flux.just(test1.toArray())
                .subscribeOn(Schedulers.newParallel("123", 10))
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
                }).dispose();

        endTime = System.currentTimeMillis();
        System.out.println("------------------");
        System.out.println("비동기(ms) : " + (endTime - startTime));
        System.out.println("------------------");

    }

    static void test02(List<Long> test) {

        Long startTime = 0L;
        Long endTime = 0L;

        Mono<List<Long>> test1 = Mono.just(test);

        startTime = System.currentTimeMillis();
        test1.doOnNext(e -> {
            e.forEach(e1 -> {
                System.out.println(e1);
            });
            // System.out.println("doOnNext : 1");
        }).doOnNext(e -> {
            e.forEach(e1 -> {
            });
            // System.out.println("doOnNext : 1");
        }).doOnNext(e -> {
            e.forEach(e1 -> {
            });
            // System.out.println("doOnNext : 1");
        }).subscribe(e -> {
            e.forEach(e1 -> {
            });
            // System.out.println("subscribe : 1");
        }).dispose();
        endTime = System.currentTimeMillis();
        System.out.println("Mono : " + (endTime - startTime));
        System.out.println("------------------------------");

        startTime = System.currentTimeMillis();
        test.forEach(e -> {
        });
        test.forEach(e -> {
        });
        test.forEach(e -> {
        });
        test.forEach(e -> {
        });
        endTime = System.currentTimeMillis();
        System.out.println("List : " + (endTime - startTime));
        System.out.println("------------------------------");

    }
}
