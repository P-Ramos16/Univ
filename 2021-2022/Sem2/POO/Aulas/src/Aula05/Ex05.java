package Aula05;

import java.util.*;

public class Ex05 {
    public static void main(String[] args) {

        ArrayList<Livro> livros = new ArrayList<>(100);
        ArrayList<Utilizador> alunos = new ArrayList<>(100);

        Scanner sc = new Scanner(System.in);

        while (true) {


            System.out.println("");
            System.out.println("Library operations:");
            System.out.println("1 - increver utilizador");
            System.out.println("2 - remover utilizador");
            System.out.println("3 - imprimir lista de utilizadores");
            System.out.println("4 - registar novo livro");
            System.out.println("5 - imprimir lista de livros");
            System.out.println("6 - emprestar");
            System.out.println("7 - devolver");
            System.out.println("0 - exit");
            System.out.print("     > ");
            int option = sc.nextInt();
            System.out.println("");
            System.out.println("");

            switch(option) {
                case(0):
                    System.out.println(" __EXITING__ ");
                    sc.close();
                    System.out.println("");
                    System.out.println("");
                    System.exit(0);
                    break;
                
                case(1):
                    System.out.println(" __INSCREVER_USER__ ");
                    System.out.println(" Inserir o nome:");
                    System.out.print("      > ");
                    sc.nextLine();
                    String userName = sc.nextLine();
                    System.out.println("");
                    System.out.println(" Inserir o nMec:");
                    System.out.print("      > ");
                    int nMec = sc.nextInt();
                    System.out.println(" Inserir o curso");
                    System.out.print("      > ");
                    sc.nextLine();
                    String cursoName = sc.nextLine();
                    System.out.println("");
                    System.out.println("");
                    alunos.add(new Utilizador(userName, nMec, cursoName));
                    
                    break;

                case(2):
                    System.out.println(" __REMOVER_USER__ ");
                    System.out.println(" Inserir o nMec");
                    System.out.print("      > ");
                    nMec = sc.nextInt();
                    System.out.println("");
                    System.out.println("");
                    for (Utilizador u : alunos) {
                        if (u.getnMec() == nMec) {
                            alunos.remove(u);
                        }
                    }
                        
                    break;

                
                case(3):
                    System.out.println(" __PRINT_LISTA_USERS__ ");
                    System.out.println("");
                    System.out.println("");
                    for (Utilizador u : alunos) {
                        System.out.println(u);
                    }
                    System.out.println("");
                    System.out.println("");
                    
                    break;
                
                case(4):
                    System.out.println(" __REGISTAR_LIVRO__ ");
                    System.out.println(" Inserir o titulo:");
                    System.out.print("      > ");
                    sc.nextLine();
                    String titulo = sc.nextLine();
                    System.out.println("");
                    System.out.println(" Inserir o tipo de emprestimo:");
                    System.out.print("      > ");
                    String emprestimo = sc.nextLine();
                    System.out.println("");
                    System.out.println("");
                    livros.add(new Livro(titulo, emprestimo));
                    break;

                case(5):
                    System.out.println(" __PRINT_LISTA_LIVROS__ ");
                    for (Livro l : livros) {
                        System.out.println(l);
                    }
                    break;

                case(6):
                    System.out.println(" __EMPRESTAR_LIVROS__ ");
                    System.out.println(" Inserir o id:");
                    System.out.print("      > ");
                    int id = sc.nextInt();
                    System.out.println(" Inserir o nMec");
                    System.out.print("      > ");
                    nMec = sc.nextInt();

                    for (Utilizador u : alunos) {
                        if (u.getnMec() == nMec) {
                            u.requestB(id);
                        }
                    }

                    for (Livro l : livros) {
                        if (l.getId() == id) {
                            if (l.getTipoEmprestimo()) {
                                l.emprestar("EMPRESTADO", nMec);
                            }
                            else {
                                System.out.println("Esse livro não pode ser emprestado!");
                            }
                        }
                    }
                    break;

                case(7):
                    System.out.println(" __DEVOLVER_LIVROS__ ");
                    System.out.println(" Inserir o id:");
                    System.out.print("      > ");
                    id = sc.nextInt();
                    nMec = 0;

                    for (Livro l : livros) {
                        if (l.getId() == id) {
                            nMec = l.getNmec();
                            l.emprestar("", 0);

                        }
                    }

                    for (Utilizador u : alunos) {
                        if (u.getnMec() == nMec) {
                            u.removeB(id);
                        }
                    }

                    break;
            }

        }
    }

}
