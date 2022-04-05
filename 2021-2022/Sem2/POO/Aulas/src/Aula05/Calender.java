package Aula05;

public class Calender {
    private int weekDay;
    private int year;
    private int weekDayMonth; 

    Date currDate = new Date(1, 1, year);

    public Calender(int weekDay, int year) {


        if (1 <= weekDay || weekDay <= 7) {
            this.weekDay = weekDay;
            this.year = year;
        }
        else {
            System.out.println("Ivalid Date!!!");
        }

    }
    
    public void set(int weekDay, int year) {

        if (1 <= weekDay || weekDay <= 7) {
            this.weekDay = weekDay;
            this.year = year;
        }
        
        else {
            System.out.println("Ivalid Date!!!");
        }


        return;
    }

    public void consult() {
        System.out.println(" Year   >" + year);
        return;
    }

    public void firstWeekdayOfYear() {
        System.out.println(" First WeekDay of year >" + weekDay);
        return;
    }

    public void firstWeekdayOfMonth(int month) {
        currDate.set(1, month, year);

        int daysSinceBeggining = 0;
        for (int i = 1; i < month; i++ ){
            daysSinceBeggining+= currDate.monthDays(i, year);
        }
        System.out.println(daysSinceBeggining);
        weekDayMonth = ((daysSinceBeggining + weekDay))  % 7; 


        if (weekDayMonth == 7) {
            weekDayMonth = 0;
        }

        System.out.println(" First WeekDay of month>" + this.weekDayMonth);

        return;
    }

    public void printMonth(int month, int year) {
        int monthDays = currDate.monthDays(month, year);
        firstWeekdayOfMonth(month);
        weekDayMonth = this.weekDayMonth;
        String[] diasArr = new String[40];
        String mesStr = "Erro";


        for (int i = 0; i < weekDayMonth; i++) {
            diasArr[i] = "  ";
        }

        for (int i = 1; i <= monthDays; i++) {
            diasArr[i + weekDayMonth - 1] = Integer.toString(i);
        }

        for (int i = monthDays + weekDayMonth; i < diasArr.length; i++) {
            diasArr[i] = "  ";
        }


        switch(month) {
            case (1):
                mesStr = "January";
                break;
            case (2):
                mesStr = "February";
                break;            
            case (3):
                mesStr = "March";
                break;
            case (4):
                mesStr = "April";
                break;
            case (5):
                mesStr = "May";
            break;
            case (6):
                mesStr = "June";
                break;            
            case (7):
                mesStr = "July";
                break;
            case (8):
                mesStr = "August";
                break;
            case (9):
                mesStr = "September";
                break;
            case (10):
                mesStr = "October";
                break;            
            case (11):
                mesStr = "November";
                break;
            case (12):
                mesStr = "December";
                break;
        }

        System.out.println(" ______________________");
        System.out.println("|     " + mesStr + " " + year + "    |");
        System.out.println("|----------------------|");
        System.out.println("| Su Mo Tu We Th Fr Sa |");
        for (int x = 0; x < 5; x++) {

            System.out.print("|");

            for (int y = 0; y < 7; y++) {

                System.out.printf("%3s" , diasArr[y + 7 * x]);

            }

            System.out.println(" |");
        }
        System.out.println("|______________________|");

    }

    public String toString() {
        System.out.println(" Year   >" + year);
        for (int i = 1; i <= 12; i++) {
            printMonth(i, year);
        }
        return "Fim";
    }

}
