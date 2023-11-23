import java.util.Arrays;
import java.util.Comparator;
import java.util.Scanner;

public class App013 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int N = sc.nextInt();

        int[][] arr = new int[N][2];

        for (int i = 0; i < N; i++) {
            arr[i][0] = sc.nextInt(); // 시작시간
            arr[i][1] = sc.nextInt(); // 종료시간
        }

        // 종료시간을 기준으로 정렬
        Arrays.sort(arr, new Comparator<int[]>() {
            @Override
            public int compare(int[] start, int[] end) {
                // 종료시간이 같으면 시작시간이 빠른 순으로 정렬
                if (start[1] == end[1]) {
                    return start[0] - end[0];
                }
                // 종료시간이 다르면 종료시간이 빠른 순으로 정렬
                return start[1] - end[1];
            }
        });

        int count = 0;
        int end = -1;

        for (int i = 0; i < N; i++) {
            if (arr[i][0] >= end) { // 겹치지 않는 다음 회의가 나온 경우
                end = arr[i][1]; // 종료 시간 업데이트하기
                count++;
            }
        }

        System.out.println(count);
    }
}
