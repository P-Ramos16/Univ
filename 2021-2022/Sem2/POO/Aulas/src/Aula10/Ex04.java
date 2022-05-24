package Aula10;

import java.util.Scanner;
import java.io.FileReader;

import java.util.*;
import java.io.*;

public class Ex04 {
    public static void main(String[] args) {

        ArrayList<String> wordsArray = new ArrayList<String>();
        ArrayList<String> wordsSArray = new ArrayList<String>();
        ArrayList<String> wordsCleanArray = new ArrayList<String>();



        System.out.println("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓");
        System.out.println("┃                             ┃");
        System.out.println("┃            Ex_04            ┃");
        System.out.println("┃                             ┃");
        System.out.println("┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");

        try {
            Scanner input = new Scanner(new FileReader("/home/frostywolf/Documents/Univ/2021-2022/Sem2/POO/Aulas/src/Aula10/words.txt"));

            while (input.hasNext()) {
                String word = input.next();

                if (word.length() > 2 && !wordsArray.contains(word)) {
                    wordsArray.add(word);
                }

            }

            for (String word : wordsArray) {
                if (word.charAt(word.length()-1) == 's') {
                    wordsSArray.add(word);
                }
            }

            for (String word : wordsArray) {
                if (isAlpha(word)) {
                    wordsCleanArray.add(word);
                }
            }

            printArr(wordsArray, "Array de todos");
            printArr(wordsSArray, "Array acabado em  S");
            printArr(wordsCleanArray, "Array de alfanuméricos");

            System.out.println("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓");
            System.out.println("┃          Exiting...         ┃");
            System.out.println("┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
        } 
        catch (IOException e) {
            
            System.out.println("Não existe esse ficheiro!");

            System.out.println("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓");
            System.out.println("┃          Exiting...         ┃");
            System.out.println("┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
        }

    }

    public static boolean isAlpha(String name) {
        char[] chars = name.toCharArray();
    
        for (char c : chars) {
            if(!Character.isLetter(c)) {
                return false;
            }
        }
    
        return true;
    }

    public static void printArr(ArrayList<String> arrayPrint, String nome) {

        System.out.println("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓");
        System.out.printf("┃    %-24s ┃\n", nome);
        System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫");
        System.out.println("┃                             ┃");

        for (String word : arrayPrint) {

            System.out.printf("┃  -%-24s  ┃\n", word);
        }

        System.out.println("┃                             ┃");
        System.out.println("┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");

    }
}
