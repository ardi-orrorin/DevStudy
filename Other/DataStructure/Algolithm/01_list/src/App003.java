import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class App003 {
    public static void main(String[] args) throws IOException {
        // BufferedReader
        // Scanner보다 속도 측면에서 훨씬 빠르다.
        // Enter만 경계로 인식하고 받는 데이터를 String으로 고정해서 인식한다.
        // 합 배열 공식 s[i] = s[i-1] + a[i]
        // i 1 2 3 4 5
        // a 5 4 3 2 1
        // s 5 9 12 14 15

        // 구간 합 공식
        // s[j] - s[i-1]
        // sample01(); 답
        sample02();

    }

    public static void sample01() throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));

        System.out.println(bufferedReader);

        StringTokenizer stringTokenizer = new StringTokenizer(bufferedReader.readLine());

        System.out.println(stringTokenizer);

        int suNo = Integer.parseInt(stringTokenizer.nextToken());

        int quizNo = Integer.parseInt(stringTokenizer.nextToken());

        System.out.println("suNo : " + suNo);
        System.out.println("quizNo : " + quizNo);

        long[] S = new long[suNo + 1];

        stringTokenizer = new StringTokenizer(bufferedReader.readLine());
        for (int i = 1; i <= suNo; i++) {
            S[i] = S[i - 1] + Integer.parseInt(stringTokenizer.nextToken());
            System.out.println(S[i - 1]);
            System.out.println(S[i]);
        }

        for (int q = 0; q < quizNo; q++) {
            stringTokenizer = new StringTokenizer(bufferedReader.readLine());
            int i = Integer.parseInt(stringTokenizer.nextToken());
            int j = Integer.parseInt(stringTokenizer.nextToken());
            System.out.println(S[j] - S[i - 1]);
        }

    }

    public static void sample02() throws IOException {
        BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer stringTokenizer = new StringTokenizer(bufferedReader.readLine());

        int N = Integer.parseInt(stringTokenizer.nextToken());
        int quizNo = Integer.parseInt(stringTokenizer.nextToken());

        long[] arr = new long[N + 1];

        stringTokenizer = new StringTokenizer(bufferedReader.readLine());

        // 누적 합계 계산이 핵심
        for (int i = 1; i < N; i++) {
            arr[i] = arr[i - 1] + Integer.parseInt(stringTokenizer.nextToken());
        }

        for (int i = 0; i < quizNo; i++) {
            stringTokenizer = new StringTokenizer(bufferedReader.readLine());
            int j = Integer.parseInt(stringTokenizer.nextToken());
            int k = Integer.parseInt(stringTokenizer.nextToken());

            System.out.println(arr[k] - arr[j - 1]);
        }

    }
}
