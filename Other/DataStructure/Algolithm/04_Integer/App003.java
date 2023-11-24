import java.util.Scanner;

public class App003 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int max = sc.nextInt();
        int[] arr = new int[10000001];

        for (int i = 2; i < arr.length; i++) {
            arr[i] = i;
        }

        for (int i = 2; i <= Math.sqrt(arr.length); i++) {
            if (arr[i] == 0)
                continue;
            for (int j = i + i; j < arr.length; j += i) {
                arr[j] = 0;
            }
        }

        int i = max;

        while (true) {

            if (arr[i] != 0 && isPallindrome(i)) {
                System.out.println(i);
                break;
            }
            i++;
        }

    }

    // 펠린드롬 수 판별 함수
    private static boolean isPallindrome(int num) {
        char[] str = String.valueOf(num).toCharArray();

        int s = 0;
        int e = str.length - 1;

        while (s < e) {
            if (str[s] != str[e])
                return false;
            s++;
            e--;
        }
        return true;
    }
}
