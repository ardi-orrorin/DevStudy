import condiment.Mocha;
import condiment.Soy;
import condiment.Whip;
import main.Beverage;
import menu.DarkRoast;
import menu.Espresso;
import menu.HouseBlend;

public class App {
    public static void main(String[] args) throws Exception {
        Beverage espresso = new Espresso();

        System.out.println(espresso.getDescription());

        Beverage houseBlend = new HouseBlend();
        houseBlend = new Mocha(houseBlend);
        houseBlend = new Mocha(houseBlend);

        System.out.println(houseBlend.getDescription() + houseBlend.cost());

        Beverage darkRoast = new DarkRoast();
        darkRoast = new Mocha(darkRoast);
        darkRoast = new Whip(darkRoast);
        darkRoast = new Soy(darkRoast);

        System.out.println(darkRoast.getDescription() + darkRoast.cost());

    }
}
