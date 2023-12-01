import java.util.ArrayList;
import java.util.Scanner;

public class App007 {
    public static int[] parent;
    public static int[] trueP;
    public static ArrayList<Integer>[] party;
    public static int result;

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int n = sc.nextInt(); // 사람 수
        int m = sc.nextInt(); // 파티 수
        int t = sc.nextInt(); // 진실을 아는 사람 수

        result = 0;
        trueP = new int[t];

        for (int i = 0; i < t; i++) {
            trueP[i] = sc.nextInt();
        }

        party = new ArrayList[m];

        for (int i = 0; i < m; i++) { // 파티 데이터 저장하기
            party[i] = new ArrayList<Integer>();
            int partySize = sc.nextInt();
            for (int j = 0; j < partySize; j++) {
                party[i].add(sc.nextInt());
            }
        }

        parent = new int[n + 1];

        for (int i = 1; i <= n; i++) { // 대표 노드 초기화
            parent[i] = i;
        }

        for (int i = 0; i < m; i++) { // 각 파티에 참여한 사람들을 1개의 그룹으로 만들기
            int firstPeople = party[i].get(0);
            for (int j = 1; j < party[i].size(); j++) {
                union(firstPeople, party[i].get(j));
            }
        }

        for (int i = 0; i < m; i++) {
            boolean isPossible = true;
            int cur = party[i].get(0);

            for (int j = 0; j < t; j++) {
                if (find(cur) == find(trueP[j])) {
                    isPossible = false;
                    break;
                }
            }
            if (isPossible) {
                result++;
            }
        }
        System.out.println(result);
    }

    public static int find(int x) {
        if (x == parent[x]) {
            return x;
        } else {
            return parent[x] = find(parent[x]);
        }
    }

    public static void union(int x, int y) {
        x = find(x);
        y = find(y);

        if (x != y) {
            parent[y] = x;
        }
    }
}
