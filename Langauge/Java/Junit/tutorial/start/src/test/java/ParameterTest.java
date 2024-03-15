import org.apache.logging.log4j.Logger;
import org.example.Calculator;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.*;


import java.util.Arrays;
import java.util.Collection;

import static org.junit.Assert.assertEquals;


@RunWith(value = Parameterized.class)
public class ParameterTest {

    private Logger log = org.apache.logging.log4j.LogManager.getLogger(ParameterTest.class);


//    @Parameter(0)
    private int expected;

//    @Parameter(1)
    private int valueOne;

//    @Parameter(2)
    private int valueTwo;

    @Parameters
    public static Collection<Integer[]> getTestParameters() {
        return Arrays.asList(new Integer[][] {
            {2, 1, 1},
            {3, 2, 1},
            {4, 3, 1}
        });
    }

    public ParameterTest(int expected, int valueOne, int valueTwo) {
        this.expected = expected;
        this.valueOne = valueOne;
        this.valueTwo = valueTwo;
    }

    @Test
    public void testAdd() {
        Calculator calc = new Calculator();
//        log.info("addtion {} + {} = {}", valueOne, valueTwo, calc.add(valueOne, valueTwo));
        System.out.println("Addition with parameters : " + valueOne + " and " + valueTwo + " = " + calc.add(valueOne, valueTwo));
//        assertEquals(expected, calc.add(valueOne, valueTwo), 0);
    }

}
