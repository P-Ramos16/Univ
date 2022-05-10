package Aula08.Ex02;

public abstract class Alimento {
    public double ingreProteinas;
    public double ingreCalorias;
    public int ingrePeso;
    public String ingreNome;
    public boolean veg;

    public Alimento(String nome, Double proteinas, Double calorias, int peso) {
        ingreNome = nome;
        ingreProteinas = proteinas;
        ingreCalorias = calorias;
        ingrePeso = peso;
    }

    public double getCals() {
        return ingreCalorias;
    }

    public String toString() {
        return ingreNome + ", Proteinas " + ingreProteinas + ", Calorias " + ingreCalorias + ", Peso " + ingrePeso;
    }

    public abstract boolean isVeg();

}
