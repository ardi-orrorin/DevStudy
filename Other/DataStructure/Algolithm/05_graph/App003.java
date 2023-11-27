import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

public class App003 {

    static ArrayList<Integer>[] arr;
    static int[] check;
    static boolean[] visited;
    static boolean isEven;

    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        int N = Integer.parseInt(br.readLine());

        for (int t = 0; t < N; t++) {
            String[] str = br.readLine().split(" ");
            int V = Integer.parseInt(str[0]); // 노드 개수
            int E = Integer.parseInt(str[1]); // 에지 개수

            arr = new ArrayList[V + 1];
            check = new int[V + 1];
            visited = new boolean[V + 1];
            isEven = true;

            for (int i = 1; i <= V; i++) {
                arr[i] = new ArrayList<Integer>();
            }

            for (int i = 0; i < E; i++) {
                String[] str2 = br.readLine().split(" ");
                int a = Integer.parseInt(str2[0]);
                int b = Integer.parseInt(str2[1]);

                arr[a].add(b);
                arr[b].add(a);
            }

            // 주어진 그래프가 1개로 연결돼 있다는 보장이 없으므로 모든 노드에서 수행

            for (int i = 1; i <= V; i++) {
                if (isEven) {
                    DFS(i);
                } else {
                    break;
                }
            }

            if (isEven) {
                System.out.println("yes");
            } else {
                System.out.println("no");
            }
        }
    }

    public static void DFS(int node) {
        visited[node] = true;

        for (int i : arr[node]) {
            if (!visited[i]) {
                // 인접한 노드는 같은 집합이 아니므로 이전 노드와 다른 집합으로 처리하기
                check[i] = (check[node] + 1) % 2;
                DFS(i);
            } else if (check[i] == check[node]) {
                // 이미 방문한 노드가 현재 내 노드와 같은 집합이면 이분 그래프가 아님
                isEven = false;
            }
        }
    }
}
