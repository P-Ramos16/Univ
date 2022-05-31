package Aula11;

import java.util.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.io.*;

public class Ex02 {

    public static void main(String[] args) {

        int valueThere, i;
        String word, nextWord, nextNextWord;
        Scanner sc = new Scanner(System.in);

        ArrayList<ArrayList<String>> arrayVoos = new ArrayList<ArrayList<String>>();
        ArrayList<ArrayList<String>> arrayComp = new ArrayList<ArrayList<String>>();
        ArrayList<ArrayList<String>> arrayFinal = new ArrayList<ArrayList<String>>();

        System.out.println("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓");
        System.out.println("┃                             ┃");
        System.out.println("┃            TP_02            ┃");
        System.out.println("┃                             ┃");
        System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫");
        System.out.println("┃                             ┃");
        System.out.println("┃    Resultado do programa:   ┃");
        System.out.println("┃                             ┃");
        System.out.println("┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");
        System.out.println("");

        Path fileName0 = Path.of("/home/frostywolf/Documents/Univ/2021-2022/Sem2/POO/Aulas/src/Aula11/voos.txt");
        Path fileName1 = Path.of("/home/frostywolf/Documents/Univ/2021-2022/Sem2/POO/Aulas/src/Aula11/companhias.txt");

        try {
            // Scanner input = new Scanner(new FileReader("/home/frostywolf/Documents/Univ/2021-2022/Sem2/POO/Aulas/src/Aula11/words.txt"));

            String inputVoos = Files.readString(fileName0);
            String inputComp = Files.readString(fileName1);

            i = 0;
            
            for (String line : inputVoos.split("\n")){
                String[] words = line.split("\t");

                if (i == 0) { 
                    i++;
                    continue; 
                }

                ArrayList<String> arrayTemp = new ArrayList<String>();

                arrayTemp.add(words[0]);//Hora
                arrayTemp.add(words[1]);//Voo
                arrayTemp.add(words[2]);//Origem

                try  {
                    arrayTemp.add(words[3]);
                }
                catch(java.lang.ArrayIndexOutOfBoundsException e) {
                    arrayTemp.add("0");
                }
                

                arrayVoos.add(arrayTemp);
                
                i++;
            }

            i = 0;
            for (String line : inputComp.split("\n")){
                String[] words = line.split("\t");

                if (i == 0) { 
                    i++;
                    continue; 
                }
                
                ArrayList<String> arrayTemp = new ArrayList<String>();

                arrayTemp.add(words[0]);//Sigla
                arrayTemp.add(words[1]);//Companhia

                arrayComp.add(arrayTemp);
                
                i++;
            }
    
            i = 0;

            while (i < arrayComp.size()) {
                
                ArrayList<String> arrayTemp = new ArrayList<String>();

                arrayTemp.add(arrayVoos.get(i).get(0));
                arrayTemp.add(arrayVoos.get(i).get(1));
                arrayTemp.add(arrayComp.get(i).get(1));
                arrayTemp.add(arrayVoos.get(i).get(2));
                arrayTemp.add(arrayVoos.get(i).get(3));
             
                SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
                timeFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
                
                try {
                    Date date1 = timeFormat.parse(arrayVoos.get(i).get(0));
                    Date date2 = timeFormat.parse(arrayVoos.get(i).get(3));
                    long sum = date1.getTime() + date2.getTime();
                
                    String obs = timeFormat.format(new Date(sum));
    
                    
                    arrayTemp.add(obs);
    
                }
                catch(ParseException e) {
                    arrayTemp.add("");
                }


                arrayFinal.add(arrayTemp);
                i++;
            }


            System.out.println("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓");
            System.out.println("┃                             ┃");
            System.out.println("┃          Valores:           ┃");
            System.out.println("┃                             ┃");
            System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫");

            for (ArrayList<String> lineFinal : arrayFinal) {

                // TODO:    nomes das companhias = signa || observaçoes

                System.out.printf("┃  %8s ┃ %8s ┃ %24s ┃ %24s ┃ %8s ┃ Obs: %8s ┃\n", lineFinal.get(0), lineFinal.get(1), lineFinal.get(2), lineFinal.get(3), lineFinal.get(4), lineFinal.get(5));

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

