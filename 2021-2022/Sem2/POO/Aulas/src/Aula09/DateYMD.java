package Aula09;

import java.util.*;

public class DateYMD extends Date {
    private static int day;
    private static int month;
    private static int year;


    public DateYMD(int day, int month, int year) {
        super(day, month, year);

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
            System.out.println("Invalid Date!!!");
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

        return Integer.toString(year) + "-" + Integer.toString(month) + "-" + Integer.toString(day);
    }

}