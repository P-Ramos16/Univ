package Aula10;

import java.util.Map;
import java.util.TreeMap;
import java.util.Scanner;

public class Ex01 {
    
    public static void main(String[] args) {

        TreeMap<String, String> wordMap = new TreeMap<String, String>();
        Scanner sc = new Scanner(System.in);
        String termo, def, gettermo, getdef;


        wordMap.put("branco", "Que tem a cor da neve.");
        wordMap.put("azul", "Que tem a cor do mar.");
        wordMap.put("verde", "Que tem a cor da relva.");

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

                    wordMap.put(termo, def);

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

                    getdef = wordMap.get(gettermo);
                    System.out.println("┏━━━━━━━━━━━━━━━━┓");
                    System.out.println("┃   Pesquisar    ┃");
                    System.out.println("┣━━━━━━━━━━━━━━━━┫");
                    System.out.printf("┃ %-10s ┃\n", gettermo);
                    System.out.printf("┃ %-10s ┃\n", getdef);
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
                    for (Map.Entry<String, String> entry : wordMap.entrySet()) {
                        String termoIt = entry.getKey();
                        String defIt = entry.getValue();

                        System.out.println("┃                ┃");
                        System.out.printf("┃ %-14s ┃\n", termoIt);
                        System.out.printf("┃  -%-10s \n", defIt);
                    }

                    System.out.println("┃                ┃");
                    System.out.println("┣━━━━━━━━━━━━━━━━┫");
                    System.out.println("┃     Termos     ┃");
                    System.out.println("┣━━━━━━━━━━━━━━━━┫");
                    
                    for (Map.Entry<String, String> entry : wordMap.entrySet()) {
                        String termoIt = entry.getKey();

                        System.out.println("┃                ┃");
                        System.out.printf("┃ %-14s ┃\n", termoIt);
                    }

                    System.out.println("┃                ┃");
                    System.out.println("┣━━━━━━━━━━━━━━━━┫");
                    System.out.println("┃  Significados  ┃");
                    System.out.println("┣━━━━━━━━━━━━━━━━┫");
                    
                    for (Map.Entry<String, String> entry : wordMap.entrySet()) {
                        String defIt = entry.getValue();

                        System.out.println("┃                ┃");
                        System.out.printf("┃  -%-10s \n", defIt);
                    }

                    System.out.println("┃                ┃");
                    System.out.println("┗━━━━━━━━━━━━━━━━┛");
                    break;
            }

        }
    }
}
