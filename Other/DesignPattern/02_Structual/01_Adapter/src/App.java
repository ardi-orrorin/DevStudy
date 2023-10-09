public class App {
    public static void main(String[] args) throws Exception {
        Duck duck = new MallardDuck();

        Turkey turkey = new WildTurkey();

        Duck turkeyAdapter = new TurkeyAdapter(turkey);

        System.out.println("칠면조가 말하길");
        turkey.gobble();
        turkey.fly();

        System.out.println();

        System.out.println("오리가 말하길");
        testDuck(duck);

        System.out.println();
        System.out.println("어댑터");

        testDuck(turkeyAdapter);
    }

    static void testDuck(Duck duck) {
        duck.quack();
        duck.fly();
    }
}
