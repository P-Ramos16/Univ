package Aula02;

import java.util.Scanner;

public class Ex06 {
    public static void main(String[] args) {
		int inputS, h, m, s;
		Scanner sc = new Scanner(System.in);

		System.out.print("Insira um número de segundos >");
		inputS = sc.nextInt();

        h = inputS / 60 / 60;
        m = inputS / 60 % 60;
        s = inputS % 60 % 60;


		System.out.println("Esse número equivale a > " + h + ":" + m + ":" + s + "h");
		sc.close();
        
    }
}
