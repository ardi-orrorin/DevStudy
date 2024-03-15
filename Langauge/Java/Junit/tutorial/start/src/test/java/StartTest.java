import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;

@RunWith(Suite.class)
@Suite.SuiteClasses({ParameterTest.class})
public class StartTest {
    @Test
    public void test() {
        System.out.println("Hello world!");
    }
}
