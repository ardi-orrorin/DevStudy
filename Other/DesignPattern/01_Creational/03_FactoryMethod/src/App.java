import example2.pizza.NYPizzaStore;
import example2.pizza.PizzaStore;

public class App {
    public static void main(String[] args) throws Exception {
        PizzaStore pizzaStore = new NYPizzaStore();
        pizzaStore.orderPizza("cheese");

    }
}