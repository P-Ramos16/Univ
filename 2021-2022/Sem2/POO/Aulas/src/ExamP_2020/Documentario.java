package ExamP_2020;

import java.util.*;

public class Documentario extends Produto {
    private String titulo;
    private int ano, duracao;


    public void addStock(int stockSetter) {
        this.stock += stockSetter;
    }

    public String getDescricao() {
        return "";
    }

}
