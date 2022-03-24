package Aula03;

import java.util.Scanner;

public class Ex08 {
    public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

        double notaT, notaP, notaF;

        double[][] notas = new double[15][3];

        for (int i = 0; i < 15; i++) {  
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

            notas[i][0] = notaT;
            notas[i][1] = notaP;
            notas[i][2] = notaF;

        }

        System.out.println("NotasT |  NotasP  |  Pauta");
         
        for (int i = 0; i < 15; i++) {
            System.out.printf("%6.1f    %6.1f    %5d", notas[i][0], notas[i][1], Math.round(notas[i][2]));
            System.out.println();
        }

		sc.close();
    }
}
