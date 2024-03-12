package tutorial;

import java.util.List;
import java.util.logging.Logger;

import org.checkerframework.checker.units.qual.s;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Sinks;
import reactor.core.scheduler.Scheduler;
import reactor.core.scheduler.Schedulers;

public class SinksApp {

    private static Logger log = Logger.getLogger(SinksApp.class.getName());

    public static void main(String[] args) throws InterruptedException {
        int tasks = 20;

        // Flux.create(sink -> {
        // for (int i = 0; i < tasks; i++) {
        // sink.next(i);
        // }
        // sink.complete();
        // })
        // .subscribeOn(Schedulers.boundedElastic())
        // .doOnNext(e -> log.info("create : {}", e.toString()))
        // .publishOn(Schedulers.parallel())
        // .map(result -> result + "success")
        // .doOnNext(e -> log.info("success : {}", e.toString()))
        // .publishOn(Schedulers.parallel())
        // .subscribe();

        // Thread.sleep(100L);

        // Sinks.Many<String> sink = Sinks.many().unicast().onBackpressureBuffer();
        // Flux<String> flux = sink.asFlux();
        // for (int i = 0; i < tasks; i++) {
        // String integer = String.valueOf(i);
        // new Thread(() -> {
        // sink.emitNext("success " + integer, Sinks.EmitFailureHandler.FAIL_FAST);
        // System.out.println("success" + Thread.currentThread().getName());
        // }).start();
        // Thread.sleep(500L);
        // }

        // flux.publishOn(Schedulers.parallel())
        // .map(result -> result + " success")
        // .doOnNext(e -> System.out.println("result : " + e))
        // .publishOn(Schedulers.parallel())
        // .subscribe(data -> System.out.println("end : " + data));

        // Thread.sleep(50L);

        Sinks.Many<String> sink = Sinks.many().multicast().onBackpressureBuffer();
        int multi = 10;
        for (int i = 0; i < multi; i++) {
            new Thread() {
                public void run() {
                    String name = Thread.currentThread().getName();
                    sink.emitNext("success" + name, Sinks.EmitFailureHandler.FAIL_FAST);
                    System.out.println("success" + name);
                }
            }.start();
            Thread.sleep(10L);

        }

        Flux<String> flux = sink.asFlux();

        flux
                // .fromIterable(List.of("Hello", "World", "/", "df"))
                .publishOn(Schedulers.parallel())
                .map(result -> result + "success")
                .doOnNext(result -> System.out.println(result))
                .subscribeOn(Schedulers.parallel())
                .subscribe();

        Thread.sleep(1000L);
    }
}
