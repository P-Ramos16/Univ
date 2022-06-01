package Aula11;

import java.util.*;
import java.io.*;
import java.nio.file.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
public class Ex02_Optimized {

    public static void main(String[] args) {

        int i;
        Scanner sc = new Scanner(System.in);

        ArrayList<ArrayList<String>> arrayVoos = new ArrayList<ArrayList<String>>();
        TreeMap<String, String> mapComp = new TreeMap<String, String>();
        ArrayList<ArrayList<String>> arrayFinal = new ArrayList<ArrayList<String>>();
        TreeMap<String, ArrayList<String>> mapDelays = new TreeMap<String, ArrayList<String>>();
        TreeMap<String, Integer> arrayNumFligths = new TreeMap<String, Integer>();

        //  Janela Inicial
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

        //  Ficheiros
        Path fileName0 = Path.of("src/Aula11/voos.txt");
        Path fileName1 = Path.of("src/Aula11/companhias.txt");

        try {
            String inputVoos = Files.readString(fileName0);
            String inputComp = Files.readString(fileName1);

            i = 0;
            //  Separar as linhas do ficheiro dos Voos e organizar os valores num Array de Arrays com os valores de cada linha agrupados
            for (String line : inputVoos.split("\n")){
                String[] words = line.split("\t");

                // Passar a primeira linha
                if (i == 0) { 
                    i++;
                    continue; 
                }

                //  ArrayList Temporária que guarda os valores agrupados de uma só linha
                ArrayList<String> arrayTemp = new ArrayList<String>();

                arrayTemp.add(words[0]);//Hora
                arrayTemp.add(words[1]);//Voo
                arrayTemp.add(words[2]);//Origem

                //  Como a linha dos atrasos pode não existir
                try  {
                    arrayTemp.add(words[3]);
                }
                catch(java.lang.ArrayIndexOutOfBoundsException e) {
                    arrayTemp.add("");
                }
                
                //  Colocar a linha temporária no Array de Voos
                arrayVoos.add(arrayTemp);
                i++;
            }

            i = 0;
            //  Separar as linhas do ficheiro das Companhias e organizar os valores num Array de Arrays com os valores de cada linha agrupados
            for (String line : inputComp.split("\n")){
                String[] words = line.split("\t");

                // Passar a primeira linha
                if (i == 0) { 
                    i++;
                    continue; 
                }
                
                // TreeMap das Companhias, sendo as keys as siglas e os valores os nomes da empresa
                mapComp.put(words[0], words[1]);               

                i++;
            }

            i = 0;
            //  Processar ambos os arrays de Voos e Companhias e colocar cada linha processada num Array Final
            while (i < arrayVoos.size()) {
                
                //  ArrayList Temporária que guarda os valores agrupados de uma só linha
                ArrayList<String> arrayTemp = new ArrayList<String>();

                arrayTemp.add(arrayVoos.get(i).get(0)); //Horas
                arrayTemp.add(arrayVoos.get(i).get(1)); //Voo
                
                //  Procurar a sigla que está no array de Voo com as do array de Companhias e retirar o nome da Companhia
                String sigla = arrayVoos.get(i).get(1).substring(0, 2);
                
                if (mapComp.containsKey(sigla)) {
                    arrayTemp.add(mapComp.get(sigla));
                }
                else {
                    arrayTemp.add("?");
                }
                
                arrayTemp.add(arrayVoos.get(i).get(2)); // Origem
                arrayTemp.add(arrayVoos.get(i).get(3)); // Atraso
             
                //  Somar datas
                SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
                timeFormat.setTimeZone(TimeZone.getTimeZone("UTC"));                
                try {
                    Date date1 = timeFormat.parse(arrayVoos.get(i).get(0)); // Hora 
                    Date date2 = timeFormat.parse(arrayVoos.get(i).get(3)); // Atraso
                    long sum = date1.getTime() + date2.getTime();           // Hora + Atraso
                    String obs = timeFormat.format(new Date(sum));
                    arrayTemp.add("Previsto: " + obs);
                }
                catch(ParseException e) {
                    arrayTemp.add("");  // Se não existir atraso, o valor é ""
                }

                //  Colocar a linha temporária no Array Final
                arrayFinal.add(arrayTemp);
                i++;
            }


            System.out.println("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓");
            System.out.println("┃                                                                                                            ┃");
            System.out.println("┃                                               Valores:                                                     ┃");
            System.out.println("┃                                                                                                            ┃");
            System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫");

            System.out.printf("┃  %-8s ┃ %-8s ┃ %24s ┃ %24s ┃ %8s ┃ %-12s       ┃\n", "Hora", "Voo", "Companhia", "Origem", "Atraso", "Observações:");
            System.out.printf("┃━━━━━━━━━━━┃━━━━━━━━━━┃━━━━━━━━━━━━━━━━━━━━━━━━━━┃━━━━━━━━━━━━━━━━━━━━━━━━━━┃━━━━━━━━━━┃━━━━━━━━━━━━━━━━━━━━┃\n");

            // Prints dos valores
            for (ArrayList<String> lineFinal : arrayFinal) {
                System.out.printf("┃  %-8s ┃ %-8s ┃ %24s ┃ %24s ┃ %8s ┃ %-18s ┃\n", lineFinal.get(0), lineFinal.get(1), lineFinal.get(2), lineFinal.get(3), lineFinal.get(4), lineFinal.get(5));
            }

            // Atrasos médios
            System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫");
            System.out.println("┃                                                                                                            ┃");
            System.out.println("┃                                            Atrasos médios:                                                 ┃");
            System.out.println("┃                                                                                                            ┃");
            System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫");
            System.out.printf("┃  %75s ┃ %-24s    ┃\n", "Companhia", "Atráso médio");
            // Colocar todos os coos com atrasos num TreeMap, sendo as keys as companhias e os values uma array dos atrasos
            for (ArrayList<String> lineFinal : arrayFinal) {

                if (lineFinal.get(4) != "") {
                    if (!mapDelays.containsKey(lineFinal.get(2))) {
                        mapDelays.put(lineFinal.get(2), new ArrayList<String>());                   
                    }
                    mapDelays.get(lineFinal.get(2)).add(lineFinal.get(4));
                }
            }

            // Calcular os atrasos ao iterar cada key e fazer a média dos seus valores (usando Date)
            for (Map.Entry<String, ArrayList<String>> entry : mapDelays.entrySet()) {

                String key = entry.getKey();
                ArrayList<String> values = entry.getValue();

                    
                //  Somar datas
                SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
                timeFormat.setTimeZone(TimeZone.getTimeZone("UTC"));            
                try {
                    Date date = timeFormat.parse("00:00"); // Hora 
                    long sum = date.getTime();           // Hora + Atraso  

                    for (String x : values) {
                        date = timeFormat.parse(x); // Hora 
                        sum += date.getTime();           // Hora + Atraso
                    }

                    sum = sum / values.size();
                    String obs = timeFormat.format(new Date(sum));

                    System.out.printf("┃   %74s ┃  %-23s    ┃\n", key, obs);
                    
                }
                catch(ParseException e) {
                    System.out.println("ERRO!");
                }

            }



            // Guardar num ficheiro
            File destinationFile = new File("src/Aula11/Infopublico.txt");
            if (destinationFile.createNewFile()) {
                System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫");
                System.out.printf("┃                                         File Created: %-37s                ┃\n", destinationFile.getName());
                System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫");
            } 
            else {
                System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫");
                System.out.println("┃                                     File already exists! Overridding                                       ┃");
                System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫");
            }
            FileWriter destinationFileWriter = new FileWriter("src/Aula11/Infopublico.txt");
            destinationFileWriter.write("Hora   Voo   Companhia   Origem   Atraso   Observações:\n");
            for (ArrayList<String> lineFinal : arrayFinal) {
                destinationFileWriter.write(lineFinal.get(0) + "  " + lineFinal.get(1) + "  " + lineFinal.get(2) + "  " + lineFinal.get(3) + "  " + lineFinal.get(4) + "  " + lineFinal.get(5) + "\n");
            }
            destinationFileWriter.close();



            // Número de voos de cada cidade
            FileWriter destinationFileWriter0 = new FileWriter("src/Aula11/cidades.txt");
            destinationFileWriter0.write("Origem   Voos:\n");

            for (ArrayList<String> lineFinal : arrayFinal) {

                if (!arrayNumFligths.containsKey(lineFinal.get(3))) {
                    arrayNumFligths.put(lineFinal.get(3), 0);
                }

                int numFligths = arrayNumFligths.get(lineFinal.get(3));
                arrayNumFligths.put(lineFinal.get(3), ++numFligths);
            }
            for (Map.Entry<String, Integer> entry : arrayNumFligths.entrySet()) {
                destinationFileWriter0.write(entry.getKey() + "  " + String.valueOf(entry.getValue()) + "\n");
            }
            destinationFileWriter0.close();

            System.out.println("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫");
            System.out.println("┃                                               Exiting...                                                   ┃");
            System.out.println("┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛");

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