package Stream;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class App001 {
    public static void main(String[] args) {
        List<Integer> list = Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9, 0);

        List<Integer> listTemp = list.stream().collect(Collectors.toList());

    }
}
