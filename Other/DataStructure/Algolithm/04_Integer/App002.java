import java.util.Scanner;

public class App002 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        long min = sc.nextLong();
        long max = sc.nextLong();

        long[] arr = new long[10000001];

        for (int i = 2; i < arr.length; i++) {
            arr[i] = i;
        }

        for (int i = 2; i <= Math.sqrt(arr.length); i++) {
            if (arr[i] == 0)
                continue;
            for (int j = i + i; j < arr.length; j += i) {
                arr[j] = 0;
            }
        }

        int count = 0;
        for (long i : arr) {
            if (i < 2)
                continue;
            long temp = i;
            while ((double) i <= (double) max / (double) temp) {
                if ((double) i >= (double) min / (double) temp) {
                    count++;
                }
                temp *= i;
            }
        }

        System.out.println(count);
    }
}
