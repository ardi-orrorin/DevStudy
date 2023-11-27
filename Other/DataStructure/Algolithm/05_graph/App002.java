import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;
import java.util.StringTokenizer;

public class App002 {

    static int N, M;
    static boolean visited[];
    static int answer[];
    static ArrayList<Integer> arr[];

    public static void main(String[] args) throws IOException {

        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));

        StringTokenizer st = new StringTokenizer(br.readLine());
        N = Integer.parseInt(st.nextToken()); // 노드 개수
        M = Integer.parseInt(st.nextToken()); // 에지 개수
        arr = new ArrayList[N + 1];
        answer = new int[N + 1];

        for (int i = 1; i <= N; i++) {
            arr[i] = new ArrayList<Integer>();
        }

        for (int i = 0; i < M; i++) {
            st = new StringTokenizer(br.readLine());
            int S = Integer.parseInt(st.nextToken());
            int E = Integer.parseInt(st.nextToken());
            arr[S].add(E);
        }

        for (int i = 1; i <= N; i++) {
            visited = new boolean[N + 1];
            BFS(i);
        }

        int max = 0;
        for (int i = 1; i <= N; i++) {
            max = Math.max(max, answer[i]);
        }

        for (int i = 1; i <= N; i++) {
            if (answer[i] == max) {
                System.out.print(i + " ");
            }
        }

    }

    public static void BFS(int index) {
        Queue<Integer> q = new LinkedList<Integer>();
        q.add(index);
        System.err.println("q : " + q);
        visited[index] = true;
        System.err.println("visited[index] : " + visited[index]);

        while (!q.isEmpty()) {
            int nowNode = q.poll();
            System.err.println("nowNode : " + nowNode);
            for (int i : arr[nowNode]) {
                if (!visited[i]) {
                    visited[i] = true;
                    answer[i]++;
                    System.out.println("i : " + i);
                    System.out.println("answer[i]++ : " + answer[i]);
                    q.add(i);
                }
            }
        }

    }
}
