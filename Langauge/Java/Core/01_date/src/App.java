import java.time.LocalDateTime;

public class App {
    public static void main(String[] args) throws Exception {
        LocalDateTime localDateTime = LocalDateTime.now(); // 현재 시간

        // with 입력한 값으로 수치 변경
        System.out.println(localDateTime.withHour(10)); // 시간 변경
        System.out.println(localDateTime.withMinute(10)); // 분 변경
        System.out.println(localDateTime.withSecond(10)); // 초 변경
        System.out.println(localDateTime.withMonth(10)); // 월 변경
        System.out.println(localDateTime.withDayOfMonth(10)); // 월 기준 일 변경 현재 월은 유지하고 일만 변경
        System.out.println(localDateTime.withDayOfYear(10)); // 년 기준 일 변경 년을 유지 하고 일을 변경 356일 내

        // plus 입력된 수치 만큼 + 연산

        // minus 입력된 수치 만큼 - 연산
    }
}
