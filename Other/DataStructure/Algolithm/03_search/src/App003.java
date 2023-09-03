import java.util.ArrayList;
import java.util.Scanner;

public class App003 {
    static boolean visited[]; // 방문 기록 저장 배열
    static ArrayList<Integer>[] A; // 그래프 데이터 저장 인접 리스트
    static boolean arrive; // 도착 확인 변수

    public static void main(String[] args) {
        int N; // 노드 개수
        int M; // 에지 개수
        arrive = false;

        Scanner sc = new Scanner(System.in);

        N = sc.nextInt();
        M = sc.nextInt();

        A = new ArrayList[N];
        visited = new boolean[N];

        for (int i = 0; i < N; i++) {
            A[i] = new ArrayList<Integer>();
        }

        for (int i = 0; i < M; i++) {
            int S = sc.nextInt();
            int E = sc.nextInt();
            A[S].add(E);
            A[E].add(S);
        }
        for (int i = 0; i < N; i++) {
            DFS(i, 1);
            if (arrive)
                break;
        }

        if (arrive)
            System.out.println("1");
        else
            System.out.println("0");
    }

    public static void DFS(int now, int depth) {
        if (depth == 5 || arrive) { // depth 가 5일 때 종료
            arrive = true;
            return;
        }

        visited[now] = true;

        for (int i : A[now]) {
            if (!visited[i]) {
                DFS(now, depth + 1); // 재귀 호출하면서 depth 1씩 증가
            }
        }

        visited[now] = false;
    }
}
