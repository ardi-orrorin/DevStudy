package aroundPattern;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class App {
    public static void main(String[] args) throws IOException {
        // try (BufferedReader br = new BufferedReader(new
        // InputStreamReader(System.in))) {
        // return br.readLine();
        // }

        String lamdaTest = funcInterfaceTest(brf -> brf.readLine()); // 람다 사용

    }

    // 람다 함수 만들기
    public static String funcInterfaceTest(BufferReaderFunc brf) throws IOException {
        try (BufferedReader br = new BufferedReader(new InputStreamReader(System.in))) {
            return brf.process(br);
        }
    }

}
