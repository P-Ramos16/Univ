package Aula08.Ex02;

public class PratoVegetariano extends Prato{
    public boolean pratoVeg;
    public double maxCal = 0;
    

    public PratoVegetariano(String nome) {
        super(nome);
        pratoVeg = true;
    }

    public String toString() {
        return "Prato '" + pratoNome + "', composto por " + IngredientesList.size() 
                + " Ingredientes - Prato Vegetariano";
    }

    public String print() {
        return "Prato '" + pratoNome + "', composto por " + IngredientesList.size() 
                + " Ingredientes" + ", dia " + pratoDia;
    }
    
    public boolean addIngrediente(Alimento alim) {
        if (alim.isVeg()) {
            IngredientesList.add(alim);
            return true;
        }
        return false;
    }
}
