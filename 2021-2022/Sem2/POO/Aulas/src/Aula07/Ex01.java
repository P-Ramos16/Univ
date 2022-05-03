package Aula07;

import java.util.*;

public class Ex01 {
    public static void main(String[] args) {

        ArrayList<Forma> formList = new ArrayList<Forma>();

        while (true) {

            Scanner sc = new Scanner(System.in);

            System.out.println("Geo operations:");
            System.out.println("1 - create new figure");
            System.out.println("2 - print current figures (area/perimeter/etc)");
            System.out.println("3 - compare current figures of a type");
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
                        System.out.println(" Insert Colour:");
                        System.out.print("      > ");
                        String colour = sc.nextLine();
                        colour = sc.nextLine();
                        System.out.println(" Insert Radius:");
                        System.out.print("      > ");
                        int radius = sc.nextInt();
                        Forma currCir = new Circle(radius, colour);
                        System.out.println("");
                        System.out.println("");
                        formList.add(currCir);
                    }

                    else if (option == 2) {
                        System.out.println(" Insert Colour:");
                        System.out.print("      > ");
                        String colour = sc.nextLine();
                        System.out.println(" Insert Length:");
                        System.out.print("      > ");
                        int l = sc.nextInt();
                        System.out.println(" Insert Height:");
                        System.out.print("      > ");
                        int h = sc.nextInt();
                        Forma currRect = new Rect(0, 0, colour);
                        System.out.println("");
                        System.out.println("");
                        formList.add(currRect);
                    }

                    else if (option == 3) {
                        System.out.println(" Insert Colour:");
                        System.out.print("      > ");
                        String colour = sc.nextLine();
                        System.out.println(" Insert Length 1:");
                        System.out.print("      > ");
                        int l1 = sc.nextInt();
                        System.out.println(" Insert Length 2:");
                        System.out.print("      > ");
                        int l2 = sc.nextInt();
                        System.out.println(" Insert Length 3:");
                        System.out.print("      > ");
                        int l3 = sc.nextInt();
                        Forma currTriang = new Triang(0, 0, 0, colour); 
                        System.out.println("");
                        System.out.println("");
                        formList.add(currTriang);
                    }
                    
                    break;

                
                case(2):
                    System.out.println(" __PRINT_CURRENT_FIGURES__ ");
                    System.out.println("");
                    System.out.println("");
                    System.out.println(formList);
                    System.out.println("");
                    System.out.println("");
                    
                    break;
                
                case(3):

                System.out.println(" __COMPARE_FIGURES_OF_A_TYPE__ ");

                System.out.println("");
                System.out.println("Which figure (ids)?");
                System.out.print("     > ");
                int x = sc.nextInt();
                System.out.print("     > ");
                int y = sc.nextInt();
                System.out.println("");
                System.out.println("");

                System.out.print("Are the objects the same? >" );
                System.out.println(formList.get(x).get().equals(formList.get(y).get()));
                System.out.println("");
            
                break;
            }

        }
    }

}
