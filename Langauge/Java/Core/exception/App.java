import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class App {
    public static void main(String[] args) throws Exception {
        App app = new App();
        // String firstString = app.firstString();
        // System.out.println(firstString);

        app.secondString();
    }

    public String firstString() throws IOException {
        try (
                BufferedReader br = new BufferedReader(new FileReader("text.txt"));) {
            return br.readLine();
        }
    }

    public void secondString() throws IOException {
        try {
            BufferedReader br = new BufferedReader(new FileReader("text.txt"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
