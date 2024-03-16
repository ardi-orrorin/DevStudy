package tutorial;

import java.time.Duration;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Hooks;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Scheduler;
import reactor.core.scheduler.Schedulers;

public class ExampleList {

    private static final Logger log = org.slf4j.LoggerFactory.getLogger(ExampleList.class);

    public static void main(String[] args) throws Exception {
        Hooks.onOperatorDebug();
        // Flux.concat(
        // Flux.just("one", "two", "three"),
        // Flux.just("four", "five", "six"),
        // Flux.just("seven", "eight", "nine"))
        // .collectList()
        // .subscribe(System.out::println);

        // Flux<String> flux1 = Flux.just("one", "two", "three");
        // flux1.log().subscribe();

        // System.out.println("sdfsdf");

        // flux1.log().subscribe();

        // Flux<String> flux2 = Flux.just("four", "five", "six")
        // .delayElements(Duration.ofSeconds(1))
        // .share();

        // flux2.subscribe(e -> System.out.println("main 1 : " + e));

        // Thread.sleep(2000);

        // flux2.subscribe(e -> System.out.println("main 2 : " + e));

        // Thread.sleep(2500);

        // Mono<String> mono = Mono.just("one").map(e -> System.nanoTime() + "")
        // .cache();

        // mono.subscribe(e -> System.out.println("main 1 : " + e));
        // Thread.sleep(3000);
        // mono.subscribe(e -> System.out.println("main 2 : " + e));

        List<Integer> list = Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9);

        for (int i = 0; i < 3; i++) {
            Flux.fromIterable(list)
                    .doOnNext(e -> log.info("iterable oOnNext: {}", e))
                    // .log()
                    .publishOn(Schedulers.parallel())
                    .map(e -> e * 10)
                    .doOnNext(e -> log.info("map1 doOnNext: {}", e))
                    .publishOn(Schedulers.parallel())
                    .map(e -> e + 10)
                    .doOnNext(e -> log.info("map2 doOnNext: {}", e))
                    .publishOn(Schedulers.parallel())

                    .subscribe(e -> log.info("complete: {}", e));
        }

        // Thread.sleep(1000);

    }
}
