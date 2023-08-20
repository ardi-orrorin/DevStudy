import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;

public class App016 {
    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

        int N = Integer.parseInt(reader.readLine());
        mData[] A = new mData[N];

        for (int i = 0; i < N; i++) {
            A[i] = new mData(Integer.parseInt(reader.readLine()), i);
        }

        Arrays.sort(A);
        int MAX = 0;

        for (int i = 0; i < N; i++) {
            if (MAX < A[i].index - i)
                MAX = A[i].index - i;
        }

        System.out.println(MAX + 1);

    }

}

class mData implements Comparable<mData> {
    int value;
    int index;

    public mData(int value, int index) {
        this.value = value;
        this.index = index;
    }

    @Override
    public int compareTo(mData o) {
        return value - o.value;
    }

}