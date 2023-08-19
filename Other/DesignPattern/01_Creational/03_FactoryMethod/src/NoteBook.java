import java.util.HashMap;
import java.util.Map;

public class NoteBook extends ComputerImpl {

    Accessory accessory = new NoteBookAccssory();
    
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
    public String ram() {
        System.out.println("ram");
        return super.ram();
    }


    public Map<String, Boolean> acceroryItem(){
        boolean mouse = accessory.mouse();
    
        Map<String, Boolean> accessoryItem = new HashMap<>();

        accessoryItem.put("mouse", mouse);


        return accessoryItem;
    }
    
}
