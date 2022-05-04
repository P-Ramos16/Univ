package Aula07;

public abstract class Viatura extends Agencia {
    
    public Viatura(String name, String vClass) {
        super();
    }
    
    public abstract String get();
    public abstract String print();
    public abstract void request();
    public abstract void recieve();
    public abstract void set(String vname, Character vClass, String vType);
}
