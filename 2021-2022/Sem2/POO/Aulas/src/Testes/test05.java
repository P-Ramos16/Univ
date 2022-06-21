package Testes;

import java.util.*;

public class test05 {
    public static void main(String[] args) {
        List<Double> lst = new ArrayList<Double>();

        // gera numeros de 0-100
        Random rand = new Random();
        double upperbound = 100;

        for (int i = 0; i < 100; i++) {
            double doubleRandom=rand.nextDouble(upperbound);
            lst.add(doubleRandom);
        }

        Collections.sort(lst);


        lst.forEach(System.out::println);

        String[] vec = new String[] { "once", "upon", "a", "time", "in", "Aveiro" };
        // Acrescente aqui o código que permita ordenar o vetor vec

        for(int i = 0; i < vec.length - 1; i++) {

            for (int j = i + 1; j < vec.length; j++) {

                if(vec[i].compareTo(vec[j]) > 0) {
                    String temp = vec[i];
                    vec[i] = vec[j];
                    vec[j] = temp;
                }

            }

        }
            
        for (String s : vec) System.out.print(s);

    }    
}
