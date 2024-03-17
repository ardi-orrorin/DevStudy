package Refactoring;

public class App {
    public static void main(String[] args) {
        Runnable str = () -> System.out.println("Hello, World!");

        Runnable str1 = () -> {
            int a = 2;
            System.out.println("Hello, World!" + a);
        };

        str.run();
        str1.run();

    }
}
