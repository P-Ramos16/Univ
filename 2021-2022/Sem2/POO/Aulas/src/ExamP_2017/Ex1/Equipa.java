package ExamP_2017.Ex1;

import java.io.ObjectInputStream.GetField;
import java.util.*;

public class Equipa {
    private String name, responsible;
    private int scoredGoals, sufferedGoals;
    private TreeSet<Robo> robos;

    public Equipa(String nome, String responsavel) {
        robos = new TreeSet<Robo>();
        this.name = nome;
        this.responsible = responsavel;
        this.scoredGoals = 0;
        this.sufferedGoals = 0;
    }

    public void scoreGoal() {
        scoredGoals++;
    }

    public void sufferedGoal() {
        sufferedGoals++;
    }

    public int getGolosMarcados() {
        int i = 0;
        for (Robo robo : robos) {
            i += robo.getGolos();
        }    
        return i;
    }

    public void add(Robo roboNovo) {
        robos.add(roboNovo);
    }

    public void remove(Robo roboNovo) {
        robos.remove(roboNovo);
    }

    @Override
    public String toString() {
        String tempStr = "";
        for (Robo robo : robos) {
            tempStr += "id=" + robo.getId() + ", tipo=" + robo.getTipo() + "*;* ";
        }

        return 
            this.name + ", treinada por " + this.responsible + " (" + robos.size() + " jogadores) \n"
            + "robos=" + tempStr + "\n golosMarcados=" + this.getGolosMarcados() + "\n";

        
    }

    public Robo[] getRobos() {
        Robo roboArray[] = new Robo[robos.size()];
        int i = 0;
        for (Robo robo : robos) {
            roboArray[i] = robo;
            i++;
        }
        return roboArray;
    }


    public String getName() {
        return this.name;
    }
}
