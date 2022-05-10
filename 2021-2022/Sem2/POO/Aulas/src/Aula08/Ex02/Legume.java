package Aula08.Ex02;

public class Legume extends Alimento {
    public String legumeTipo;
    public double legumeProteinas;
    public double legumeCalorias;
    public int legumePeso;
    public boolean veg = true;

    public Legume(String tipo, Double proteinas, Double calorias, int peso) {
        super(proteinas, calorias, peso);
        legumeTipo = tipo;
    }
}
