package tutorial;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import reactor.core.publisher.Flux;
import reactor.core.scheduler.Scheduler;
import reactor.core.scheduler.Schedulers;

public class SchedulerTest {

    private static Logger log = LoggerFactory.getLogger(SchedulerTest.class);

    public static void main(String[] args) throws InterruptedException {

        // Flux.just(1, 2, 3, 4, 5)
        // .doOnNext(e -> log.info("doOnNext : {}", e))
        // // .subscribeOn(Schedulers.boundedElastic())
        // .doOnSubscribe(e -> log.info("doInSubscribe : {}", e))
        // .publishOn(Schedulers.parallel())
        // .subscribe(data -> log.info("subscribe : {}", data));

        List<String> list = new ArrayList<>();

        for (int i = 0; i < 50; i++) {
            list.add(String.valueOf(i));
        }

        long start;
        long end;

        start = System.currentTimeMillis();

        Flux.fromIterable(list)
                // .parallel(1)
                // .runOn(Schedulers.parallel())
                // .subscribeOn(Schedulers.parallel())
                .parallel()
                .runOn(Schedulers.parallel())
                .map(e -> {
                    InnerSchedulerTest inner = new SchedulerTest().new InnerSchedulerTest(1);

                    for (int i = 0; i < 100000000; i++) {
                        inner = new SchedulerTest().new InnerSchedulerTest(i);
                    }
                    for (int i = 0; i < 100000000; i++) {
                        inner = new SchedulerTest().new InnerSchedulerTest(i);
                    }
                    for (int i = 0; i < 100000000; i++) {
                        inner = new SchedulerTest().new InnerSchedulerTest(i);
                    }
                    for (int i = 0; i < 100000000; i++) {
                        inner = new SchedulerTest().new InnerSchedulerTest(i);
                    }
                    return e;
                })
                .subscribe(data -> log.info("subscribe : {}", data));
        end = System.currentTimeMillis();

        // log.info("Parallel Time : {}", end - start);

        Thread.sleep(100000L);

    }

    public class InnerSchedulerTest {
        private Integer name;

        public InnerSchedulerTest(Integer name) {
            this.name = name;
        }
    }

}
