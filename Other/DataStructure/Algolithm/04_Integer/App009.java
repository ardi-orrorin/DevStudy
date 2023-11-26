import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.util.StringTokenizer;

public class App009 {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(System.out));
        StringTokenizer st = new StringTokenizer(br.readLine());

        int a = Integer.parseInt(st.nextToken());
        int b = Integer.parseInt(st.nextToken());
        int c = Integer.parseInt(st.nextToken());

        long gcd = gcd(a, b);
        if (c % gcd != 0) {
            System.out.println(-1);
        } else {
            int mok = c / (int) gcd;
            long[] ret = Excute(a, b);
            System.out.println(ret[0] * mok + " " + ret[1] * mok);
        }

    }

    private static long[] Excute(long a, long b) {
        long[] ret = new long[2];
        if (b == 0) {
            ret[0] = 1;
            ret[1] = 0;
            return ret;
        }
        long q = a / b;
        long[] temp = Excute(b, a % b);
        ret[0] = temp[1];
        ret[1] = temp[0] - q * temp[1];
        return ret;
    }

    public static long gcd(long a, long b) {
        if (b == 0)
            return a;
        else
            return gcd(b, a % b); // 재귀 호출

    }
}
