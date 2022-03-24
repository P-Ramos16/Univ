package Aula03;

import java.util.Scanner;

public class Ex03 {
    public static void main(String[] args) { 

		int num;
        double numSqrt;
        String res = "O número é primo";


		Scanner sc = new Scanner(System.in);

        do {
            System.out.print("Insira um número positivo >");
            num = sc.nextInt();
        } while(num < 0);

        numSqrt = Math.sqrt(num);

        for (int div = 2; div <= numSqrt; div++) {
            System.out.print("Divisivel por " + div + "? ");
            if (num % div == 0) {
                res = "O número não é primo";
                System.out.println("Sim");
            }
            else {
                System.out.println("Nope");
            }
        }        
        System.out.println(res);
        
		sc.close();
    }
    
}
