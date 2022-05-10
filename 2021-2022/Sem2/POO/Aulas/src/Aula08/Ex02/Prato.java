package Aula08.Ex02;

import java.util.*;

public class Prato {
    public String pratoNome; 
    public String pratoDia;
    public boolean pratoVeg;
    public double pratoCal = 0;
    public double maxCal = 0;
    public ArrayList<Alimento> IngredientesList = new ArrayList<Alimento>();

    public Prato(String nome) {
        pratoVeg = false;
        pratoNome = nome;
    }

    public void setDia(String dia) {
        pratoDia = dia;
    }

    public boolean isVeg() {
        return pratoVeg;
    }

    public String toString() {
        return "Prato '" + pratoNome + "', composto por " + IngredientesList.size() 
                + " Ingredientes";
    }

    public String print() {
        return "Prato '" + pratoNome + "', composto por " + IngredientesList.size() 
                + " Ingredientes" + ", dia " + pratoDia;
    }

    public boolean addIngrediente(Alimento alim) {
        IngredientesList.add(alim);
        return true;
    }
}
