package Aula04;

import java.util.Scanner;
import java.util.*;

public class Ex02 {

    public static int countLen(String str) {
        int size = str.length();
        return size;
    }

    public static int countSpaces(String str) {
        int num = 0;
        for (int i = 0; i < str.length(); i ++) {
            if (str.charAt(i) == ' ') {
                num ++;
            }
        }
        return num;
    }

    public static boolean allLower(String str) {

        char[] charArray = str.toCharArray();

        for (int i = 0; i < str.length(); i ++) {
            if (!Character.isLowerCase(charArray[i])) {
                return false;
            }
        }
        return true;
    }

    public static String removeSpaces(String str) {

        char[] charArray = str.toCharArray();

        StringBuilder newStr = new StringBuilder();

        newStr.append(charArray[0]);

        for (int i = 1; i < str.length(); i ++) {
            if (!(charArray[i - 1] == ' ' && charArray[i] == ' ' )) {
                newStr.append(charArray[i]);
            }
        }
        return newStr.toString();
    }


    public static boolean palindrome(String str) {

        char[] charArray = str.toCharArray();

        for (int i = 0; i < str.length() / 2; i++){
            if (charArray[i] != charArray[str.length() - i - 1]) {
                return false;
            }
        }
       
        return true;
    }


    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        String frase;

        System.out.print("Insira uma frase > ");
        frase = sc.nextLine();

        System.out.println("Tamanho da frase > " + countLen(frase));
        System.out.println("Numero de espaços > " + countSpaces(frase));
        System.out.println("É lowerCase? > " + (allLower(frase) ? "Sim" : "Não"));
        System.out.println("String reduzida > " + removeSpaces(frase));
        System.out.println("É palindromo? > " + (palindrome(frase) ? "Sim" : "Não"));

        sc.close();

    }
    
}
