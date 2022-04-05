package Aula05;

import java.util.*;

public class Ex02 {
    public static void main(String[] args) {

        Calender currCal = new Calender(1, 1970);

        while (true) {

            Scanner sc = new Scanner(System.in);

            System.out.println("Date operations:");
            System.out.println("1 - create new calendar");
            System.out.println("2 - print calender month");
            System.out.println("3 - increment print calender");
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
                    System.out.println(" __CREATE_NEW_CALENDER__ ");

                    System.out.println(" Insert Year:");
                    System.out.print("      > ");
                    int year = sc.nextInt();

                    System.out.println(" Insert First WeekDay of Year:");
                    System.out.print("      > ");
                    int weekDay = sc.nextInt();


                    currCal.set(weekDay, year);

                    System.out.println("");
                    System.out.println("");
                    currCal.printMonth(4, year);
                    System.out.println("");
                    System.out.println("");
                    break;

                
                case(2):
                    System.out.println(" __PRINT_CALENDER_MONTH__ ");
                    System.out.println("");
                    System.out.println("");
                    System.out.println(currCal.toString());
                    System.out.println("");
                    System.out.println("");
                    
                    break;
                
                case(3):
                    System.out.println(" __INCREMENT_CALENDER__ ");
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
