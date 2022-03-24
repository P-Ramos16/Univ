package Aula02;

import java.util.Scanner;

public class Ex07 {
    public static void main(String[] args) {
        String[] p1, p2;
		double d;
		Scanner sc = new Scanner(System.in);

		System.out.print("Insira as posições do ponto 1 >");
		p1 = sc.nextLine().split(" "); 
        // Podemos inserir as coordenadas x e y na mesma linha 
        // separadas por um espaço sendo p1[0] = x e p1[1] = y


		System.out.print("Insira as posições do ponto 2 >");
		p2 = sc.nextLine().split(" "); 

        d = Math.sqrt(Math.pow((Integer.parseInt(p1[0]) - Integer.parseInt(p2[0])), 2) + Math.pow((Integer.parseInt(p1[1]) - Integer.parseInt(p2[1])), 2));


		System.out.println("A distância é " + d);
		sc.close();
        
    }
}
