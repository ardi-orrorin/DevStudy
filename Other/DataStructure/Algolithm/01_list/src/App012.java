import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.Stack;

public class App012 {
    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(bf.readLine());

        int[] A = new int[n];
        int[] ans = new int[n];

        String[] str = bf.readLine().split(" ");

        for (int i = 0; i < n; i++) {
            A[i] = Integer.parseInt(str[i]);
        }

        Stack<Integer> myStack = new Stack<>();
        myStack.push(0); // 처음 스텍은 비어있으므로, 초기값 0 삽입

        for (int i = 1; i < n; i++) {
            // 스택이 비어 있지 않고 현재 수열이 스택 top 인덱스가 가리키는 수열보다 클 경우
            System.out.println(myStack.peek());
            while (!myStack.isEmpty() && A[myStack.peek()] < A[i]) {
                ans[myStack.pop()] = A[i];
            }
            myStack.push(i);
        }

        while (!myStack.empty()) {
            // 반복문을 다 돌고 나왓느데 스택이 비어 있지 않다면 빌 때까지
            ans[myStack.pop()] = -1;
            // 스택에 쌓인 index에 -1을 넣고
        }
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));

        for (int i = 0; i < n; i++){
            bw.write(ans[i]+ " ");
        }
        bw.write("\n");
        bw.flush();
        bw.close();
    }

}
