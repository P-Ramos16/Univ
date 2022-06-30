package ExamP_2020;

import java.util.*;

public class Livro extends Produto {
    private String titulo;
    private List<Autor> autores;
    private int ano, duracao;

    public Livro(String title, double price) {
        super();
        this.basePrice = price;
        this.titulo = title;
        this.code = "L" + Integer.toString(codeInt);
        codeInt++;
        this.stock = 0;
        autores = new LinkedList<Autor>();

    }

    public Livro(String title, double price, List<Autor> auts) {
        super();
        this.basePrice = price;
        this.titulo = title;
        this.code = "L" + Integer.toString(codeInt);
        codeInt++;
        this.stock = 0;
        this.autores = auts;
        autores = new LinkedList<Autor>();

    }

    public void setStock(int stockSetter) {
        this.stock = stockSetter;
    }

    public void addStock(int stockSetter) {
        this.stock += stockSetter;
    }

    public void add(Autor aut) {
        autores.add(aut);
    }

    public String getTitulo() {
        return titulo;
    }

    public List<Autor> getLista() {
        return autores;
    }

    public int numeroAutores() {
        return autores.size();
    }

    public String autores() {
        String tempStr = "[";
        for (Autor autor : autores) {
            tempStr += autor.toString() + ", ";
        }
        tempStr += "]";
        return tempStr;
    }

    public String getDescricao() {
        return "";
    }
}
