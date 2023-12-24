public class Shopper implements Visitor {

    // @Override
    // public void visit(Element element) {
    //     switch (element.getClass().getSimpleName()) {
    //         case "Snack":
    //             System.out.println("Shopper is buying a snack.");
    //             break;
    //         case "Milk":
    //             System.out.println("Shopper is buying milk.");
    //             break;
    //         default:
    //             System.out.println("Shopper is buying something.");
    //             break;
    //     }
    // }

    @Override
    public void visit(Milk milk) {
        System.out.println("Shopper is buying milk.");    
    }

    @Override
    public void visit(Snack snack) {
        System.out.println("Shopper is buying milk.");
    }
}
