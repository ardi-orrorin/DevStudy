package datetimeformatter;

import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

public class App {
    public static void main(String[] args) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        System.out.println(formatter.format(java.time.LocalDateTime.now())); // 현재 시간을 formatter 형식으로 출력
        System.out.println(java.time.LocalDateTime.now().format(formatter)); // 현재 시간을 formatter 형식으로 출력

        DateTimeFormatter formatter2 = new DateTimeFormatterBuilder()
                .appendText(ChronoField.DAY_OF_MONTH)
                .appendLiteral("일")
                .appendText(ChronoField.MONTH_OF_YEAR)
                .appendLiteral("월")
                .appendText(ChronoField.YEAR)
                .parseCaseInsensitive()
                .toFormatter();

        System.out.println(formatter2.format(java.time.LocalDate.now())); // 현재 날짜를 formatter2 형식으로 출력
        System.out.println(java.time.LocalDate.now().format(formatter2)); // 현재 날짜를 formatter2 형식으로 출력

    }
}
