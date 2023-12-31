import java.util.ArrayList;
import java.util.List;

public class App {
    public static void main(String[] args) throws Exception {
        Originator originator = new Originator();
        CareTasker careTasker = new CareTasker();

        originator.setState("State #1");
        originator.setState("State #2");
        careTasker.add(originator.saveStateToMemento());
        originator.setState("State #3");
        careTasker.add(originator.saveStateToMemento());
        originator.setState("State #4");

        System.out.println("Current State: " + originator.getState());
        originator.getStateFromMenento(careTasker.get(0));
        System.out.println("First saved State: " + originator.getState());
        originator.getStateFromMenento(careTasker.get(1));
        System.out.println("Second saved State: " + originator.getState());
        System.out.println("-------------History----------");
        careTasker.history().forEach((memento) -> {
            System.out.println(memento.getState());
        });

    }

    public static class Originator {
        private String state;

        public String getState() {
            return this.state;
        }

        public void setState(String state) {
            this.state = state;
        }

        public Memento saveStateToMemento() {
            return new Memento(this.state);
        }

        public void getStateFromMenento(Memento memento) {
            this.state = memento.getState();
        }
    }

    static class Memento {
        private String state;

        public Memento(String state) {
            this.state = state;
        }

        public String getState() {
            return this.state;
        }

        public void setState(String state) {
            this.state = state;
        }
    }

    public static class CareTasker {
        private List<Memento> mementoList = new ArrayList<>();

        public void add(Memento memento) {
            this.mementoList.add(memento);
        }

        public Memento get(int index) {
            return this.mementoList.get(index);
        }

        public List<Memento> history() {
            return this.mementoList;
        }
    }
}
