import java.util.Scanner;

public class App014 {
    static int result = 0;

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        String inStr = sc.nextLine();

        String[] str = inStr.split("-");

        for (int i = 0; i < str.length; i++) {
            int temp = plusSum(str[i]);
            System.err.println(temp);

            if (i == 0) {
                result += temp;
            } else {
                result -= temp;
            }
        }

        System.out.printf("result : %d\n", result);

    }

    static int plusSum(String num) {
        int sum = 0;
        // regex [] 안에 있는 문자들은 특수문자가 아닌 문자로 인식한다.
        // 정규식에서 \+ 는 문자로 인식한다. 따라서 \를 인식하기 위해 \\ 쓰고, +을 추가해서 \\+으로 쓰면 된다.
        String[] str = num.split("\\+");
        for (String s : str) {
            sum += Integer.parseInt(s);
        }
        return sum;
    }
}
