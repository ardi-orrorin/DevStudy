package tutorial;

import org.slf4j.Logger;

import reactor.core.publisher.Flux;
import reactor.core.scheduler.Scheduler;
import reactor.core.scheduler.Schedulers;

public class DoOnNextTest {

    private static Logger log = org.slf4j.LoggerFactory.getLogger(DoOnNextTest.class);

    public static void main(String[] args) {
        Flux.range(1, 5)
                .parallel()
                .runOn(Schedulers.parallel())
                .map(i -> i <= 3 ? multiplyByTen(i) : i)
                .reduce((prev, next) -> prev + next)
                .log()
                .subscribe();

    }

    public static int multiplyByTen(int i) {
        return i * 10;
    }
}
