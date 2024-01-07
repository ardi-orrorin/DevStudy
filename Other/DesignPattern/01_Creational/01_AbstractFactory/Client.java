public class Client {
    public static void main(String[] args) throws Exception {
        AbstractFactory factory = new ConcreteFactory1();
        AbstractProductA productA = factory.createProductA();
        System.out.println(productA.getClass().getName());

        factory = new ConcreteFactory2();

        AbstractProductB productB = factory.createProductB();
        System.out.println(productB.getClass().getName());

    }
}
