import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

public class App020 {
    public static int[] A, tmp;
    public static long reuslt;

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        int N = Integer.parseInt(br.readLine());
        A = new int[N + 1];
        tmp = new int[N + 1];

        for (int i = 1; i <= N; i++) {
            A[i] = Integer.parseInt(br.readLine());
        }

        // 병합 정렬
        mergeSort(1, N);

        for (int i = 1; i <= N; i++) {
            bw.write(A[i] + "\n");
        }
        bw.flush();
        bw.close();
    }

    public static void mergeSort(int s, int e) {
        if (e - s < 1)
            return;
        int m = s + (e - s) / 2; // 중간 경계값 추출

        mergeSort(s, m); // 중간 기준 시작 그룹 정렬
        mergeSort(m + 1, e); // 중간 기준 끝 그룹 정렬

        for (int i = s; i <= e; i++) {
            tmp[i] = A[i];
        }
        int k = s;
        int index1 = s;
        int index2 = m + 1;

        while(index1 <= m && index2 <= e){
            if(tmp[index1] > tmp[index2]){
                A[k] = tmp[index2];
                k++;
                index2++;
            }else{
                A[k] = tmp[index1];
                k++;
                index1++;
            }

            while(index1 <= m ){
                A[k] = tmp[index1];
                k++;
                index1++;
            }
            while(index2 <= e){
                A[k] = tmp[index2];
                k++;
                index2++;
            }
        }

    }
}
