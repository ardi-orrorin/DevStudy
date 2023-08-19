public class App {
    public static void main(String[] args) throws Exception {
        Chain c1 = new NegativeProcessor();
        Chain c2 = new ZeroProcessor();
        Chain c3 = new PositiveProcessor();
        

        c1.setNext(c2);
        c2.setNext(c3);

        c1.proccess(new Number(10));
        c1.proccess(new Number(-10));
        c1.proccess(new Number(0));
        c1.proccess(new Number(11));
    }
}
