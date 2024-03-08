import java.util.Objects;

import Exception.NotIntException;

public class App {
    public static void main(String[] args) throws Exception {

        // System.out.println(add(1, null));
        // System.out.println(add2(1, null));
        System.out.println(add3(1, null));
    }

    // requireNonNull Test
    public static int add(Integer a, Integer b) {
        Objects.requireNonNull(a, "a must not be null"); // a가 null이면 NullPointerException 발생
        Objects.requireNonNull(b, "b must not be null"); // b가 null이면 NullPointerException 발생
        return a + b;
    }

    public static int add2(Integer a, Integer b) {
        if (a == null || b == null) {
            throw new NotIntException("a and b must not be null"); // a나 b가 null이면 NotIntException 발생
        }

        return a + b;
    }

    private static int add3(Integer a, Integer b) {
        assert a != null; // a가 null이면 NullPointerException 발생
        assert b != null; // b가 null이면 NullPointerException 발생

        return a + b;
    }
}
