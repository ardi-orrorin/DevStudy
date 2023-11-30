import java.util.Scanner;

public class App006 {
    public static int[] parent;

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt(); // 도시의 개수
        int m = sc.nextInt(); // 여행 계획에 속한 도시 수
        int[][] city = new int[n + 1][n + 1];

        for (int i = 1; i <= n; i++) { // 도시 연결 정보 저장
            for (int j = 1; j <= n; j++) {
                city[i][j] = sc.nextInt();
            }
        }

        int[] route = new int[m + 1];
        for (int i = 1; i <= m; i++) { // 여행 도시 정보 저장
            route[i] = sc.nextInt();
        }

        parent = new int[n + 1];
        for (int i = 1; i <= n; i++) { // 부모 테이블 초기화
            parent[i] = i;
        }

        for (int i = 1; i <= n; i++) { // 인접 행렬에서 도시가 연결돼 있으면 union 연산 수행
            for (int j = 1; j <= n; j++) {
                if (city[i][j] == 1) {
                    union(i, j);
                }
            }
        }

        // 여행 계획 도시들이 1개의 대표 도시ㄹ로 연결돼 있는지 확인
        int index = find(route[1]);

        for (int i = 2; i < route.length; i++) {
            if (index != find(route[i])) {
                System.out.println("NO");
                return;
            }
            System.out.println("YES");
        }
    }

    public static void union(int a, int b) {
        a = find(a);
        b = find(b);

        if (a != b) {
            parent[b] = a;
        }
    }

    public static int find(int x) {
        if (x == parent[x]) {
            return x;
        }

        return parent[x] = find(parent[x]);
    }
}
