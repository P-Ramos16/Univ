package Aula03;

import java.util.Scanner;

public class Ex07 {
    public static void main(String[] args) {
		int guessN;
        int max = 100, min = 0, numTries = 0;
        int randN = (int)(Math.random() * 100);
		Scanner sc = new Scanner(System.in);
        
        do {

            do {
                System.out.print("Insira um número entre " + min + " e " + max + " > ");
                guessN = sc.nextInt();
            } while(guessN < min || guessN > max);

            if (guessN < randN) {
                System.out.println("O número é mais alto!");
                min = guessN;
            }

            else if (guessN > randN) {
                System.out.println("O número é mais baixo!");
                max = guessN;
            }

            numTries ++;

        } while(guessN != randN);

		System.out.println("-----------------------");
		System.out.println("O número era: " + randN);
		System.out.println("Precisaste de : " + numTries + " tentativas");
		sc.close();
        
    }
}
