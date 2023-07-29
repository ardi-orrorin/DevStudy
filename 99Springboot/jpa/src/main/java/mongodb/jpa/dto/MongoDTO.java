package mongodb.jpa.dto;

import lombok.*;

import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class MongoDTO {
    private String username;
    private int age;
    private LocalDateTime date;
}
