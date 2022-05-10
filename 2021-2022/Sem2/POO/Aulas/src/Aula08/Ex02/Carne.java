package Aula08.Ex02;

public class Carne extends Alimento {
    public String carneTipo;
    public double carneProteinas;
    public double carneCalorias;
    public int carnePeso;
    public boolean veg = false;

    public Carne(String tipo, Double proteinas, Double calorias, int peso) {
        super(proteinas, calorias, peso);
        carneTipo = tipo;
    }
}
