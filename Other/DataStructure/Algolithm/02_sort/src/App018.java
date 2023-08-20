import java.util.Scanner;

public class App018 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int N = sc.nextInt();

        int[] A = new int[N];
        int[] S = new int[N];

        for (int i = 0; i < N; i++) {
            A[i] = sc.nextInt();
        }

        // 삽입 정렬
        for (int i = 1; i < N; i++) {
            int insertPoint = i;
            int insertValue = A[i];

            for (int j = i - 1; j >= 0; j--) {
                if (A[j] < A[i]) {
                    insertPoint = j + 1;
                    break;
                }
                if (j == 0)
                    insertPoint = 0;
            }

            for (int j = i; j > insertPoint; j--) {
                A[j] = A[j - 1];
            }

            A[insertPoint] = insertValue;
        }

        // 합 배열 만들기
        S[0] = A[0];

        for (int i = 1; i < N; i++) {
            S[i] = S[i - 1] + A[i];
        }

        // 배열 총합
        int sum = 0;
        for (int i = 0; i < N; i++) {
            sum = sum + S[i];
        }
        System.out.println(sum);

    }
}
