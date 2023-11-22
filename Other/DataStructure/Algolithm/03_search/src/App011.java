import java.util.Collection;
import java.util.Collections;
import java.util.PriorityQueue;
import java.util.Scanner;

public class App011 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int N = sc.nextInt();

        // PriorityQueue
        // 우선순위 큐는 일반적인 FIFO 정책이 아닌 우선순위를 먼저 결정하고 그 우선순위가 높은 데이터가 먼저 나가는 자료구조
        // 내부 요소는 힙으로 구성되어 이진트리 구조로 이뤄져 있다.
        // 시간복잡도는 O(logN)

        // 작은 값이 우선순위가 높은 우선순위 큐
        PriorityQueue<Integer> pq = new PriorityQueue<>();

        // 큰 값이 우선순위가 높은 우선순위 큐
        PriorityQueue<Integer> pq2 = new PriorityQueue<>(Collections.reverseOrder());

        for (int i = 0; i < N; i++) {
            pq.add(sc.nextInt());
        }

        int data1 = 0;
        int data2 = 0;
        int sum = 0;

        while (pq.size() != 1) {
            System.err.println(pq);
            data1 = pq.remove();
            data2 = pq.remove();
            sum += data1 + data2;

            pq.add(data1 + data2);
        }
        System.out.println(sum);

    }
}
