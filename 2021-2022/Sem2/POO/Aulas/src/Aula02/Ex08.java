package Aula02;

import java.util.Scanner;

public class Ex08 {
    public static void main(String[] args) {
		double A, B, C, ang0;
		Scanner sc = new Scanner(System.in);

		System.out.print("Insira o cateto A >");
		A = sc.nextDouble();

		System.out.print("Insira o cateto B >");
		B = sc.nextDouble();

        C = Math.sqrt(Math.pow(A, 2) + Math.pow(B, 2));

        ang0 = Math.toDegrees(Math.asin(B/C));
        
		System.out.println("A hipótenusa tem valor " + C);
		System.out.println("O angulo entre A e C tem valor " + Math.round(ang0) + "º");
		sc.close();
        
    }
}
