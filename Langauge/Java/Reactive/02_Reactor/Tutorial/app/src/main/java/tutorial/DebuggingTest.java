package tutorial;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Hooks;
import reactor.core.scheduler.Schedulers;

public class DebuggingTest {

    private static Logger log = LoggerFactory.getLogger(DebuggingTest.class);

    public static void main(String[] args) throws InterruptedException {
        Hooks.onOperatorDebug();

        Flux.fromIterable(List.of("a", "bc", "ccc"))
                .subscribeOn(Schedulers.boundedElastic())
                .publishOn(Schedulers.parallel())
                .map(String::toUpperCase)
                .map(e -> e.substring(0, e.length() - 1))
                .checkpoint()
                .subscribe(
                        log::info,
                        error -> log.error("Error: {}", error),
                        () -> log.info("Done"));

        Thread.sleep(2000);

    }
}
