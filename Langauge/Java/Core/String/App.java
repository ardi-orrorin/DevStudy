public class App {
    public static void main(String[] args) {
        StringBuffer sb = new StringBuffer("Hello");
        sb.append(" World");
        System.out.println(sb);

        sb.insert(5, " Java");
        System.out.println(sb);

        // 잘못 사용한 예
        sb.append("Insert" + "Test"); // String 문자열 연산이 이뤄지기 때문에 Buffer의 장점을 살리지 못함
        System.out.println(sb);

    }
}
