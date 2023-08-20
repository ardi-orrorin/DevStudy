import java.util.Scanner;

public class App017 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        String str = sc.next();
        int[] A = new int[str.length()];
        // 입력
        for (int i = 0; i < str.length(); i++) {
            A[i] = Integer.parseInt(str.substring(i, i + 1));
        }

        // 정렬
        for (int i = 0; i < str.length(); i++) {
            int Max = i;
            for (int j = i + 1; j < str.length(); j++) {
                if (A[j] > A[Max]) // 내림 차순으로 최댓값을 찾는다.
                    Max = j;
            }
            if (A[i] < A[Max]) { // swap
                int temp = A[i];
                A[i] = A[Max];
                A[Max] = temp;
            }
        }
        for (int i = 0; i < str.length(); i++) {
            System.out.println(A[i]);
        }
    }
}
