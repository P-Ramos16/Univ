package Aula12;

import java.util.*;
import java.io.*;
import java.nio.*;

public class Ex02_c {
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

        TreeMap<String, ArrayList<String>> movieMap = new TreeMap<String, ArrayList<String>>();

        ArrayList<Movie> moviesArray = new ArrayList<Movie>();

        try {
            Scanner inFile = new Scanner(new File("src/Aula12/movies.txt"));

            if(inFile.hasNextLine()) { // Skip First Line
                inFile.nextLine();
            }

            while (inFile.hasNextLine()) {
                String[] words = inFile.nextLine().split("[\t]");
                                
                ArrayList<String> tempArray = new ArrayList<String>();
                tempArray.add(words[1]);    // Add Score
                tempArray.add(words[2]);    // Add Rating
                tempArray.add(words[3]);    // Add Genre
                tempArray.add(words[4]);    // Add Running Time

                movieMap.put(words[0], tempArray);    // Associate the movies info with it's name       
            }

            for (Map.Entry<String, ArrayList<String>> entry : movieMap.entrySet()) {
                String keyX = entry.getKey();
                ArrayList<String> arrayX = entry.getValue();

                Movie tempM = new Movie(keyX, Double.parseDouble(arrayX.get(0)), arrayX.get(1), arrayX.get(2), Integer.parseInt(arrayX.get(3)));
                
                moviesArray.add(tempM);
            }

            // Print by score
            
            System.out.println("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓");
            System.out.println("┃                             ┃");
            System.out.println("┃           Valores           ┃");
            System.out.println("┃                             ┃");
            System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓");
            System.out.println("┃                                  Sorted by score                                  ┃");
            System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━┫");
            System.out.println("┃            Nome             ┃   Score  ┃  Rating  ┃     Genre     ┃ Running Time  ┃");
            System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━╋━━━━━━━━━━╋━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━┫");
            
            Collections.sort(moviesArray,new SorterScore());
            Collections.reverse(moviesArray);

            for (Movie movie : moviesArray) {
                System.out.println(movie.toString());
            }

            System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━┻━━━━━━━━━━┻━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━┛");
            System.out.println("┃          Exiting...         ┃");
            System.out.println("┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");

            // Print by runningTime

            System.out.println("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓");
            System.out.println("┃                             ┃");
            System.out.println("┃           Valores           ┃");
            System.out.println("┃                             ┃");
            System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓");
            System.out.println("┃                               Sorted by runningTime                               ┃");
            System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━┫");
            System.out.println("┃            Nome             ┃   Score  ┃  Rating  ┃     Genre     ┃ Running Time  ┃");
            System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━╋━━━━━━━━━━╋━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━┫");
            
            Collections.sort(moviesArray,new SorterRTime());
            Collections.reverse(moviesArray);

            for (Movie movie : moviesArray) {
                System.out.println(movie.toString());
            }

            System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━┻━━━━━━━━━━┻━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━┛");
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
