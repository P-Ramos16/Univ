package Aula05;

import java.util.*;

public class Ex05 {
    public static void main(String[] args) {

        Livro catalogo[] = new Livro[10];
        ArrayList<Utilizador> alunos = new ArrayList<>();

        while (true) {

            Scanner sc = new Scanner(System.in);

            System.out.println("Library operations:");
            System.out.println("1 - increver utilizador");
            System.out.println("2 - remover utilizador");
            System.out.println("3 - imprimir lista de utilizadores");
            System.out.println("4 - registar novo livro");
            System.out.println("5 - imprimir lista de livros");
            System.out.println("6 - emprestar");
            System.out.println("6 - devolver");
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
                    System.out.println(" __CREATE_NEW_FIGURE__ ");

                    System.out.println("Which Figure?:");
                    System.out.println("1 - Circle");
                    System.out.println("2 - Rectangle");
                    System.out.println("3 - Triangle");
                    System.out.println("0 - exit");
                    System.out.print("     > ");
                    option = sc.nextInt();
                    System.out.println("");
                    System.out.println("");

                    if (option == 1) {
                        Circle currCir = new Circle(0);
                        System.out.println(" Insert Radius:");
                        System.out.print("      > ");
                        int radius = sc.nextInt();
                        currCir.set(radius);
                        System.out.println("");
                        System.out.println("");
                        circleList.add(currCir);
                    }

                    else if (option == 2) {
                        Rect currRect = new Rect(0, 0);
                        System.out.println(" Insert Length:");
                        System.out.print("      > ");
                        int l = sc.nextInt();
                        System.out.println(" Insert Height:");
                        System.out.print("      > ");
                        int h = sc.nextInt();
                        currRect.set(l, h);
                        System.out.println("");
                        System.out.println("");
                        rectList.add(currRect);
                    }

                    else if (option == 3) {
                        Triang currTriang = new Triang(0, 0, 0); 
                        System.out.println(" Insert Length 1:");
                        System.out.print("      > ");
                        int l1 = sc.nextInt();
                        System.out.println(" Insert Length 2:");
                        System.out.print("      > ");
                        int l2 = sc.nextInt();
                        System.out.println(" Insert Length 3:");
                        System.out.print("      > ");
                        int l3 = sc.nextInt();
                        currTriang.set(l1, l2, l3);
                        System.out.println("");
                        System.out.println("");
                        triangList.add(currTriang);
                    }
                    
                    break;

                
                case(2):
                    System.out.println(" __PRINT_CURRENT_FIGURES__ ");
                    System.out.println("");
                    System.out.println("");
                    System.out.println(circleList);
                    System.out.println(rectList);
                    System.out.println(triangList);
                    System.out.println("");
                    System.out.println("");
                    
                    break;
                
                case(3):

                System.out.println(" __COMPARE_FIGURES_OF_A_TYPE__ ");

                System.out.println("Which Figure Type?:");
                System.out.println("1 - Circle");
                System.out.println("2 - Rectangle");
                System.out.println("3 - Triangle");
                System.out.println("0 - exit");
                System.out.print("     > ");
                option = sc.nextInt();
                System.out.println("");
                System.out.println("");
                System.out.println("Which figure (ids)?");
                System.out.print("     > ");
                int x = sc.nextInt();
                System.out.print("     > ");
                int y = sc.nextInt();
                System.out.println("");
                System.out.println("");

                if (option == 1) {
                    System.out.print("Are the objects the same? >" );
                    System.out.println(circleList.get(x).get().equals(circleList.get(y).get()));
                    System.out.println("");
                }

                else if (option == 2) {
                    System.out.print("Are the objects the same? > ");
                    System.out.println(rectList.get(x).get().equals(rectList.get(y).get()));
                    System.out.println("");
                }

                else if (option == 3) {
                    System.out.print("Are the objects the same? > ");
                    System.out.println(triangList.get(x).get().equals(triangList.get(y).get()));
                    System.out.println("");
                }
                break;
            }

        }
    }

}
