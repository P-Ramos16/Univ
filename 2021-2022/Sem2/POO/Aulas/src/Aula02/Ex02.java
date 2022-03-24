package Aula02;

import java.util.Scanner;

public class Ex02 {
    public static void main(String[] args) {
		double cel, fahr;
		Scanner sc = new Scanner(System.in);
        
		System.out.print("Insira a temperatura em ºC >");
		cel = sc.nextDouble();

		fahr = cel * 1.8 + 32;

		System.out.println("A temperatura em ºF é " + fahr);
		sc.close();
        
    }
}
