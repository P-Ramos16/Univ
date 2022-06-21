package ExamP_2017;

import java.util.*;

public class Equipa {
    private String name, responsible;
    private int scoredGoals, sufferedGoals;
    private TreeSet<Robo> robos;

    public Equipa(String nome, String responsavel) {
        this.name = nome;
        this.responsible = responsavel;
    }
}
