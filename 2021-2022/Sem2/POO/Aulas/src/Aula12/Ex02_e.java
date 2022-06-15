package Aula12;

import java.util.*;
import java.io.*;
import java.nio.*;

public class Ex02_e {
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

        ArrayList<Movie> moviesArray = new ArrayList<Movie>();

        try {
            Scanner inFile = new Scanner(new File("Aula12/movies.txt"));

            if(inFile.hasNextLine()) { // Skip First Line
                inFile.nextLine();
            }


            while (inFile.hasNextLine()) {
                String[] words = inFile.nextLine().split("[\t]");
                
                if (words[3].equals("comedy") && Double.parseDouble(words[1]) >= 60) {
                    Movie tempM = new Movie(words[0], Double.parseDouble(words[1]), words[2], words[3], Integer.parseInt(words[4]));
                    moviesArray.add(tempM);   
                }
            }

            // Print by score
            
            System.out.println("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓");
            System.out.println("┃                             ┃");
            System.out.println("┃           Valores           ┃");
            System.out.println("┃                             ┃");
            System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓");
            System.out.println("┃              Sorted by score, Genre is and comedy and Score is above 60           ┃");
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

            try {
                FileWriter printFile = new FileWriter("src/Aula12/myselection.txt");
                
                printFile.write("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓\n");
                printFile.write("┃              Sorted by score, Genre is and comedy and Score is above 60           ┃\n");
                printFile.write("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━┳━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━┫\n");
                printFile.write("┃            Nome             ┃   Score  ┃  Rating  ┃     Genre     ┃ Running Time  ┃\n");
                printFile.write("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╋━━━━━━━━━━╋━━━━━━━━━━╋━━━━━━━━━━━━━━━╋━━━━━━━━━━━━━━━┫\n");
                
                Collections.sort(moviesArray,new SorterScore());
                Collections.reverse(moviesArray);

                for (Movie movie : moviesArray) {
                    printFile.write(movie.toString() + "\n");
                }

                printFile.write("┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━┻━━━━━━━━━━┻━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━┛\n");
                printFile.close();
            }
            catch (Exception e) {
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
