public interface Chain {
    public abstract void setNext(Chain nextInchain);

    public abstract void proccess(Number request);
}
