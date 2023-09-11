import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;

public class App004 {
    static boolean visited[];
    static ArrayList<Integer>[] A;

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int N = sc.nextInt();
        int M = sc.nextInt();

        int Start = sc.nextInt();

        A = new ArrayList[N + 1];

        for (int i = 1; i <= N; i++) {
            A[i] = new ArrayList<>();
        }

        for (int i = 0; i < M; i++) {
            int S = sc.nextInt();
            int E = sc.nextInt();
            A[S].add(E);
            A[E].add(S);
        }

        for (int i = 1; i <= N; i++) {
            Collections.sort(A[i]);
        }
        visited = new boolean[N + 1];
        // DFS
        System.out.println();
        visited = new boolean[N + 1];

        // BFS
        System.out.println();
    }

    public static void DFS(int node) {
        System.out.println(node + " ");
        visited[node] = true;
        for (int i : A[node]) {
            if (!visited[i]) {
                DFS(i);
            }
        }
    }

    public static void BFS(int node) {
        Queue<Integer> queue = new LinkedList<>();
        queue.add(node);
        visited[node] = true;

        while (!queue.isEmpty()) {
            int nowNode = queue.poll();
            System.out.println(nowNode + " ");
            for (int i : A[nowNode]) {
                visited[i] = true;
                queue.add(i);
            }
        }
    }
}
