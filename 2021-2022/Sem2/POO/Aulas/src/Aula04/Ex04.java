package Aula04;

import java.util.*;
import java.util.Scanner;

public class Ex04 {

    public static int calcDiasMes(int mes, int ano) {
        int numDias = 30;
        List<Integer> meses31 = Arrays.asList(1, 3, 5, 7, 8, 10, 12);
        
        if (meses31.contains(mes)) {
            numDias = 31;
        }

        else if (mes == 2) {
            if (ano % 4 == 0) {
                numDias = 29;
            }

            else {
                numDias = 28;
            }
        }

        else {
            numDias = 30;
        }

        return numDias;
    }



    public static void printCalen(int mes, int ano, int diaSemana, int diasMes) {

        String[] diasArr = new String[40];
        String mesStr = "Erro";

        if (diaSemana == 7) {
            diaSemana = 0;
        }

        for (int i = 0; i < diaSemana; i++) {
            diasArr[i] = "  ";
        }

        for (int i = 1; i <= diasMes; i++) {
            diasArr[i + diaSemana - 1] = Integer.toString(i);
        }

        for (int i = diasMes + diaSemana; i < diasArr.length; i++) {
            diasArr[i] = "  ";
        }


        switch(mes) {
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
        System.out.println("|     " + mesStr + " " + ano + "    |");
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



    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Insira o mês > ");
        int mes = sc.nextInt();

        System.out.print("Insira o ano > ");
        int ano = sc.nextInt();

        System.out.print("Insira o dia da semana do dia 1 > ");
        int diaSemana = sc.nextInt();

        int diasMes = calcDiasMes(mes, ano);

        printCalen(mes, ano, diaSemana, diasMes);



    }
}
