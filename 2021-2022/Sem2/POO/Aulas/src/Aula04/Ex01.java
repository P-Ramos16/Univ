package Aula04;

import java.util.Scanner;

public class Ex01 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        String str, newStr;
        char lastChar;

        // Get String
        System.out.print("Insira uma String >");
        str = sc.nextLine();

        // Lower Case String
        newStr = str.toLowerCase();
        System.out.println("Lower case > " + newStr);

        // Last Charachter
        lastChar = str.charAt(str.length() -1);
        System.out.println("Ultimo character > " + lastChar);


        // Last 3 Characthers
        newStr = "";

        for(int i = 0; i < 3; i++) {
            newStr += str.charAt(str.length() - 3 + i);
        }

        System.out.println("Ultimos 3 characters > " + newStr);


        // String Builder
        StringBuilder sb = new StringBuilder();
        for (int x = 0; x <= 25; x++) {
            sb.append((char)(x + 65));
        }

        System.out.println("Alfabeto > " + sb);

        // Join Strings
        String data = newStr + sb + lastChar;
        System.out.println("Juntar Strings > " + data);

        // Jump by two in Strings
        StringBuilder divide = new StringBuilder();
        for (int y = 0; y <= data.length() - 1; y += 2) {
            divide.append(data.charAt(y));
        }
        System.out.println("Saltar em Strings > " + divide);

        sc.close();
    }
}
