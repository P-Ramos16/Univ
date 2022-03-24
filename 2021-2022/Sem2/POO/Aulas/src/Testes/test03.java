package Testes;

import java.util.Scanner;

public class test03 {

    public static void main(String[] args) {  // Program entry point


        Funcao("Boas");
        System.out.println(Calc(3));
        System.out.println(BiggerOf(13, 7));
        System.out.println(ReadNum());
        System.out.println(ReadNumBetween());
        System.out.println(countZ("AZZzZZz"));
        System.out.println(countZ("AZZzZzZ"));
        System.out.println(countZ(""));
        System.out.println(countZ("A"));
        System.out.println(countZ("ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZzzz"));
     }
    


    public static void Funcao(String mensagem) {
        System.out.println("Aviso!!:" + mensagem);
    }

    public static double Calc(double x) {

    return 2*Math.pow(x, 2);
    }

    public static int BiggerOf(int x, int y) {

    return (x >= y ? x : y);
    }

    public static int ReadNum() {

        Scanner sc = new Scanner(System.in);

        int readNum = -1;

        while (readNum < 0) {
            System.out.print("Insira um número positivo >");
            readNum = sc.nextInt();
        }

    return readNum;
    }

    public static double ReadNumBetween() {

        Scanner sc = new Scanner(System.in);

        double readNum2 = -1;

        while (readNum2 < 0 || readNum2 > 10) {
            System.out.print("Insira um número entre 0 e 10 >");
            readNum2 = sc.nextDouble();
        }

    sc.close();
    return readNum2;
    }

    public static int countZ(String str) {
        
        int numZ = 0;

        for(int i = 0; i < str.length(); i++) {
            if(str.charAt(i) == 'Z') {
                numZ++;
            }
        }

    return numZ;
    }
}