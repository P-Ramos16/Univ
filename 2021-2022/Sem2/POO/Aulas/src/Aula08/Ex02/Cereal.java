package Aula08.Ex02;

public class Cereal extends Alimento {
    public String cerialTipo;
    public double cerialProteinas;
    public double cerialCalorias;
    public int cerialPeso;
    public boolean veg = true;

    public Cereal(String tipo, Double proteinas, Double calorias, int peso) {
        super(proteinas, calorias, peso);
        cerialTipo = tipo;
    }
}
