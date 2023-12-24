public class Milk implements Element {

    @Override
    public void accept(Visitor visitor) {
        System.err.println("Milk is being visited.");
        visitor.visit(this);
    }
    
}
