import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.StringTokenizer;

public class App009 {

    static int checkArr[];
    static int myArr[];
    static int checkSecret;

    public static void main(String[] args) throws IOException {
        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));

        StringTokenizer st = new StringTokenizer(bf.readLine());

        int S = Integer.parseInt(st.nextToken()); // 문자열의 길이

        int P = Integer.parseInt(st.nextToken()); // 부분 문자열의 길이

        int result = 0;

        char A[] = new char[S];

        checkArr = new int[4];

        myArr = new int[4];

        checkSecret = 0;

        A = bf.readLine().toCharArray();

        st = new StringTokenizer(bf.readLine());

        for (int i = 0; i < 4; i++) {
            checkArr[i] = Integer.valueOf(st.nextToken()); // 최소 들어가야 하야는 문자의 수 [A,C,G,T]
            if (checkArr[i] == 0) {
                checkSecret++; // 최소가 0이면 있든 없든 만족하므로 맞는 조건의 갯수 추가
            }
        }

        // 초기 P에 대한 문자열 처리
        for (int i = 0; i < P; i++) {
            Add(A[i]);
        }

        if (checkSecret == 4) {
            result++;
        }

        // 슬라이딩 윈도우 처리 부분
        for (int i = P; i < S; i++) {
            int j = i - P;
            Add(A[i]); // 역방향
            Remove(A[j]); // 순반향
            if (checkSecret == 4) {
                result++;
            }
        }

        System.out.println(result);
        bf.close();

    }

    // [A,C,G,T]가 포함되어야 하는 최소 갯수 만족시 checkSecret 증가
    private static void Add(char c) {
        switch (c) {
            case 'A':
                myArr[0]++; // 해당 문자의 찾은 갯수 카운트
                if (myArr[0] == checkArr[0]) {
                    checkSecret++;
                }
                break;

            case 'C':
                myArr[1]++; // 해당 문자의 찾은 갯수 카운트
                if (myArr[1] == checkArr[1]) {
                    checkSecret++;
                }
                break;

            case 'G':
                myArr[2]++; // 해당 문자의 찾은 갯수 카운트
                if (myArr[2] == checkArr[2]) {
                    checkSecret++;
                }
                break;

            case 'T':
                myArr[3]++; // 해당 문자의 찾은 갯수 카운트
                if (myArr[3] == checkArr[3]) {
                    checkSecret++;
                }
                break;
        }
    }

    private static void Remove(char c) {
        switch (c) {
            case 'A':
                if (myArr[0] == checkArr[0])
                    checkSecret--;
                myArr[0]--;
                break;
            case 'C':
                if (myArr[1] == checkArr[1])
                    checkSecret--;
                myArr[1]--;
                break;
            case 'G':
                if (myArr[2] == checkArr[2])
                    checkSecret--;
                myArr[2]--;
                break;
            case 'T':
                if (myArr[3] == checkArr[3])
                    checkSecret--;
                myArr[3]--;
                break;
        }
    }

}
