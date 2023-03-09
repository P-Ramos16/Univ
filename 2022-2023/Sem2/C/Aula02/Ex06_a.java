package Aula02;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.Scanner;

import javax.crypto.CipherInputStream;
import javax.rmi.ssl.SslRMIClientSocketFactory;

import java.io.InputStreamReader;
import java.util.HashMap;


public class Ex06_a {
    public static void main(String[] args) {

        
        try {
            if (args.length < 2) {
                throw new Exception("Faltam argumentos de entrada! Utilize \'java Ex06.java dic1.txt word1.txt\'");
            }
            
            HashMap<String, String> translationMap = fillTable("bloco1/dic1.txt");

            while (true) {
                BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
            
                System.out.println("           ---Word translator---");
                System.out.println("          Introduza uma frase que");
                System.out.println("       pretendida traduzir para inglês");
                System.out.println("   ----------------------------------------\n");

                System.out.print("                 > ");
                String input = reader.readLine();
                System.out.println("");
                String[] inpVals = input.split("[ \n-]");

                String tempTranslation;

                StringBuilder sb = new StringBuilder();


                for (String inputWord : inpVals) {
                    try {

                        if (translationMap.containsKey(inputWord)) {
                            tempTranslation = translationMap.get(inputWord);
                            sb.append(tempTranslation);
                        }
                        else {
                            sb.append(inputWord);
                        }
                        sb.append(" ");
                    }
                    catch (Exception e) {
                        System.out.println("Occoreu um problema na tradução!");
                        continue;
                    }
                }

                System.out.println("Resultado >>> " + sb.toString() + "\n\n");
                    
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            System.out.println("Occoreu um erro na inicialização do programa! Saindo...");
            System.exit(1);
        }
    }


    private static HashMap<String, String> fillTable(String filename) throws Exception {

        try {
            Scanner sc = new Scanner(new BufferedReader(new FileReader(filename)));
            HashMap<String, String> finalMap = new HashMap<String, String>();
    
            while (sc.hasNextLine()) {
                String line = sc.nextLine();
                String[] lineInfo = line.split("[\s]");
                finalMap.put(lineInfo[0], lineInfo[1]);
            }

            return finalMap;
        }
        catch (Exception e) {
            throw new Exception("Erro na criação do hash map!");
        }

    }
}