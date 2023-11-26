import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import java.util.Scanner;

public class App001 {
    static int visited[]; // 방문 여부
    static ArrayList<Integer>[] arr; // 인접 리스트
    static int N, M, K, X;
    static List<Integer> answer;

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        N = sc.nextInt(); // 도시의 개수
        M = sc.nextInt(); // 도로의 개수
        K = sc.nextInt(); // 거리 정보
        X = sc.nextInt(); // 출발 도시의 번호

        arr = new ArrayList[N + 1];

        for (int i = 1; i < N; i++) {
            arr[i] = new ArrayList<Integer>();
        }

        // 인접 리스트 생성
        for (int i = 0; i < M; i++) {
            int s = sc.nextInt();
            int e = sc.nextInt();
            arr[s].add(e);
        }

        // 방문 여부 초기화
        visited = new int[N + 1];
        for (int i = 1; i <= N; i++) {
            visited[i] = -1;
        }

        // DFS 수행
        BFS(X);

        for (int i = 0; i <= N; i++) {
            if (visited[i] == K) {
                answer.add(i);
            }
        }

        if (answer.isEmpty()) {
            System.out.println(-1);
        } else {
            Collections.sort(answer);
            for (int i : answer) {
                System.out.println(i);
            }
        }
    }

    private static void BFS(int node) {
        Queue<Integer> q = new LinkedList<Integer>();

        q.add(node);
        
        visited[node]++;
        
        while (!q.isEmpty()) {
            int now = q.poll();
            for (int i : arr[now]) {
                if (visited[i] == -1) {
                    visited[i] = visited[now] + 1;
                    q.add(i);
                } 
            }
        }
    }
}
