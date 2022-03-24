package Aula03;

import java.util.*;
import java.util.Scanner;

public class Ex06 {
    public static void main(String[] args) {
		int ano, mes, numDias;
        List<Integer> meses31 = Arrays.asList(1, 3, 5, 7, 8, 10, 12);
        
        //int[] meses31 = new int[] {1, 3, 5, 7, 8, 10, 12};


		Scanner sc = new Scanner(System.in);

        System.out.print("Insira o ano > ");
        ano = sc.nextInt();

        do {
            System.out.print("Insira o mes > ");
            mes = sc.nextInt();
        } while (mes > 12 || mes < 1);




        //if (Arrays.asList(meses31).contains(mes)) {
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


		System.out.println("O mẽs " + mes + " de " + ano + " tem " + numDias + " dias.");
		sc.close();
        
    }
}
