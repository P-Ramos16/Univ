package Aula05;
import java.util.*;

public class Livro {
    private int id;
    private String titulo;
    private String tipoEmprestimo;
    private String disponibilidade;
    private int nMecUser;
    private static int i = 99; 
    
    public Livro(String titulo, String tipoEmprestimo) {
        this.id = ++i;
        this.titulo = titulo;
        this.tipoEmprestimo = tipoEmprestimo;
    }

    public Livro(String titulo) {
        this.id = ++i;
        this.titulo = titulo;
        this.tipoEmprestimo = tipoEmprestimo;
    }

    public String toString() {
        return "Livro " + this.id + "; " + this.titulo + "; " + this.tipoEmprestimo + "; Emprestado a:" + nMecUser;
    }

    public int getId() {
        return this.id;
    }

    public String getTitulo() {
        return this.titulo;
    }

    public int getNmec() {
        return this.nMecUser;
    }

    public boolean getTipoEmprestimo() {
        if (tipoEmprestimo == "CONDICIONAL") {
            return true;
        }
        return false;
    }

    public void setTipoEmprestimo(String tipo) {
        this.tipoEmprestimo = tipo;
        return;
    }

    public void emprestar(String disp, int nMec) {
        this.disponibilidade = disp;
        this.nMecUser = nMec;
        return;
    }
}