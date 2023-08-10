import java.util.Scanner;

public class App005 {
    public static void main(String[] args) {
        question();
    }

    public static void question() {
        Scanner sc = new Scanner(System.in);

        int N = sc.nextInt();
        int M = sc.nextInt();
        long[] S = new long[N]; // 수열의 합 배열
        long[] C = new long[M]; //
        long anwser = 0;

        // 배열의 값 입력 받고 바로 수열의 합 배열로 전환
        S[0] = sc.nextInt();
        System.out.println(S[0]);
        for (int i = 1; i < N; i++) {
            S[i] = S[i - 1] + sc.nextInt();
        }

        for (int i = 0; i < N; i++) {
            int remainder = (int) (S[i] % M); // 0~i까지의 구간 합 잧가 0일 대 정합에 더하기

            if (remainder == 0)
                anwser++; // 나머지가 0이면 경의 수 증가

            System.out.println(C[remainder]++);
        }
        System.out.println(anwser);

        for (int i = 0; i < M; i++) {
            System.out.println("C : " + C[i]);
            if (C[i] > 1) {
                anwser = anwser + (C[i] * (C[i] - 1) / 2);
                System.out.println(anwser);
            }
        }
        System.out.println(anwser);

    }
}
