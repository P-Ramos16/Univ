package Aula05;

import java.util.*;

public class Date {
    private int day;
    private int month;
    private int year;

    public Date(int day, int month, int year) {

        if (valid(day, month, year)) {
            this.day = day;
            this.month = month;
            this.year = year;
        }

        else {
            System.out.println("Data Inválida!!!");
        }


    }


    public void set(int daySet, int monthSet, int yearSet) {

        if (valid(daySet, monthSet, yearSet)) {
            day = daySet;
            month = monthSet;
            year = yearSet;
        }

        else {
            System.out.println("Ivalid Date!!!");
        }

        return;
    }

    public void consult(int option) {
        switch(option) {
            case(0):
                System.out.println(" Day    >" + day);
                break;
            case(1):
                System.out.println(" Month  >" + month);
                break;
            case(2):
                System.out.println(" Year   >" + year);
                break;
        }
        return;
    }

    public void increment() {
        day += 1;

        if (day > monthDays(month, year)) {

            month += 1;
            day = 1;

            if (!validMonth(month)) {
                month = 1;
                year += 1;
            }

        }
    }

    public void decrement() {
        day -= 1;

        if (day == 0 ) {

            month -= 1;

            if (!validMonth(month)) {
                month = 12;
                year -= 1;
            }

            day = monthDays(month, year);
            
        }
    }

    public String toString() {

        return "      " + Integer.toString(year) + "-" + Integer.toString(month) + "-" + Integer.toString(day);
    }

    static boolean validMonth(int month) {

        if (month <= 0 || month >= 13) {
            return false;
        }

        return true;
    }

    static int monthDays(int month, int year) {
        int numDays = 30;

        List<Integer> months31 = Arrays.asList(1, 3, 5, 7, 8, 10, 12);

        if (months31.contains(month)) {
            numDays = 31;
        }

        else if (month == 2) {
            if (year % 4 == 0) {
                numDays = 29;
            }

            else {
                numDays = 28;
            }
        }

        return numDays;
    }

    static boolean leapYear(int year) {

        if (year % 4 == 0) {
            return true;
        }
        
        return false;

    }

    static boolean valid(int day, int month, int year) {

        if (!validMonth(month)) {
            return false;
        }

        if (monthDays(month, year) < day || day < 0) {
            System.out.println("Invalid day!!");
            return false;                
        }

        return true;
    }

}