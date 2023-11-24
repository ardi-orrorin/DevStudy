import java.util.Scanner;

public class App001 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int start = sc.nextInt();
        int end = sc.nextInt();

        int[] arr = new int[end + 1];

        for (int i = 2; i <= end; i++) {
            arr[i] = i;
        }

        System.err.println(Math.sqrt(end));
        for (int i = 2; i <= Math.sqrt(end); i++) { // 제곱근까지만 검사
            if (arr[i] == 0)
                continue;
            for (int j = i + i; j <= end; j += i) { // 배수 지우기
                arr[j] = 0;
            }
        }

        for (int i : arr) {
            if (i != 0 && i >= start)
                System.out.println(i);
        }
    }
}
