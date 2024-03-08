package Exception;

/**
 * NotIntException
 */
public class NotIntException extends RuntimeException {

    public NotIntException(String message) {
        super(message);
    }

    public NotIntException(String message, Throwable cause) {
        super(message, cause);
    }

    @Override
    public String getMessage() {
        return super.getMessage();
    }

}