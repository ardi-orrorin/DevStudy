package mongodb.jpa.entity;

import jakarta.persistence.Entity;
import lombok.*;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.index.Indexed;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Document(collection = "test1")
public class Mongo {

    @Id
    private String id;

    @Field(name = "username")
    private String username;


    @Field(name = "age")
    private int age;

    @Field(name = "date")
    private LocalDateTime date;
}
