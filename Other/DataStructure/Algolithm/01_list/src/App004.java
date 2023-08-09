public class App004 {
    public static void main(String[] args) {
        /*
         * 1차 누적 합계 배열 공식 o[i][j]
         * 가로 : d[i][j] = o[i][j-1] + d[1][j]
         * 세로 : d[i][j] = o[i-1][k] + d[i][1]
         */

        /*
         * 2차 누적 합계 배열 공식
         * d[i][j] = d[i][j-1] + d[i-1][j] - d[i-1][i-1] + o[i][j]
         */
        test01();
    }

    public static void test01() {

    }
}
