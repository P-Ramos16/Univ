package Aula02;

import java.util.Scanner;

public class Ex03 {
    public static void main(String[] args) {
		double mass, inTemp, fiTemp, totEnergy;
		Scanner sc = new Scanner(System.in);

		System.out.print("Insira a massa de água (em kg) >");
		mass = sc.nextDouble();
		System.out.print("Insira a temperatura inicial (em ºC) >");
		inTemp = sc.nextDouble();
		System.out.print("Insira a temperatura final (em ºC) >");
		fiTemp = sc.nextDouble();
        
		totEnergy = mass * (fiTemp - inTemp) * 4184;

		System.out.println("A energia total necessáriia é (em Joules) " + totEnergy);
		sc.close();
        
    }
}
