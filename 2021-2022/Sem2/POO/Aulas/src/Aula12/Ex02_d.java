package Aula12;

import java.util.*;
import java.io.*;
import java.nio.*;

public class Ex02_d {
    public static void main(String[] args) {

        //  Janela Inicial
        System.out.println("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓");
        System.out.println("┃                             ┃");
        System.out.println("┃            TP_12            ┃");
        System.out.println("┃                             ┃");
        System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫");
        System.out.println("┃                             ┃");
        System.out.println("┃    Resultado do programa:   ┃");
        System.out.println("┃                             ┃");
        System.out.println("┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
        System.out.println("");

        TreeSet<String> genreSet = new TreeSet<String>();


        try {
            Scanner inFile = new Scanner(new File("src/Aula12/movies.txt"));

            if(inFile.hasNextLine()) { // Skip First Line
                inFile.nextLine();
            }

            while (inFile.hasNextLine()) {
                String[] words = inFile.nextLine().split("[\t]");
                genreSet.add(words[3]);
            }


            // Print by score
            
            System.out.println("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓");
            System.out.println("┃                             ┃");
            System.out.println("┃           Valores           ┃");
            System.out.println("┃                             ┃");
            System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫");
            System.out.println("┃      Todos os géneros       ┃");
            System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫");
            
            for (String genre : genreSet) {
                System.out.printf("┃          %-18s ┃\n", genre);
            }

            System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫");
            System.out.println("┃          Exiting...         ┃");
            System.out.println("┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
            
        }

        catch(FileNotFoundException e) {
            System.out.println("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓");
            System.out.println("┃                             ┃");
            System.out.println("┃           ERRO!!            ┃");
            System.out.println("┃    ficheiro não existente   ┃");
            System.out.println("┃                             ┃");
            System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫");
            System.out.println("┃          Exiting...         ┃");
            System.out.println("┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
            System.exit(0);
        }
    
    
    }
}
