package example2.pizza;

import example2.materials.Cheese;
import example2.materials.Clams;
import example2.materials.Dough;
import example2.materials.FreshClams;
import example2.materials.Garlic;
import example2.materials.MarinaraSauce;
import example2.materials.Mushroom;
import example2.materials.Onion;
import example2.materials.Pepperoni;
import example2.materials.PizzaIngredientFactory;
import example2.materials.RedPepper;
import example2.materials.ReggianoCheese;
import example2.materials.Sauce;
import example2.materials.SlicedPepperoni;
import example2.materials.ThinCrustDough;
import example2.materials.Veggies;

public class NYPizzaIngredientFactory implements PizzaIngredientFactory {

    @Override
    public Cheese createCheese() {
        return new ReggianoCheese();
    }

    @Override
    public Clams createClams() {
        return new FreshClams();
    }

    @Override
    public Dough createDough() {
        return new ThinCrustDough();
    }

    @Override
    public Pepperoni createPepperoni() {
        return new SlicedPepperoni();
    }

    @Override
    public Sauce createSauce() {
        return new MarinaraSauce();
    }

    @Override
    public Veggies[] createVeggies() {
        Veggies veggies[] = { new Garlic(), new Mushroom(), new Onion(), new RedPepper() };
        return veggies;
    }

}
