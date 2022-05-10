package Aula08.Ex02;

public abstract class Alimento {
    public double ingreProteinas;
    public double ingreCalorias;
    public int ingrePeso;

    public Alimento(Double proteinas, Double calorias, int peso) {
        ingreProteinas = proteinas;
        ingreCalorias = calorias;
        ingrePeso = peso;
    }
}
