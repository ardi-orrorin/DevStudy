public class App {
    public static void main(String[] args) throws Exception {
        Shopper shopper = new Shopper();
        Milk milk = new Milk();
        milk.accept(shopper);
    
        Snack snack = new Snack();
        snack.accept(shopper);
    }
}
