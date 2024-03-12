package tutorial;

import java.time.Duration;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

public class ExampleList {
    public static void main(String[] args) throws Exception {
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

        Mono<String> mono = Mono.just("one").map(e -> System.nanoTime() + "")
                .cache();

        mono.subscribe(e -> System.out.println("main 1 : " + e));
        Thread.sleep(3000);
        mono.subscribe(e -> System.out.println("main 2 : " + e));
        

    }
}
