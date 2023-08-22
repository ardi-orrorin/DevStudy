package Function;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.function.Function;

public class App<T, R> {
    public static void main(String[] args) {
        /*
         * Function<T,R> 인터페이스는 제네릭 T를 인수로 받아
         * R객체를 반환하는 추상 메서드 apply를 정의한다.
         */

        App<Integer, Integer> app = new App<Integer, Integer>();
        System.out.println(app.map(Arrays.asList("1", "1", "1", "1", "1", "1"), i -> i + "10"));

    }

    public static <T, R> List<R> map(List<T> list, Function<T, R> f) {
        List<R> result = new ArrayList<>();
        for (T t : list) {
            result.add(f.apply(t));
        }
        return result;
    }

    public static <T> String func() {
        return (String) "sd";
    }
}
