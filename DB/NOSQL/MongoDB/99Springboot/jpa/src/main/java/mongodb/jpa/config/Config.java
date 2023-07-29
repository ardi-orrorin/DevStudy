package mongodb.jpa.config;


import org.modelmapper.ModelMapper;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

@Configuration
@EntityScan(basePackages = "mongodb.jpa")
//@EnableJpaRepositories(basePackages = "mongodb.jpa")
@EnableMongoRepositories(basePackages = "mongodb.jpa")
public class Config {

    @Bean
    public ModelMapper modelMapper(){return new ModelMapper();}
}
