import java.util.ArrayList;
import java.util.List;

public class App {
    private static List list;

    public static void main(String[] args) {
        list = new ArrayList();
        for (int i = 0; i < 100000000; i++) {
            list.add(i);
        }

        System.out.println("for circle 1 : " + list.size());

        for (int i = 0; i < 100000000; i++) {
            list.add(i);
        }

        System.out.println("for circle 2 : " + list.size());

        for (int i = 0; i < 100000000; i++) {
            list.add(i);
        }

        System.out.println("for circle 3 : " + list.size());

        for (int i = 0; i < 100000000; i++) { // memory lick 발생
            list.add(i);
        }

        System.out.println("for circle 4 : " + list.size());

        for (int i = 0; i < 100000000; i++) {
            list.add(i);
        }

        System.out.println("for circle 5 : " + list.size());

        for (int i = 0; i < 100000000; i++) {
            list.add(i);
        }

        System.out.println("for circle 6 : " + list.size());

        for (int i = 0; i < 100000000; i++) {
            list.add(i);
        }

        System.out.println("for circle 7 : " + list.size());

    }
}