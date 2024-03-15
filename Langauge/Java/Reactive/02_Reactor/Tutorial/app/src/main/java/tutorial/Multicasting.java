package tutorial;

import java.time.Duration;

import org.slf4j.Logger;

import reactor.core.publisher.ConnectableFlux;
import reactor.core.publisher.Flux;

public class Multicasting {

    private static Logger log = org.slf4j.LoggerFactory.getLogger(Multicasting.class);

    public static void main(String[] args) throws InterruptedException {
        ConnectableFlux<Integer> flux = Flux.range(1, 100)
                .delayElements(Duration.ofMillis(300))
                .publish();

        Thread.sleep(500L);
        flux.subscribe(data -> log.info("Subscriber 1 : {}", data));

        Thread.sleep(200L);
        flux.subscribe(data -> log.info("Subscriber 2 : {}", data));

        flux.connect();

        Thread.sleep(1000L);
        flux.subscribe(data -> log.info("Subscriber 3 : {}", data));

        Thread.sleep(2000L);

    }
}
