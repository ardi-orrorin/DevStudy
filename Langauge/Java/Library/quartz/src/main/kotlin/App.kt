import org.quartz.CronExpression
import org.quartz.CronScheduleBuilder
import org.quartz.CronTrigger
import org.quartz.Job
import org.quartz.JobBuilder
import org.quartz.JobDetail
import org.quartz.JobExecutionContext
import org.quartz.Scheduler
import org.quartz.SimpleScheduleBuilder
import org.quartz.SimpleTrigger
import org.quartz.Trigger
import org.quartz.TriggerBuilder
import org.quartz.impl.StdSchedulerFactory
import java.time.LocalDateTime

fun main() {
    val job: JobDetail = JobBuilder.newJob(Myjob::class.java)
        .withIdentity("myjob")
        .build()

    // 기본 트리거
    // 지정한 시간 간격으로 반복 및 반복 횟수를 지정
    // .repeatForever() 없으면 한 번만 실행됨
    val trigger: Trigger = TriggerBuilder.newTrigger()
        .withIdentity("myjobTrigger")
        .startNow()
        .withSchedule(
            SimpleScheduleBuilder.simpleSchedule()
                .withIntervalInSeconds(2)
                .repeatForever()
        )
        .build()
    // http://www.quartz-scheduler.org/documentation/quartz-2.3.0/tutorials/crontrigger.html
    val cronTrigger: CronTrigger = TriggerBuilder.newTrigger()
        .withIdentity("cronTrigger")
        .withSchedule(
            CronScheduleBuilder.cronSchedule("0,1,3,6 * * * * ?")
        )
        .build()

    val scheduler:Scheduler = StdSchedulerFactory().getScheduler()
    scheduler.start()
    scheduler.scheduleJob(job, cronTrigger)
}


class Myjob:Job {
    override fun execute(context: JobExecutionContext?) {
        println(LocalDateTime.now())
    }
}