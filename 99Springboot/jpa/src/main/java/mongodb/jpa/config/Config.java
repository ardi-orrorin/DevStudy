package mongodb.config;


import org.modelmapper.ModelMapper;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@EntityScan(basePackages = "com.mongodb")
@ComponentScan(basePackages = "com.mongodb")
public class Config {

    @Bean
    public ModelMapper modelMapper(){return new ModelMapper();}
}
