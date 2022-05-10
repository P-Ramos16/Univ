package Aula08.Ex02;

import java.util.*;

public class Ementa {
 
    public String ementaNome;
    public String ementaLocal;

    public ArrayList<Prato> PratoList = new ArrayList<Prato>();

    public Ementa(String nome, String local) {
        ementaNome = nome;
        ementaLocal = local;
    }

    public void addPrato(Prato pratoX, String dia) {
        pratoX.setDia(dia);
        PratoList.add(pratoX);
    }

    public String toString() {

        String finalString = "";

        for (int i = 0; i < PratoList.size(); i++) {
            finalString += PratoList.get(i).print() + "\n";
        }

        return finalString;
    }
}
