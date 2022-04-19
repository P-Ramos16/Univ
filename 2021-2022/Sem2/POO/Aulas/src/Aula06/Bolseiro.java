package Aula06;

public class Bolseiro extends Aluno {
    private int bolsa;

    public Bolseiro(String Nome, int iBI, Date iDataNasc, Date iDataInsc, int bols) { 
        super(Nome, iBI, iDataNasc, iDataInsc);
        this.bolsa = bols;
    }

    public Bolseiro(String Nome, int iBI, Date iDataNasc, int bols) { 
        super(Nome, iBI, iDataNasc);
        this.bolsa = bols;
    }

    void setBolsa(int bols) {
        this.bolsa = bols;
    }

    int getBolsa() {
        return this.bolsa;
    }

    int getNMec(){
        return this.nmec;
    }

    @Override public String toString() {
        return (this.nome + "; CC: " + this.cc + "; Data de Nascimento: " + this.dataNasc);
    }
}