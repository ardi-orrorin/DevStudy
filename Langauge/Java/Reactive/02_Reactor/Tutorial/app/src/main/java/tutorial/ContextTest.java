package tutorial;

import org.checkerframework.checker.units.qual.s;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

public class ContextTest {

    private static Logger log = LoggerFactory.getLogger(ContextTest.class);

    public static void main(String[] args) throws Exception {
        Mono.deferContextual(ctx -> Mono.just("hello" + " " + ctx.get("firstName"))
                .doOnNext(data -> log.info("doOnNext : {}", data))
                .subscribeOn(Schedulers.boundedElastic()))
                .publishOn(Schedulers.parallel())
                .transformDeferredContextual((mono, ctx) -> mono.map(data -> data + " " + ctx.get("lastName")))
                .contextWrite(ctx -> ctx.put("lastName", "Jobs"))
                .contextWrite(ctx -> ctx.put("firstName", "Steve"))
                .subscribe(data -> log.info("subscribe : {}", data));

        Thread.sleep(2000);
    }

}
