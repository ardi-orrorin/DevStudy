package menu;

import main.Beverage;

public class HouseBlend extends Beverage {

    public HouseBlend() {
        description = "하우스 브렌드";
    }

    @Override
    public double cost() {
        return 0.89;
    }

}
