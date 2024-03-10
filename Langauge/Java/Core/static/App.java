import java.util.ArrayList;
import java.util.List;

public class App {
    private static List<TestDTO> list;

    public static void main(String[] args) {
        list = new ArrayList<>();

        for (int j = 0; j < 1000000; j++) {
            for (int i = 0; i < 500000; i++) {
                list.add(new TestDTO("null", i, "null", "null", "null"));
            }

            System.out.println("for circle 1 : " + list.size());

            for (int ij = 0; ij < 500000; ij++) {
                list.remove(0);
            }

            System.out.println("for circle 2 : " + list.size());
        }
    }
}