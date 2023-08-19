public class NegativeProcessor implements Chain {

    private Chain nextInChain;

    @Override
    public void proccess(Number request) {
        if (request.getNumber() < 0) {
            System.out.println("NegativeProcessor : " + request.getNumber());
        } else {
            nextInChain.proccess(request);
        }
        
    }

    @Override
    public void setNext(Chain nextInchain) {
        this.nextInChain = nextInchain;
    }
    
    
}
