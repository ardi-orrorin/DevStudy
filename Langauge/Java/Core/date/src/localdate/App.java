package localdate;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.temporal.ChronoField;
import java.time.temporal.TemporalAdjuster;
import java.time.temporal.TemporalAdjusters;

public class App {
    public static void main(String[] args) {
        LocalDate today = LocalDate.now(); // 현재 날짜
        System.out.println("today : " + today);
        System.out.println("prevDay : " + today.with(TemporalAdjusters.previous(DayOfWeek.SUNDAY))); // 오늘 제외 지난 일요일
        System.out.println("nextDay : " + today.with(TemporalAdjusters.next(DayOfWeek.SUNDAY))); // 오늘 제외 다음 일요일
        System.out.println("sameNextDay : " + today.with(TemporalAdjusters.nextOrSame(DayOfWeek.SATURDAY))); // 오늘 포함 다음
                                                                                                             // // 토요일
        System.out.println("samePrevDay : " + today.with(TemporalAdjusters.previousOrSame(DayOfWeek.SATURDAY))); // 오늘
                                                                                                                 // 포함
                                                                                                                 // 지난
                                                                                                                 // 토요일
        System.out.println("monthStartDay : " + today.with(TemporalAdjusters.firstDayOfMonth())); // 이번 달의 첫날
        System.out.println("monthEndDay : " + today.with(TemporalAdjusters.lastDayOfMonth())); // 이번 달의 마지막날
        System.out.println("nextMonthStartDay : " + today.with(TemporalAdjusters.firstDayOfNextMonth())); // 다음 달의 첫날
        System.out.println("nextYearStartDay : " + today.with(TemporalAdjusters.firstDayOfNextYear())); // 내년의 첫날

        System.out.println("changeMonth : " + today.with(ChronoField.MONTH_OF_YEAR, 12)); // 월 변경
        System.out.println("changeYear : " + today.with(ChronoField.YEAR, 2022)); // 년 변경
        System.out.println("changeDay : " + today.with(ChronoField.DAY_OF_MONTH, 10)); // 일 변경

    }
}
