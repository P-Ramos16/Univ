package ExamP_2020;

public class Autor {
    private String nome;
    private int ano;

    public Autor(String name, int anoNasc) {
        this.nome = name;
        this.ano = anoNasc;
    }

    @Override
    public String toString() {
        return nome + "(" + ano + "~)";
    }
}
