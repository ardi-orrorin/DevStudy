import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.Deque;
import java.util.LinkedList;
import java.util.Scanner;
import java.util.StringTokenizer;

public class App010 {
    public static final Scanner sc = new Scanner(System.in);

    public static void main(String[] args) throws IOException {

        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));

        // 출력을 버퍼에 넣고 한 번에 출력하기 위해 사용
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));

        StringTokenizer st = new StringTokenizer(bf.readLine());

        int N = Integer.parseInt(st.nextToken()); // 배열 전체 크기
        int L = Integer.parseInt(st.nextToken()); // 슬라이드 최대 크기

        st = new StringTokenizer(bf.readLine());

        Deque<Node> myDeque = new LinkedList<>();
        /*
         * Deque : 덱은 어떤 쪽으로 입력하고 어떤 쪽으로 출력하느냐에 따라서 스텍, 혹은 큐로도 사용할 수 있다.
         * 스텍(Stack) : 후입 선출
         * 큐(Quere) : 선입 선출
         * 한쪽으로만 입력 가능하도록 설정한 덱을 스크롤(scroll)라고 한다.
         * 한쪽으로만 출력 가능하도록 설정한 덱을 셀프(shelf)락고 한다.
         * 
         */

        for (int i = 0; i < N; i++) {
            int now = Integer.parseInt(st.nextToken());
            // 새로운 값이 들어올 때마다 정렬 대신 현재 수보다 큰 값을 덱에서 제거해 시간 복잡도를 줄임

            while (!myDeque.isEmpty() && myDeque.getLast().value > now) {
                myDeque.removeFirst();
            }

            myDeque.addLast(new Node(now, i));

            if (myDeque.getFirst().index <= i - L) {
                myDeque.removeFirst();
            }

            bw.write(myDeque.getFirst().value + " ");
        }

        bw.flush();
        bw.close();
    }

    static class Node {
        public int value;
        public int index;

        Node(int value, int index) {
            this.value = value;
            this.index = index;
        }
    }
}
