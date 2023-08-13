import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.StringTokenizer;

public class App008 {
    public static void main(String[] args) throws NumberFormatException, IOException {
        question();
    }

    public static void question() throws NumberFormatException, IOException {
        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(bf.readLine()); // 배열의 갯수 입력

        int result = 0;

        long A[] = new long[N]; // 배열 생성

        StringTokenizer st = new StringTokenizer(bf.readLine());

        for (int i = 0; i < N; i++) {
            A[i] = Long.parseLong(st.nextToken());
        }

        Arrays.sort(A);

        for (int k = 0; k < N; k++) {
            long find = A[k]; // 찾을 값

            int i = 0; // 순방향 인덱스
            int j = N - 1; // 역방향 인덱스

            while (i < j) {
                if (A[i] + A[j] == find) {
                    if (i != k && j != k) { // find 와 같은 위치가 아닐 경우 반영
                        result++;
                        break;
                    } else if (i == k) { // i가 k랑 같을 경우 i는 k가 되므로 i++ 해서 다시 조건값 검색
                        i++;
                    } else if (j == k) { // j가 k랑 같을 경우 j는 k가 되므로 j-- 해서 다시 조건값 검색
                        j--;
                    }
                } else if (A[i] + A[j] < find) {
                    i++;
                } else {
                    j--;
                }
            }
        }
        
        System.out.println(result);
        bf.close();
    }
}
