import java.util.Scanner;

public class App002 {
    static int N;

    public static void main(String[] args) {

        Scanner in = new Scanner(System.in);
        N = in.nextInt();
        DFS(2, 1);
        DFS(3, 1);
        DFS(5, 1);
        DFS(7, 1);
    }

    static void DFS(int number, int digit) {
        if (digit == N) { // 입력받은 자리수가 같을 때까지 재귀호출
            if (isPrime(number)) { // 소수이면 출력
                System.out.println(number);
            }
            return;
        }

        for (int i = 1; i < 10; i++) {
            if (i % 2 == 0) { // 작수라면 더 이상 탐색이 필요 없으므로 다음 진행
                continue;
            }
            if (isPrime(number * 10 + i)) { // 소수라면 재귀 함수로 자릿수르 느림
                DFS(number * 10 + i, digit + 1);
            }
        }
    }

    static boolean isPrime(int num) {
        for (int i = 2; i <= num / 2; i++) {
            if (num % i == 0) // 나눠서 0이면 소수가 아니므로 false 리턴
                return false;
        }
        return true;
    }
}
