package Aula07;

import java.util.*;

public abstract class Date {
    private static int day;
    private static int month;
    private static int year;

    public Date(int day, int month, int year) {
        this.day = day;
        this.month = month;
        this.year = year;
    }

    protected abstract void set(int daySet, int monthSet, int yearSet);
    protected abstract void increment();
    protected abstract void decrement();
    public abstract String toString();

    static void consult(int option) {
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

}
