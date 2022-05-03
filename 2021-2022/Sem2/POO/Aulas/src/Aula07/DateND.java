package Aula07;

import java.util.*;

public class DateND extends Date {
    private static int day;
    private static int month;
    private static int year;


    public DateND(int day, int month, int year) {
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

    @Override
    public String toString() {
        int daysTo = 0;
        
        for (int y = Math.abs(year - 2000); 0 < y; y--) {
            if (leapYear(y + 2000)) {
                daysTo += 366;
            }
            else {
                daysTo += 365;
            }
        }

        for (int m = month; 1 < m; m--) {
            daysTo += monthDays(m, year);
        }

        daysTo += day - 1;

        return "      " + Integer.toString(daysTo);
    }

}