package aroundPattern;

import java.io.BufferedReader;
import java.io.IOException;

@FunctionalInterface // 함수형 인터페이스 선언
public interface BufferReaderFunc {
    String process(BufferedReader br) throws IOException;
}
