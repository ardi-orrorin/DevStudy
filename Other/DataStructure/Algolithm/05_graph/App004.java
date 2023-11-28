import java.util.LinkedList;
import java.util.Queue;
import java.util.Scanner;

public class App004 {

    // a -> b, a -> c, b -> a, b -> c, c -> a, c -> b, 6가지 경우의 수를 배열로 표시;
    static int[] Sender = { 0, 0, 1, 1, 2, 2 };
    static int[] Receiver = { 1, 2, 0, 2, 0, 1 };
    static boolean visited[][];
    static boolean answer[];
    static int now[];

    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        now = new int[3];
        now[0] = s.nextInt();
        now[1] = s.nextInt();
        now[2] = s.nextInt();
        visited = new boolean[201][201];
        answer = new boolean[201];

        BFS();

        for (int i = 0; i < answer.length; i++) {
            if (answer[i]) {
                System.out.print(i + " ");
            }
        }
    }

    public static void BFS() {
        Queue<AB> q = new LinkedList<>();
        q.add(new AB(0, 0));
        visited[0][0] = true;
        answer[now[2]] = true;

        while (!q.isEmpty()) {
            AB p = q.poll();
            int a = p.a;
            int b = p.b;
            int c = now[2] - a - b; // c의 물의 양은 -a -b 한 것

            // a -> b, a -> c, b -> a, b -> c, c -> a, c -> b, 6가지 경우의 수
            for (int k = 0; k < 6; k++) {
                int[] next = { a, b, c };
                next[Receiver[k]] += next[Sender[k]];
                next[Sender[k]] = 0;

                if (next[Receiver[k]] > now[Receiver[k]]) { // 물이 넘칠 때
                    // 초과하는 만큼 이전 물통에 넣어줌
                    next[Sender[k]] = next[Receiver[k]] - now[Receiver[k]];
                    next[Receiver[k]] = now[Receiver[k]];

                }
                if (!visited[next[0]][next[1]]) { // 방문하지 않았다면
                    visited[next[0]][next[1]] = true; // 방문처리
                    q.add(new AB(next[0], next[1])); // 큐에 추가
                    if (next[0] == 0) {
                        answer[next[2]] = true; // a가 0이면 c의 물의 양을 true로
                    }
                }

            }
        }
    }

}

class AB {
    int a;
    int b;

    AB(int a, int b) {
        this.a = a;
        this.b = b;
    }
}
