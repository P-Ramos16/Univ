package Aula06;


public class Pessoa {
    public String nome;
    public int cc;
    public Date dataNasc;

    public Pessoa(String nome, int cc, Date d) {
        this.nome = nome;
        this.cc = cc;
        this.dataNasc = d;

    }

    String getName() {
        return this.nome;
    }
}
