import java.util.Arrays;
import java.util.Scanner;

public class App007 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int N = sc.nextInt();
        int[] A = new int[N];
        for(int i = 0; i < N; i++){
            A[i] = sc.nextInt();
        }
        Arrays.sort(A);
        
        int M = sc.nextInt();

        for(int i=0; i< M; i++){
            boolean find = false;
            int target = sc.nextInt();
            
            int start = 0;
            int end = A.length - 1;

            while (start <= end) {
                int midi = (start + end) / 2;
                
                int midV = A[midi]; // 중간 배열의 값

                if(midV > target){
                    end = midi - 1;
                }else if(midV < target){
                    start = midi + 1;
                }else{
                    find = true;
                    break;
                }
            }
            System.out.println(find ? "찾음" : "못찾음");
        }

    }
}
