package Aula03;

import java.util.Scanner;

public class Ex05 {
    public static void main(String[] args) {
		double taxa, montInicial, valTotal;
		Scanner sc = new Scanner(System.in);
        

        do {
            System.out.print("Insira o montante investido (multiplo de 1000 e positivo) >");
            montInicial = sc.nextDouble();
        } while (montInicial % 1000 != 0 || montInicial < 0);

        do {
            System.out.print("Insira a taxa de juro mensal (entre 0% e 5%) >");
            taxa = sc.nextDouble();
        } while (taxa > 5 || taxa < 0);

        valTotal = montInicial;

        for (int i = 0; i < 12; i++) {
            System.out.print("Mês " + i + " > ");
            valTotal += valTotal * taxa / 100;
            System.out.println(valTotal + "€");
        }

		sc.close();
        
    }
}
