package Aula07;

public abstract class Forma {
    public static String type;

    public Forma(String tipo, String colour) {
        type = tipo;
    }

    public abstract void cor(String cor);
    public abstract double area();
    public abstract double perimeter();
    public abstract String get();
    public abstract String toString();
}
