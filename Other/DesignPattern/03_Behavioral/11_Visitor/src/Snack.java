public class Snack implements Element {

    @Override
    public void accept(Visitor visitor) {
        System.err.println("Snack is being visited.");
        visitor.visit(this);
    }
    
}
