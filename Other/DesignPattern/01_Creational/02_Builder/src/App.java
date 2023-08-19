public class App {
    public static void main(String[] args) {
        ComputerDTO computerDTO = ComputerDTO.builder().build();

        System.out.println(computerDTO);
        System.out.println(System.identityHashCode(computerDTO));
        computerDTO = computerDTO.builder()
                                .setCPU("cpu")
                                .setRAM("ram")
                                .setMAINBOARD("mainboard")
                                .setPOWERSUPPLY("powersupply")
                                .setSSD("ssd")
                                .build();
        
        System.out.println(computerDTO);
        System.out.println(System.identityHashCode(computerDTO));

        computerDTO = computerDTO.deepCopy();
        System.out.println(computerDTO);
        System.out.println(System.identityHashCode(computerDTO));

    }
}
