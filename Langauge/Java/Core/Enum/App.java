public class App {

    public static void main(String[] args) {
        Level level = Level.LOW;
        System.out.println(level.getValue());
        System.out.println(level.getNumber());

        System.out.println(Level.MEDIUM.getValue());
        System.out.println(Level.MEDIUM.getValue() == "Medium");
        System.out.println(Level.MEDIUM.getNumber());

        System.out.println(Level.HIGH.getValue());
        System.out.println(Level.HIGH.getNumber());

        System.out.println(Level.MEDIUM.ordinal());
    }

    enum Level {
        LOW("Low", 1),
        MEDIUM("Medium", 2),
        HIGH("High", 3);
        
        private String value;
        private int number;
        
        private Level(String value, int number) {
            this.value = value;
            this.number = number;
        }

        public String getValue() {
            return value;
        }

        public int getNumber() {
            return number;
        }
    }
}
    
