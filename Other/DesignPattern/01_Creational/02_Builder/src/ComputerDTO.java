public class ComputerDTO {

    private final String CPU;
    private final String RAM;
    private final String MAINBOARD;
    private final String SSD;
    private final String HDD;
    private final String POWERSUPPLY;
    
    public String getCPU() {
        return CPU;
    }
    public String getRAM() {
        return RAM;
    }
    public String getMAINBOARD() {
        return MAINBOARD;
    }
    public String getSSD() {
        return SSD;
    }
    public String getHDD() {
        return HDD;
    }

    public String getPOWERSUPPLY() {
        return POWERSUPPLY;
    }
    
    public ComputerDTO(Builder builder) {
        this.CPU = builder.CPU;
        this.RAM = builder.RAM;
        this.MAINBOARD = builder.MAINBOARD;
        this.SSD = builder.SSD;
        this.HDD = builder.HDD;
        this.POWERSUPPLY = builder.POWERSUPPLY;
    }

    public ComputerDTO(ComputerDTO computerDTO) {
        this.CPU = computerDTO.CPU;
        this.RAM = computerDTO.RAM;
        this.MAINBOARD = computerDTO.MAINBOARD;
        this.SSD = computerDTO.SSD;
        this.HDD = computerDTO.HDD;
        this.POWERSUPPLY = computerDTO.POWERSUPPLY;
    }

    public static Builder builder(){
        return new Builder();
    }

    public static class Builder {
        private String CPU;
        private String RAM;
        private String MAINBOARD;
        private String SSD;
        private String HDD;
        private String POWERSUPPLY;
        
        public Builder setCPU(String cPU) {
            this.CPU = cPU;
            return this;
        }
        public Builder setRAM(String rAM) {
            this.RAM = rAM;
            return this;
        }
        public Builder setMAINBOARD(String mAINBOARD) {
            this.MAINBOARD = mAINBOARD;
            return this;
        }
        public Builder setSSD(String sSD) {
            this.SSD = sSD;
            return this;
        }
        public Builder setHDD(String hDD) {
            this.HDD = hDD;
            return this;
        }

        public Builder setPOWERSUPPLY(String pOWERSUPPLY) {
            this.POWERSUPPLY = pOWERSUPPLY;
            return this;
        }

        public ComputerDTO build() {
            return new ComputerDTO(this);
        }


    }

    @Override
    public String toString() {
        return "ComputerDTO [CPU=" + CPU + ", RAM=" + RAM + ", MAINBOARD=" + MAINBOARD + ", SSD=" + SSD + ", HDD=" + HDD
                + ", POWERSUPPLY=" + POWERSUPPLY + "]";
    }

    public ComputerDTO deepCopy() {
        return new ComputerDTO(this);
    }
    
}
