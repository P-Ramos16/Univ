package Aula06;

public class Aluno extends Pessoa {
    
    public int nmec;
    private Date dataInsc;
    private static int i = 99; 

    public Aluno(String Nome, int iBI, Date iDataNasc, Date iDataInsc) { 
        super(Nome, iBI, iDataNasc);
        this.nmec = ++i;
        this.dataInsc = iDataInsc;
    }

    public Aluno(String Nome, int iBI, Date iDataNasc) { 
        super(Nome, iBI, iDataNasc);
        this.nmec = ++i;
    }

    int getNmec() {
        return this.nmec;
    }
    
//    String getName() {
//        return this.nome;
//    }
}