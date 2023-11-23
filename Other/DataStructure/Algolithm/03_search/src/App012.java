import java.util.Collections;
import java.util.PriorityQueue;
import java.util.Scanner;

public class App012 {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        int N = sc.nextInt();

        PriorityQueue<Integer> plusPq = new PriorityQueue<>(Collections.reverseOrder());
        PriorityQueue<Integer> minusPq = new PriorityQueue<>();

        int one = 0;
        int zero = 0;

        for (int i = 0; i < N; i++) {
            int data = sc.nextInt();
            if (data > 1) {
                plusPq.add(data);
            } else if (data == 1) {
                one++;
            } else if (data == 0) {
                zero++;
            } else {
                minusPq.add(data);
            }
        }

        int sum = 0;

        while (plusPq.size() > 1) {
            int data1 = plusPq.remove();
            int data2 = plusPq.remove();
            sum += data1 * data2;
        }

        if (!plusPq.isEmpty()) {
            sum += plusPq.remove();
        }

        while (minusPq.size() > 1) {
            int data1 = minusPq.remove();
            int data2 = minusPq.remove();
            sum += data1 * data2;
        }

        if (!minusPq.isEmpty()) {
            if (zero == 0) {
                sum += minusPq.remove();
            }
            // zero != 0 이면 0을 곱해도 0이므로 더해줄 필요가 없다.
        }

        sum += one;
        System.out.println(sum);

    }
}
