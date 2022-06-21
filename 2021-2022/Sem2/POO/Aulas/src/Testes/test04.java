package Testes;

import java.io.*;
import java.util.*;

public class test04 {
    public static void main(String[] args) {

        ArrayList<Integer> arrNum = new ArrayList<Integer>();

        try {
            Scanner input = new Scanner(new File("numeros.txt"));
            while (input.hasNextLine()) {
                try {
                    arrNum.add(Integer.parseInt(input.nextLine()));
                }
                catch(NumberFormatException e) {
                    continue;
                }
            }

            int sumOfAll = 0;
            int totalNum = 0;

            int valMax = 0;
            int valMin = 0;

            for (int i : arrNum) {
                // Print a todos
                System.out.println(arrNum.get(i));

                sumOfAll += arrNum.get(i);
                totalNum++;

                if (arrNum.get(i) > valMax) {
                    valMax = arrNum.get(i);
                }

                else if (arrNum.get(i) < valMin) {
                    valMin = arrNum.get(i);
                }
            }

            int media = sumOfAll / totalNum;            
            System.out.println("Val médio >" + media);
            System.out.println("Val máximo >" + valMax);
            System.out.println("Val minimo >" + valMin);

            try {
                FileWriter dFile = new FileWriter("números_stat.txt");
                dFile.write("Val médio >" + media);
                dFile.write("Val máximo >" + valMax);
                dFile.write("Val minimo >" + valMin);
                dFile.close();
            }
            catch(IOException e) {
                System.out.println("Erro! Io Exception");
            }

        }
        catch(FileNotFoundException e) {
            System.out.println("Erro! Ficheiro não encontrado");
        } 

    }
}
