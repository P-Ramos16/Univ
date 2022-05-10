package Aula08.Ex02;

public class Peixe extends Alimento {
    public String peixeTipo;
    public double peixeProteinas;
    public double peixeCalorias;
    public int peixePeso;
    public boolean veg = false;

    public Peixe(String tipo, Double proteinas, Double calorias, int peso) {
        super(tipo, proteinas, calorias, peso);
        peixeTipo = tipo;
    }

    public boolean isVeg() {
        return veg;
    }

}
