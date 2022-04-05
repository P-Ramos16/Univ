package Aula05;
import java.util.*;

public class Livro {
    private int id;
    private String titulo;
    private String tipoEmprestimo;
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
        return "Livro " + this.id + "; " + this.titulo + "; " + this.tipoEmprestimo;
    }

    public String getId() {
        return Integer.toString(this.id);
    }

    public String getTitulo() {
        return this.titulo;
    }

    public void setTipoEmprestimo(String tipo) {
        this.tipoEmprestimo = tipo;
        return;
    }
}