package Aula07;

public class Agencia {
    
    public static String agenciaName;
    public static String agenciaAddress;
    
    public Agencia(){}


    public void set(String name, String address) {
        agenciaName = name;
        agenciaAddress = address;
    }

    public String get() {
        return "Name: " + agenciaName + " Address: " + agenciaAddress;
    }
}
