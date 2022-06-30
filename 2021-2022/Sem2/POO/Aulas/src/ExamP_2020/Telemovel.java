package ExamP_2020;

import java.util.*;

public class Telemovel extends Produto {
    private String marca, modelo;
    private TreeSet<String> notas;

    public Telemovel(String marcaSet, String modeloSet, double priceSet) {
        super();
        this.marca = marcaSet;
        this.modelo = modeloSet;
        this.basePrice = priceSet;
        this.stock = 0;
        this.code = "T" + Integer.toString(codeInt);
        codeInt++;
        notas = new TreeSet<String>();
    }

    public void addNota(String notaSet) {
        notas.add(notaSet);
    }

    public void addStock(int stockSetter) {
        this.stock += stockSetter;
    }

    public String getDescricao() {
        return marca + "/" + modelo;
    }
}
