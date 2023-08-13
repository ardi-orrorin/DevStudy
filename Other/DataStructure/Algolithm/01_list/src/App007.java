import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.StringTokenizer;

public class App007 {
    public static void main(String[] args) throws NumberFormatException, IOException {
        // question();
        test01();
    }

    public static void question() throws NumberFormatException, IOException {
        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));

        int N = Integer.parseInt(bf.readLine());
        int M = Integer.parseInt(bf.readLine());
        int[] A = new int[N];

        StringTokenizer st = new StringTokenizer(bf.readLine());

        for (int i = 0; i < N; i++) {
            A[i] = Integer.parseInt(st.nextToken());
        }

        Arrays.sort(A);
        int count = 0;
        int i = 0;
        int j = N - 1;

        while (i < j) {
            if (A[i] + A[j] < M) {
                i++;
            } else if (A[i] + A[j] > M) {
                j--;
            } else {
                count++;
                i++;
                j--;
            }
        }
        System.out.println(count);
        bf.close();
    }

    public static void test01() throws NumberFormatException, IOException {
        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));

        int N = Integer.parseInt(bf.readLine()); // 배열의 갯수
        int M = Integer.parseInt(bf.readLine()); // 목적의 값

        int A[] = new int[N];

        StringTokenizer st = new StringTokenizer(bf.readLine());

        for (int i = 0; i < N; i++) {
            A[i] = Integer.parseInt(st.nextToken());
        }
        bf.close();

        Arrays.sort(A);
        System.out.println(A.length);

        int count = 0; // 경우의 수
        int i = 0; // 순방향 인덱스 검색 용도
        int j = N - 1; // 역방향 인덱스 검색 용도

        while (i < j) {
            if (A[i] + A[j] < M) {
                i++;
            } else if (A[i] + A[j] > M) {
                j--;
            } else {
                count++;
                i++;
                j--; // i, j 조건이 맞다면 비교한 값은 재 사용 불가
            }
            System.out.println("i" + i);
            System.out.println("j" + j);
        }
        System.out.println(count);

    }
}
