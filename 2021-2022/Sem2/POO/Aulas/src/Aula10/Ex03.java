package Aula10;

import java.util.Scanner;
import java.util.TreeMap;
import java.util.ArrayList;
import java.util.Map;

public class Ex03 {
    public static void main(String[] args) {

        TreeMap<Character, ArrayList<Integer>> phraseMap = new TreeMap<Character, ArrayList<Integer>>();
        Scanner sc = new Scanner(System.in);
        
        System.out.println("┏━━━━━━━━━━━━━━━━┓");
        System.out.println("┃     Ex_01      ┃");
        System.out.println("┣━━━━━━━━━━━━━━━━┫");
        System.out.println("┃                ┃");
        System.out.println("┃   Insira uma   ┃");
        System.out.println("┃     frase      ┃");
        System.out.println("┃                ┃");
        System.out.println("┗━━━━━━━━━━━━━━━━┛");
        System.out.print("       >");
        String phraseIn = sc.nextLine();
        System.out.println("");

        for (int i = 0; i < phraseIn.length(); i++) {
            char keyChar = phraseIn.charAt(i);

            if (!phraseMap.containsKey(keyChar)) {
                phraseMap.put(keyChar, new ArrayList<Integer>());
            }
            
            phraseMap.get(keyChar).add(i);

        }


        System.out.println("┏━━━━━━━━━━━━━━━━┓");
        System.out.println("┃     Chars      ┃");
        System.out.println("┣━━━━━━━━━━━━━━━━┫");
        for (Map.Entry<Character, ArrayList<Integer>> entry : phraseMap.entrySet()) {
            Character termoIt = entry.getKey();
            ArrayList<Integer> defIt = entry.getValue();
            System.out.println("┃                ┃");
            System.out.printf("┃ Char: %-8s ┃\n", termoIt);
            System.out.print("┃  - ");   
            for (Integer search : defIt) {
                System.out.printf("%s; ", search);
            }
            System.out.println("");    
        }
        System.out.println("┃                ┃");
        System.out.println("┃                ┃");
        System.out.println("┃                ┃");
        System.out.println("┗━━━━━━━━━━━━━━━━┛");

        sc.close();
    }
}
