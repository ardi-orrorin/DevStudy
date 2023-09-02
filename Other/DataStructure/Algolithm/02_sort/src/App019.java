
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class App019 {
    public static void main(String[] args) throws IOException {
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(in.readLine());

        int N = Integer.parseInt(st.nextToken()); // 데이터 갯수
        int K = Integer.parseInt(st.nextToken()); // K번째의 수

        st = new StringTokenizer(in.readLine());
        int[] A = new int[N];
        for (int i = 0; i < N; i++) {
            A[i] = Integer.parseInt(st.nextToken());
        }

        quickSort(A, 0, N-1, K-1);
        System.out.println(A[K - 1]);
    }

    public static void quickSort(int[] A, int S, int E, int K) {
        if (S < E) {
            int pivot = partition(A, S, E); // 가운데 경계값
            if (pivot == K)
                return;
            else if (K < pivot)
                quickSort(A, S, pivot - 1, K); // K가 pivot 보다 작을 경우 왼쪽 그룹만 정렬 수행하기
            else
                quickSort(A, pivot + 1, E, K); // K가 pivot 보다 클 경우 오른쪽 그룹만 정렬 수행하기
        }
    }

    // 가운데 경계값 리턴
    public static int partition(int[] A, int S, int E) {
        if (S + 1 == E) {
            if (A[S] > A[E])
                swap(A, S, E);
            return E;
        }
        int M = (S + E) / 2; // 중간 기준으로할 값 계산
        swap(A, S, M);
        int pivot = A[S];
        int i = S + 1, j = E;

        while (i <= j) {
            while (j >= S + 1 && pivot < A[j]) {
                j--;
            }
            while (i <= E && pivot > A[i]) {
                i++;
            }
            if (i <= j) {
                swap(A, i++, j--);
            }
        }

        A[S] = A[j];
        A[j] = pivot;
        return j;

    }

    public static void swap(int[] A, int i, int j) {
        int temp = A[i];
        A[i] = A[j];
        A[j] = temp;
    }
}
