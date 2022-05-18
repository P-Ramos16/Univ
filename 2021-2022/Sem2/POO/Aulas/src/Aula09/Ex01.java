package Aula09;

import java.util.*;
import java.util.ArrayList;
import java.util.Collections;

public class Ex01 {
    public static void main(String[] args) {

        ArrayList<Integer> c1 = new ArrayList<>();

        for (int i = 10; i <= 100; i+=10) {
            c1.add(i);
        }
        
        System.out.println("Size: " + c1.size());

        for (int i = 0; i < c1.size(); i++) {
            System.out.println("Elemento: " + c1.get(i));
        }

        ArrayList<String> c2 = new ArrayList<>();
        
        c2.add("Vento");
        c2.add("Calor");
        c2.add("Frio");
        c2.add("Chuva");

        System.out.println(c2);
        Collections.sort(c2);
        System.out.println(c2);

        c2.remove("Frio");
        c2.remove(0);

        System.out.println(c2);

        System.out.println(c2.contains("Chuva"));
        System.out.println(c2.contains("Frio"));

        c2.add("Chuva");

        System.out.println(c2);

        System.out.println(c2.indexOf("Chuva"));
        System.out.println(c2.lastIndexOf("Chuva"));

        System.out.println(c2.subList(1, 2));

        c2.set(0, "Calor");

        System.out.println(c2);


        Set<Pessoa> c3 = new HashSet<>();

        c3.add(new Pessoa("João", 01, new Date(1, 1, 2022)));
        c3.add(new Pessoa("Joana", 02, new Date(3, 4, 2341)));
        c3.add(new Pessoa("José", 03, new Date(27, 5, 2012)));
        c3.add(new Pessoa("Joaquim", 04, new Date(18, 12, 2001)));
        c3.add(new Pessoa("Josefina", 05, new Date(25, 4, 1999)));

        for (Pessoa x : c3) {
            System.out.println(x);
        }

        System.out.println();
        c3.add(new Pessoa("Josefina", 05, new Date(25, 4, 1999)));

        for (Pessoa x : c3) {
            System.out.println(x);
        }


        Set<Date> c4 = new TreeSet<>();

        c4.add(new Date(14, 7, 2012));



        c4.add(new DateYMD(14, 7, 2012));
        c4.add(new DateYMD(17, 5, 2022));
        c4.add(new Date(25, 4, 1999));
        c4.add(new DateYMD(27, 10, 2019));
        c4.add(new Date(27, 10, 2019));


        for (Date x : c4) {
            System.out.println(x);
        }
    }
}