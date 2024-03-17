import java.time.Duration;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.time.temporal.Temporal;

public class App001 {
    public static void main(String[] args) throws Exception {
        Duration dSecond = Duration.ofSeconds(30);
        Duration dMinute = Duration.ofMinutes(10);
        Duration dHour = Duration.ofHours(12);

        System.out.println(dSecond); // PT30S
        System.out.println(dMinute); // PT10M
        System.out.println(dHour); // PT12H

        // getSeconds() 초단위로 변환 Long 타입
        System.out.println(dSecond.getSeconds()); // 30
        System.out.println(dMinute.getSeconds()); // 600
        System.out.println(dHour.getSeconds()); // 43200

        // toMinutes() 분단위로 변환 Long 타입
        System.out.println(dSecond.toMinutes()); // 0
        System.out.println(dMinute.toMinutes()); // 10
        System.out.println(dHour.toMinutes()); // 720

        // toHours() 시간단위로 변환 Long 타입
        System.out.println(dSecond.toHours()); // 0
        System.out.println(dMinute.toHours()); // 0
        System.out.println(dHour.toHours()); // 12

        // plus() 시간 더하기
        System.out.println(dMinute.plus(dSecond)); // PT10M30S
        System.out.println(dMinute.plus(dSecond).toSeconds()); // 630

        System.out.println(dHour.plus(dMinute)); // PT12H10M
        System.out.println(dHour.plus(dMinute).toSeconds()); // 43800

        System.out.println(dHour.plus(dMinute).plus(dSecond)); // PT12H10M30S
        System.out.println(dHour.plus(dMinute).plus(dSecond).toSeconds()); // 43830

        // minus() 시간 빼기
        System.out.println(dHour.minus(dMinute)); // PT11H50M
        System.out.println(dHour.minus(dMinute).minus(dSecond)); // PT11H49M30S

    }
}
