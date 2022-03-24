package Aula03;

import java.util.Scanner;

public class Ex02 {
    public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		System.out.print("Insira um número >");
		int numN = sc.nextInt();

        for (int i = numN; i >= 0; i--) {
    		System.out.print(i);
            wait(500);
            
    		System.out.print(" > ");
            wait(500);
        }

		System.out.println("FIM");

		sc.close();
    }

    public static void wait(int ms) {    
        try {
            Thread.sleep(ms);
        }

        catch(InterruptedException ex) {
            Thread.currentThread().interrupt();
        }
    }
}
