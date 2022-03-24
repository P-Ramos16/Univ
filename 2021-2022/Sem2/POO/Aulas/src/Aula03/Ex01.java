package Aula03;

import java.util.Scanner;

public class Ex01 {
    public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

        double notaT, notaP, notaF;

        do {
            System.out.print("Insira a nota da componente Teorica ([0.0-20.0]) > ");
            notaT = sc.nextDouble();
        }while(notaT < 0 || notaT > 20);


        do {
            System.out.print("Insira a nota da componente Prática ([0.0-20.0]) > ");
            notaP = sc.nextDouble();
        }while(notaP < 0 || notaP > 20);

        if(notaT < 7 || notaP < 7) {
            notaF = 66;
        }

        else {
            notaF = Math.round(0.4 * notaT + 0.6 * notaP);
        }


        System.out.println("Nota final > " + notaF);

		sc.close();
    }
}
