import java.util.HashMap;
import java.util.Map;

public class Pc extends ComputerImpl {

    Accessory accessory = new PcAccssroy();

    @Override
    public String cases() {
        System.out.println("케이스");
        return super.cases();
    }

    @Override
    public String cooler() {
        System.out.println("쿨러");
        return super.cooler();
    }
    
    @Override
    public String cpu() {
        System.out.println("cpu");
        return super.cpu();
    }
    
    @Override
    public String mainboard() {
        System.out.println("mainboard");
        return super.mainboard();
    }
    
    @Override
    public String nvme() {
        System.out.println("nvme");
        return super.nvme();
    }
    
    @Override
    public String powerSupply() {
        System.out.println("powerSupply");
        return super.powerSupply();
    }
    
    @Override
    public String ram() {
        System.out.println("ram");
        return super.ram();
    }

    public Map<String, Boolean> acceroryItem(){
        boolean mouse = accessory.mouse();
        boolean keyboard = accessory.keyboard();
        boolean monitor = accessory.monitor();

        Map<String, Boolean> accessoryItem = new HashMap<>();

        accessoryItem.put("mouse", mouse);
        accessoryItem.put("keyboard", keyboard);
        accessoryItem.put("monitor", monitor);

        return accessoryItem;
    }
    
}
