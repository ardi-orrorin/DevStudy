package jmh;

import java.util.ArrayList;
import java.util.HashMap;

import org.openjdk.jmh.annotations.Benchmark;
import org.openjdk.jmh.annotations.BenchmarkMode;
import org.openjdk.jmh.annotations.Mode;
import org.openjdk.jmh.annotations.OutputTimeUnit;

// @BenchmarkMode({ Mode.AverageTime })
// @OutputTimeUnit(java.util.concurrent.TimeUnit.MILLISECONDS)
public class CompareTimer {

    private DummyData dummyData;

    public void checkCurrentTimeMillils() {
        long start = System.currentTimeMillis();
        dummyData = timeMakeObjects();
        long end = System.currentTimeMillis();
        long elapsedTime = end - start;
        System.out.println("milli : " + elapsedTime);
    }

    public void checkCurrentTimeNanos() {
        long start = System.nanoTime();
        dummyData = timeMakeObjects();
        long end = System.nanoTime();
        long elapsedTime = (end - start) / 1000000;
        System.out.println("nano : " + elapsedTime);
    }

    @Benchmark
    @BenchmarkMode({ Mode.AverageTime })
    @OutputTimeUnit(java.util.concurrent.TimeUnit.MILLISECONDS)
    public DummyData timeMakeObjects() {
        HashMap<String, String> data = new HashMap<String, String>(10000000);
        ArrayList<String> list = new ArrayList<String>(10000000);
        return new DummyData(data, list);
    }

}
