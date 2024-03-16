package tutorial;

import java.util.List;

import org.slf4j.Logger;

import reactor.core.publisher.Flux;
import tutorial.dto.TestDTO;

public class ErrorTest {

    private static Logger log = org.slf4j.LoggerFactory.getLogger(ErrorTest.class);

    public static void main(String[] args) {
        TestDTO dto = new TestDTO();

        Flux.just(dto)
                .map(d -> d.getName())
                // .onErrorReturn(NullTestException.class, "dfdf")
                // .onErrorReturn(NullPointerException.class, "Error")
                .onErrorResume(NullPointerException.class, e -> {
                    log.error("Error : {}", e);
                    return Flux.just("Error");
                })
                // .switchIfEmpty(Flux.error(new NullTestException("Nul!!!!")))
                .subscribe(data -> log.info("data : {}", data));
    }

    private static class NullTestException extends RuntimeException {
        public NullTestException(String message) {
            super(message);
        }
    }

}