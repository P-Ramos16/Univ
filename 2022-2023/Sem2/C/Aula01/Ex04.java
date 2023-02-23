package Aula01;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.Scanner;
import java.io.InputStreamReader;
import java.util.HashMap;


public class Ex04 {
    public static void main(String[] args) {
        
        while (true) {
            try {
            
                System.out.println("           ---Number translator---");
                System.out.println("          Introduza os números que");
                System.out.println("       pretendida traduzir por extenso'");
                System.out.println("   ----------------------------------------\n");


                Scanner sc = new Scanner(new BufferedReader(new FileReader("bloco1/numbers.txt")));
                HashMap<String, Integer> numberMap = new HashMap<String, Integer>();

                while (sc.hasNextLine()) {
                    String line = sc.nextLine();
                    String[] lineInfo = line.replaceAll("\\s+","").split("[-\s]");
                    numberMap.put(lineInfo[1], Integer.parseInt(lineInfo[0]));
                }


                BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

                System.out.print("                 > ");
                String input = reader.readLine();
                System.out.println("");
                String[] inpVals = input.split("[ \n-]");

                StringBuilder outputString = new StringBuilder();

                outputString.append("Resultado >>> ");

                for (String inputWord : inpVals) {
                    if (numberMap.get(inputWord) != null) {
                        outputString.append(numberMap.get(inputWord) + " ");
                    }
                    else {
                        outputString.append(inputWord + " ");
                    }
                }

                System.out.println(outputString.toString() + "\n\n");


                
            }
            catch(Exception e) {
                e.printStackTrace();
                System.out.println("Occoreu um erro na execução do programa! Saindo...");
                System.exit(1);
            }
        }
    }
}