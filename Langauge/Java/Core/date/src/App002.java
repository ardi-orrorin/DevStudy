import java.time.Duration;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;

public class App002 {
    public static void main(String[] args) {
        // 날짜 차이 게산 (java.time) java8 이상

        // Duration.between()
        // 두 날짜를 시간 기준으로 나노초로 계산하여 초 단위로 변환한다.

        LocalDateTime startDateTime = LocalDateTime.now(ZoneId.systemDefault());
        LocalDateTime endDateTime = startDateTime.plusYears(2).plusDays(10).plusHours(2).plusMinutes(3).plusSeconds(4);
        Duration bDuration = Duration.between(startDateTime, endDateTime);
        System.err.println(bDuration); // PT936184S

        // Period.between()
        // 두 날짜를 날짜 기준으로 년, 월, 일로 계산한다.

        Period period = Period.between(startDateTime.toLocalDate(), endDateTime.toLocalDate());
        System.err.println(period); // P2Y10D

        // ChronoUnit.between()
        // 두 날짜를 원하는 단위로 계산한다.

        long cUnitSecond = ChronoUnit.SECONDS.between(startDateTime, endDateTime);
        System.out.println(cUnitSecond); // 64029784

        long cUnitMinute = ChronoUnit.MINUTES.between(startDateTime, endDateTime);
        System.out.println(cUnitMinute); // 1067163

        long cUnitHour = ChronoUnit.HOURS.between(startDateTime, endDateTime);
        System.out.println(cUnitHour); // 17786

        long cUnitDay = ChronoUnit.DAYS.between(startDateTime, endDateTime);
        System.out.println(cUnitDay); // 741

        long cUnitMonth = ChronoUnit.MONTHS.between(startDateTime, endDateTime);
        System.out.println(cUnitMonth); // 24

        long cUnitYear = ChronoUnit.YEARS.between(startDateTime, endDateTime);
        System.out.println(cUnitYear); // 2

    }
}
