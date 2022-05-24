package Aula10;

import java.util.ArrayList;
import java.util.Map;
import java.util.TreeMap;
import java.util.Scanner;

public class Ex02 {
    
    public static void main(String[] args) {

        TreeMap<String, ArrayList<String>> wordMap = new TreeMap<String, ArrayList<String>>();
        Scanner sc = new Scanner(System.in);
        String termo, def, gettermo, getdef;

        wordMap.put("branco", new ArrayList<String>());
        wordMap.put("azul", new ArrayList<String>());
        wordMap.put("verde", new ArrayList<String>());

        wordMap.get("branco").add("Que tem a cor da neve.");
        wordMap.get("azul").add("Que tem a cor do mar.");
        wordMap.get("verde").add("Que tem a cor da relva.");

        while (true) {
            System.out.println("┏━━━━━━━━━━━━━━━━┓");
            System.out.println("┃     Ex_01      ┃");
            System.out.println("┣━━━━━━━━━━━━━━━━┫");
            System.out.println("┃                ┃");
            System.out.println("┃ Options:       ┃");
            System.out.println("┃   1- Inserir   ┃");
            System.out.println("┃   2- Pesquisar ┃");
            System.out.println("┃   3- Remover   ┃");
            System.out.println("┃   4- toString  ┃");
            System.out.println("┃   5- Randomize ┃");
            System.out.println("┃   0- Sair      ┃");
            System.out.println("┃                ┃");
            System.out.println("┗━━━━━━━━━━━━━━━━┛");
            System.out.print("       >");
            int option = sc.nextInt();
            System.out.println("");

            switch(option) {
                case (0):
                    System.out.println("┏━━━━━━━━━━━━━━━━┓");
                    System.out.println("┃    Exiting...  ┃");
                    System.out.println("┗━━━━━━━━━━━━━━━━┛");
                    sc.close();
                    System.exit(0);
                    break;

                case (1):
                    System.out.println("┏━━━━━━━━━━━━━━━━┓");
                    System.out.println("┃    Inserir     ┃");
                    System.out.println("┣━━━━━━━━━━━━━━━━┫");
                    System.out.println("┃                ┃");
                    System.out.println("┃ Insira o termo ┃");
                    System.out.println("┃                ┃");
                    System.out.println("┗━━━━━━━━━━━━━━━━┛");
                    System.out.print("       >");
                    termo = sc.nextLine();
                    termo = sc.nextLine();
                    System.out.println("");

                    System.out.println("┏━━━━━━━━━━━━━━━━┓");
                    System.out.println("┃    Inserir     ┃");
                    System.out.println("┣━━━━━━━━━━━━━━━━┫");
                    System.out.println("┃                ┃");
                    System.out.println("┃    Insira a    ┃");
                    System.out.println("┃    definição   ┃");
                    System.out.println("┃                ┃");
                    System.out.println("┗━━━━━━━━━━━━━━━━┛");
                    System.out.print("       >");
                    def = sc.nextLine();
                    System.out.println("");

                    if (!wordMap.containsKey(termo)) {
                        wordMap.put(termo, new ArrayList<String>());
                    }
                    wordMap.get(termo).add(def);

                    break;


                case (2):
                    System.out.println("┏━━━━━━━━━━━━━━━━┓");
                    System.out.println("┃   Pesquisar    ┃");
                    System.out.println("┣━━━━━━━━━━━━━━━━┫");
                    System.out.println("┃                ┃");
                    System.out.println("┃ Insira o termo ┃");
                    System.out.println("┃   a procurar   ┃");
                    System.out.println("┃                ┃");
                    System.out.println("┗━━━━━━━━━━━━━━━━┛");
                    System.out.print("       >");
                    gettermo = sc.nextLine();
                    gettermo = sc.nextLine();
                    System.out.println("");

                    System.out.println("┏━━━━━━━━━━━━━━━━┓");
                    System.out.println("┃   Pesquisar    ┃");
                    System.out.println("┣━━━━━━━━━━━━━━━━┫");
                    System.out.printf("┃ %-10s ┃\n", gettermo);
                    for (String search : wordMap.get(gettermo)) {
                        System.out.printf("┃ %-10s ┃\n", search);
                    }
                    System.out.println("┃                ┃");
                    System.out.println("┗━━━━━━━━━━━━━━━━┛");

                    break;



                case (3):
                    System.out.println("┏━━━━━━━━━━━━━━━━┓");
                    System.out.println("┃    Remover     ┃");
                    System.out.println("┣━━━━━━━━━━━━━━━━┫");
                    System.out.println("┃                ┃");
                    System.out.println("┃ Insira o termo ┃");
                    System.out.println("┃   a remover    ┃");
                    System.out.println("┃                ┃");
                    System.out.println("┗━━━━━━━━━━━━━━━━┛");
                    System.out.print("       >");
                    gettermo = sc.nextLine();
                    gettermo = sc.nextLine();
                    System.out.println("");

                    wordMap.remove(gettermo);

                    break;

                
                case (4):
                    System.out.println("┏━━━━━━━━━━━━━━━━┓");
                    System.out.println("┃    toString    ┃");
                    System.out.println("┣━━━━━━━━━━━━━━━━┫");
                    System.out.println("┃    Termos e    ┃");
                    System.out.println("┃  Significados  ┃");
                    System.out.println("┣━━━━━━━━━━━━━━━━┫");
                    for (Map.Entry<String, ArrayList<String>> entry : wordMap.entrySet()) {
                        String termoIt = entry.getKey();
                        ArrayList<String> defIt = entry.getValue();
                        System.out.println("┃                ┃");
                        System.out.printf("┃ %-14s ┃\n", termoIt);
                        for (String search : defIt) {
                            System.out.printf("┃  -%-10s \n", search);
                        }
                    }

                    System.out.println("┃                ┃");
                    System.out.println("┣━━━━━━━━━━━━━━━━┫");
                    System.out.println("┃     Termos     ┃");
                    System.out.println("┣━━━━━━━━━━━━━━━━┫");
                    
                    for (Map.Entry<String, ArrayList<String>> entry : wordMap.entrySet()) {
                        String termoIt = entry.getKey();

                        System.out.println("┃                ┃");
                        System.out.printf("┃ %-14s ┃\n", termoIt);
                    }

                    System.out.println("┃                ┃");
                    System.out.println("┣━━━━━━━━━━━━━━━━┫");
                    System.out.println("┃  Significados  ┃");
                    System.out.println("┣━━━━━━━━━━━━━━━━┫");
                    
                    for (Map.Entry<String, ArrayList<String>> entry : wordMap.entrySet()) {
                        ArrayList<String> defIt = entry.getValue();
                        System.out.println("┃                ┃");
                        for (String search : defIt) {
                            System.out.printf("┃  -%-10s \n", search);
                        }
                    }

                    System.out.println("┃                ┃");
                    System.out.println("┗━━━━━━━━━━━━━━━━┛");
                    break;


                case (5):
                    System.out.println("┏━━━━━━━━━━━━━━━━┓");
                    System.out.println("┃   Randomizer   ┃");
                    System.out.println("┣━━━━━━━━━━━━━━━━┫");
                    System.out.println("┃                ┃");
                    System.out.println("┃ Insira o termo ┃");
                    System.out.println("┃   a procurar   ┃");
                    System.out.println("┃                ┃");
                    System.out.println("┗━━━━━━━━━━━━━━━━┛");
                    System.out.print("       >");
                    gettermo = sc.nextLine();
                    gettermo = sc.nextLine();
                    System.out.println("");

                    getdef = randomValue(wordMap, gettermo);

                    System.out.println("┏━━━━━━━━━━━━━━━━┓");
                    System.out.println("┃   Randomizer   ┃");
                    System.out.println("┣━━━━━━━━━━━━━━━━┫");
                    System.out.println("┃                ┃");
                    System.out.printf("┃ %-14s ┃\n", gettermo);
                    System.out.printf("┃ %-10s \n", getdef);
                    System.out.println("┃                ┃");
                    System.out.println("┗━━━━━━━━━━━━━━━━┛");

                    break;
            }

        }
    }

    public static String randomValue(TreeMap<String, ArrayList<String>> searchMap, String searchStr ) {
        ArrayList<String> searchArray = searchMap.get(searchStr);

		int randomInt = (int) (Math.random() * searchArray.size());

        return searchArray.get(randomInt);
    }
}
