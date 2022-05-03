package Aula07;

public class Carro extends Viatura {
    
    private static String viaturaName;
    private static Character viaturaClass;
    private static String viaturaType;
    private static String viaturaReserved = "No";
    
    public Carro() {
        super(agenciaName, agenciaAddress);
    }

    public void set(String vname, Character vClass, String vType) {
        viaturaName = vname;
        viaturaType = vType;
        viaturaClass = 'A';
        
        if (vClass >= 'A' && vClass <= 'F') {
            viaturaClass = vClass;
        }
    }

    public String get() {
        return "Viatura: " + viaturaName + " " + "Class: " + viaturaClass + " " + "Type: " + viaturaType + " " + "Reserved: " + viaturaReserved; 
    }

    public void reserve() {
        if (viaturaReserved == "No") {
            viaturaReserved = "Yes";
        }
        else {
            viaturaReserved = "No";
        }
    }
}
