package Aula05;

public class Utilizador {
    private String nome;
    private int nMec;
    private String curso; 
    private int[] requestedBooks = new int[3];
        
    public Utilizador(String nome, int nMec, String curso) {
        this.nome = nome;
        this.nMec = nMec;
        this.curso = curso;
    }

    public String toString() {
        return "Aluno " + this.nMec + "; " + this.nome + "; " + this.curso + "; Livros:" + requestedBooks;
    }

    public void setnMec(int n) {
        this.nMec = n;
        return;
    }

    public int getnMec() {
        return this.nMec;
    }

    public void requestB(int bookId) {
        for (int i = 0; i < this.requestedBooks.length; i++) {
            if (this.requestedBooks[i] == 0) {
                this.requestedBooks[i] = bookId;
                return;
            }
        }
        System.out.println("O utilizador já tem 3 livros requesitados!!");
    }


    public void removeB(int bookId) {
        for (int i = 0; i < this.requestedBooks.length; i++) {
            if (this.requestedBooks[i] == bookId) {
                this.requestedBooks[i] = 0;
                return;
            }
        }
        System.out.println("O utilizador não tem esse livro requesitado!!");
    }
}