package Aula07;

import java.util.*;

public class Ex02 {
    public static void main(String[] args) {

        Date currDate = new DateYMD(1, 1, 1970);
        Date daysTill = new DateND(1, 1, 1970);

        while (true) {

            Scanner sc = new Scanner(System.in);

            System.out.println("Date operations:");
            System.out.println("1 - create new date");
            System.out.println("2 - show current date");
            System.out.println("3 - increment date");
            System.out.println("4 - decrement date");
            System.out.println("5 - days until 1-1-2000");
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
                    System.out.println(" __CREATE_NEW_DATE__ ");

                    System.out.println(" Insert Year:");
                    System.out.print("      > ");
                    int year = sc.nextInt();

                    System.out.println(" Insert Month:");
                    System.out.print("      > ");
                    int month = sc.nextInt();

                    System.out.println(" Insert Day:");
                    System.out.print("      > ");
                    int day = sc.nextInt();

                    currDate.set(day, month, year);
                    daysTill.set(day, month, year);

                    System.out.println("");
                    System.out.println("");
                    System.out.println(currDate.toString());
                    System.out.println("");
                    System.out.println("");
                    break;

                
                case(2):
                    System.out.println(" __SHOW_CURRENT_DATE__ ");
                    System.out.println("");
                    System.out.println("");
                    System.out.println(currDate.toString());
                    System.out.println("");
                    System.out.println("");
                    
                    break;
                
                case(3):
                    System.out.println(" __INCREMENT_DATE__ ");
                    currDate.increment();
                    daysTill.increment();
                    System.out.println("");
                    System.out.println("");
                    System.out.println(currDate.toString());
                    System.out.println("");
                    System.out.println("");
                    break;

                case(4):
                    System.out.println(" __DECREMENT_DATE__ ");
                    currDate.decrement();
                    daysTill.decrement();
                    System.out.println("");
                    System.out.println("");
                    System.out.println(currDate.toString());
                    System.out.println("");
                    System.out.println("");
                    break;

                case(5):
                    System.out.println(" __Days_Until_1_1_2000__ ");
                    daysTill.toString();
                    System.out.println("");
                    System.out.println("");
                    System.out.println(daysTill.toString());
                    System.out.println("");
                    System.out.println("");
                    break;
            }

        }
    }
}
