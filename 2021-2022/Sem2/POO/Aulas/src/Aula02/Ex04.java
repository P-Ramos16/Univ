package Aula02;

import java.util.Scanner;

public class Ex04 {
    public static void main(String[] args) {
		double taxa, montInicial, valTotal;
		Scanner sc = new Scanner(System.in);
        
		System.out.print("Insira o montante investido >");
		montInicial = sc.nextDouble();
		System.out.print("Insira a taxa de juro mensal >");
		taxa = sc.nextDouble();

        valTotal = montInicial;

        for (int i = 0; i < 3; i++) {
            valTotal += valTotal * taxa / 100;
        }

		System.out.println("O valor final depois de 3 meses é" + valTotal);
		sc.close();
        
    }
}
