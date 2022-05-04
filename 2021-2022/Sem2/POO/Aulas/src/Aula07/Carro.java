package Aula07;

public class Carro extends Viatura {
    
    private String viaturaName;
    private Character viaturaClass;
    private String viaturaType;
    private Boolean viaturaReserved;
    
    public Carro() {
        super(agenciaName, agenciaAddress);
    }

    public void set(String vname, Character vClass, String vType) {
        viaturaName = vname;
        viaturaType = vType;
        viaturaClass = 'A';
        viaturaReserved = false;
        
        if (vClass >= 'A' && vClass <= 'F') {
            viaturaClass = vClass;
        }
    }

    public String print() {
        return "Viatura: " + viaturaName + " " + "Class: " + viaturaClass + " " + "Type: " + viaturaType + " " + "Reserved: " + viaturaReserved; 
    }

    public String get() {
        return viaturaName;
    }

    public void request() {
        if (!viaturaReserved) {
            viaturaReserved = true;

            System.out.println("DONE");
        }
        System.out.println("TRIED");
    }

    public void recieve() {
        if (viaturaReserved) {
            viaturaReserved = false;
        }
    }
}
