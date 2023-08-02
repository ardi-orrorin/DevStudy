package mongodb.jpa.common;


import lombok.*;
import org.springframework.context.annotation.Bean;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ResponseDTO {

    private int statusCode;

    private String message;

    private Object data;

}
