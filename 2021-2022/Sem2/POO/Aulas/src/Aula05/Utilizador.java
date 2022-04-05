package Aula05;
import java.util.*;

public class Utilizador {
    private String nome;
    private int nMec;
    private String curso; 
        
    public Utilizador(String nome, int nMec, String curso) {
        this.nome = nome;
        this.nMec = nMec;
        this.curso = curso;
    }

    public String toString() {
        return "Aluno " + this.nMec + "; " + this.nome + "; " + this.curso;
    }

    public void setnMec(int n) {
        this.nMec = n;
        return;
    }
}