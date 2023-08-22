package Predicate;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.function.Predicate;

public class App {
    public static void main(String[] args) {
        /*
         * Predicat
         * 함수형 인터페이스로 객체 T를 인수를 받아 bollean을 반환한다.
         */

        Predicate<String> nonEmptyStringPredicate = s -> s.isEmpty();
        List<String> nonEmpty1 = filter(Arrays.asList("12", "12"), nonEmptyStringPredicate);

        // 축약
        List<String> nonEmpty2 = filter(Arrays.asList("1", "2"), s -> s.isEmpty());
    }

    // predicate를 활용한 람다 함수
    public static <T> List<T> filter(List<T> list, Predicate<T> p) {
        List<T> results = new ArrayList<>();
        for (T t : list) {
            if (p.test(t)) {
                results.add(t);
            }
        }
        return results;
    }

    
}
