package Aula02;

import java.util.Scanner;

public class Ex05 {
    public static void main(String[] args) {
		double v1, v2, d1, d2, h1, h2, vMedia;
		Scanner sc = new Scanner(System.in);

		System.out.print("Insira a velocidade 1 >");
		v1 = sc.nextDouble();

		System.out.print("Insira a velocidade 2 >");
		v2 = sc.nextDouble();

		System.out.print("Insira a distância 1 >");
		d1 = sc.nextDouble();

		System.out.print("Insira a distância 2 >");
		d2 = sc.nextDouble();

        h1 = d1 / v1;
        h2 = d2 / v2;

        vMedia = (d1 + d2) / (h1 + h2);

		System.out.println("A velocidade média é" + vMedia);
		sc.close();
        
    }
}
