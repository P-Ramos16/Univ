package Aula05;

import java.util.*;

public class Ex03 {
    public static void main(String[] args) {

        Circle currCir = new Circle(0);
        Rect currRect = new Rect(0, 0);
        Triang currTriang = new Triang(1, 2, 4);


        while (true) {

            Scanner sc = new Scanner(System.in);

            System.out.println("Geo operations:");
            System.out.println("1 - create new figure");
            System.out.println("2 - print calender month");
            System.out.println("3 - print calender");
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

                    switch(option) {
                        case(0):
                            System.out.println(" Insert Radius:");
                            System.out.print("      > ");
                            int radius = sc.nextInt();
                            Circle.set(radius);        
                            System.out.println("");
                            System.out.println("");
                            break;



                    break;

                
                case(2):
                    System.out.println(" __PRINT_CALENDER_MONTH__ ");
                    System.out.println("");
                    System.out.println("");

                    System.out.println(" Insert Year:");
                    System.out.print("      > ");
                    int yearPrint = sc.nextInt();

                    System.out.println(" Insert Month:");
                    System.out.print("      > ");
                    int monthPrint = sc.nextInt();

                    currCal.printMonth(monthPrint, yearPrint);
                    System.out.println("");
                    System.out.println("");
                    
                    break;
                
                case(3):
                    System.out.println(" __PRINT_CALENDER__ ");
                    System.out.println("");
                    System.out.println("");

                    System.out.println(currCal.toString());
                    System.out.println("");
                    System.out.println("");
                    break;
            }

        }
    }

}
