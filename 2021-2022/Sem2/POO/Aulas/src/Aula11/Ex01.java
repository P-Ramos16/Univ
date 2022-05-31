package Aula11;

import java.util.Arrays;
import java.util.ArrayList;
import java.util.Map;
import java.util.TreeMap;
import java.util.HashSet;
import java.util.Set;
import java.util.Scanner;
import java.io.FileReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.io.*;

public class Ex01 {

    public static void main(String[] args) {

        int valueThere;
        String word, nextWord, nextNextWord;
        Scanner sc = new Scanner(System.in);

        ArrayList<String> wordsArray = new ArrayList<String>();
        Set<String> dividersSet = new HashSet<String>(Arrays.asList(" ", "\t", "\n", ".", ",", ":", "'", "‘", "’", ";", "?", "!", "-", "*", "{", "}", "=", "+", "&", "/", "(", ")", "[", "]", "”", "“", "\"", "\'"));
        TreeMap<String, TreeMap<String, Integer>> finalArray = new TreeMap<String, TreeMap<String, Integer>>();

        System.out.println("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓");
        System.out.println("┃                             ┃");
        System.out.println("┃            TP_01            ┃");
        System.out.println("┃                             ┃");
        System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫");
        System.out.println("┃                             ┃");
        System.out.println("┃    Resultado do programa:   ┃");
        System.out.println("┃                             ┃");
        System.out.println("┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
        System.out.println("");

        Path fileName = Path.of("/home/frostywolf/Documents/Univ/2021-2022/Sem2/POO/Aulas/src/Aula11/words.txt");

        try {
            // Scanner input = new Scanner(new FileReader("/home/frostywolf/Documents/Univ/2021-2022/Sem2/POO/Aulas/src/Aula11/words.txt"));

            String input = Files.readString(fileName);

            
            for (String n : input.split("[ \n]")){
                word = n;


                if (word.length() > 0 && dividersSet.contains(Character.toString(word.charAt(word.length()-1)))) {
                    wordsArray.add(word);
                }
                else if (word.length() > 2) {
                    wordsArray.add(word + " ");
                }
            }
    
            System.out.println(wordsArray);

            for (int i = 0; i < wordsArray.size() - 1; i++) {
                word = wordsArray.get(i);
                nextWord = wordsArray.get(i + 1);

    
                if (dividersSet.contains(Character.toString(word.charAt(word.length()-1)))) {
                    word = word.substring(0, word.length()-1);
                    nextWord = nextWord.substring(0, nextWord.length()-1);

                    if (!finalArray.containsKey(word)) {
                        finalArray.put(word, new TreeMap<String, Integer>());
                        finalArray.get(word).put(nextWord, 1);
                    }

                    else if (finalArray.containsKey(word)) {

                        if (finalArray.get(word).containsKey(nextWord)) {
                            valueThere = Integer.valueOf(finalArray.get(word).get(nextWord));
                            finalArray.get(word).put(nextWord, ++valueThere);
                        }

                        else {
                            finalArray.get(word).put(nextWord, 1);
                        }
                    }
                    
                }
            }



            System.out.println("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓");
            System.out.println("┃                             ┃");
            System.out.println("┃          Valores:           ┃");
            System.out.println("┃                             ┃");
            System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫");

            for (Map.Entry<String, TreeMap<String, Integer>> bigEntry : finalArray.entrySet()) {

                String bigKey = bigEntry.getKey();
                TreeMap<String, Integer> bigValues = bigEntry.getValue();


                System.out.println("┃   " + bigKey + " >");


                for (Map.Entry<String, Integer> smallEntry : bigValues.entrySet()) {

                    String smallKey = smallEntry.getKey();
                    Integer smallValues = smallEntry.getValue();
                    System.out.println("┃      -" + smallKey + " = " + smallValues);
                }
                //System.out.println("┃                             ┃");
            }

            System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫");
            System.out.println("┃          Exiting...         ┃");
            System.out.println("┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
            sc.close();
            System.exit(0);

        }
        catch (IOException e) {
            System.out.println("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓");
            System.out.println("┃                             ┃");
            System.out.println("┃           ERRO!!            ┃");
            System.out.println("┃    ficheiro não existente   ┃");
            System.out.println("┃                             ┃");
            System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫");
            System.out.println("┃          Exiting...         ┃");
            System.out.println("┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
            sc.close();
            System.exit(0);
        }
        
    

     
    }

}
