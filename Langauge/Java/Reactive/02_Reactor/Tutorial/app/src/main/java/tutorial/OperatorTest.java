package tutorial;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.stream.Stream;

import org.apache.commons.logging.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import reactor.core.publisher.Flux;
import reactor.core.scheduler.Scheduler;
import reactor.core.scheduler.Schedulers;

public class OperatorTest {

    private static Logger log = LoggerFactory.getLogger(OperatorTest.class);

    public static void main(String[] args) throws InterruptedException {

        // Flux.fromIterable(List.of("a", "bc", "ccc"))
        // .subscribe(data -> log.info("data : {}", data));
        // Path path = Paths.get(
        // "/Users/yuseungcheol/Desktop/DevStudy/Langauge/Java/Reactive/02_Reactor/Tutorial/app/src/test/resources/test.txt");

        // Flux.using(() -> Files.lines(path), Flux::fromStream, Stream::close)
        // .subscribe(log::info);

        Flux.generate(() -> 0, (state, sink) -> {
            sink.next(state);
            if (state == 10) {
                sink.complete();
            }
            return ++state;
        })
                // .parallel()
                // .runOn(Schedulers.boundedElastic())
                .subscribe(data -> log.info("data : {}", data));

        Thread.sleep(2000);

    }
}
