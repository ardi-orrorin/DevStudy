package Consumer;

import java.util.Arrays;
import java.util.List;
import java.util.function.Consumer;

public class App {
    public static void main(String[] args) {
        /*
         * Consumer란?
         * Consumer 인터페이스는 제네릭 T 객체를 받아서 void를 반화하는
         * accept라는 추상 메서드를 갖고 있다.
         */

        forEach(Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9), i -> System.out.println(i));

    }

    public static <T> void forEach(List<T> list, Consumer<T> c) {
        for (T t : list) {
            c.accept(t);
        }
    }
}
