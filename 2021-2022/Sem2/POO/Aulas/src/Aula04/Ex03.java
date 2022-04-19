package Aula04;

import java.util.Scanner;

public class Ex03 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Insira uma frase > ");
        String str = sc.nextLine();
        String[] arr = str.split(" ");
        StringBuilder sb = new StringBuilder();

        for (String strX : arr) {
            if (strX.length() > 3) {
                sb.append(Character.toUpperCase(strX.charAt(0)));
            }
        }

        System.out.println("Acrónimo > " + sb);
        sc.close();

    }
}
