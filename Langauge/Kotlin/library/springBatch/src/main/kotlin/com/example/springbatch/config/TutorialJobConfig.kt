package com.example.springbatch.config


import org.springframework.batch.core.Job
import org.springframework.batch.core.Step
import org.springframework.batch.core.StepContribution
import org.springframework.batch.core.configuration.annotation.EnableBatchProcessing
import org.springframework.batch.core.job.builder.JobBuilder
import org.springframework.batch.core.repository.JobRepository
import org.springframework.batch.core.scope.context.ChunkContext
import org.springframework.batch.core.step.builder.StepBuilder
import org.springframework.batch.repeat.RepeatStatus
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration


@Configuration
@EnableBatchProcessing
class TutorialJobConfig{

    @Bean
    fun helloWorldJob(jobRepository: JobRepository): Job {
        return JobBuilder("helloWorldJob", jobRepository)
            .start(helloWorldStep(jobRepository))
            .build()
    }

    @Bean
    fun helloWorldStep(jobRepository: JobRepository): Step {
        return StepBuilder("helloWorldStep", jobRepository)
            .tasklet {
                contribution: StepContribution, chunkContext: ChunkContext ->
                println("Hello, World!")
                RepeatStatus.FINISHED
            }
            .build()
    }

}