package Aula09;


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

    @Override
    public String toString() {
        return String.format("Nome: %-8s CC: %-2s Data de Nascimento: %-10s", nome, cc, dataNasc.toString());
    }
}
