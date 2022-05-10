package Aula08.Ex02;

public class PratoDieta extends Prato {

    public double maxCal = 100;
    public double dietaCal;
    public boolean pratoVeg;

    public PratoDieta(String nome, double Cal) {
        super(nome);
        pratoVeg = false;
        if (dietaCal < maxCal) {
            dietaCal = Cal;
        }
    }

    public String toString() {
        return "Prato '" + pratoNome + "', composto por " + IngredientesList.size() 
                + " Ingredientes - Prato Dieta";
    }

    public String print() {
        return "Prato '" + pratoNome + "', composto por " + IngredientesList.size() 
                + " Ingredientes" + ", dia " + pratoDia;
    }

    public boolean addIngrediente(Alimento alim) {
        if (alim.getCals() + pratoCal < maxCal) {
            IngredientesList.add(alim);
            return true;
        }
        return false;
    }
}
