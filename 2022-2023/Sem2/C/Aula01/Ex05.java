package Aula01;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.Scanner;

import javax.crypto.CipherInputStream;

import java.io.InputStreamReader;
import java.util.HashMap;


public class Ex05 {
    public static void main(String[] args) {
        
        try {
            Scanner sc = new Scanner(new BufferedReader(new FileReader("bloco1/numbers.txt")));
            HashMap<String, Integer> numberMap = new HashMap<String, Integer>();

            while (sc.hasNextLine()) {
                String line = sc.nextLine();
                String[] lineInfo = line.replaceAll("\\s+","").split("[-\s]");
                numberMap.put(lineInfo[1], Integer.parseInt(lineInfo[0]));
            }

            while (true) {
                BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
            
                System.out.println("           ---Number translator---");
                System.out.println("          Introduza os números que");
                System.out.println("       pretendida traduzir por extenso'");
                System.out.println("   ----------------------------------------\n");

                System.out.print("                 > ");
                String input = reader.readLine();
                System.out.println("");
                String[] inpVals = input.split("[ \n-]");
                int finalValue = 0;
                int tempValue = 1;
                int lastValue = 0;
                int currValue;


                for (String inputWord : inpVals) {
                    try {
                        currValue = numberMap.get(inputWord);
                        if (currValue < lastValue) {
                            finalValue += tempValue;
                            tempValue = 1;
                        }
                        tempValue *= currValue;
                        lastValue = currValue;
                    }
                    catch (Exception e) {
                        continue; //  If you are here it's probably because you inserted the word AND (Ex: two thousand AND three)
                    }
                }

                finalValue += tempValue;

                System.out.println("Resultado >>> " + finalValue + "\n\n");
                    
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            System.out.println("Occoreu um erro na inicialização do programa! Saindo...");
            System.exit(1);
        }
    }
}