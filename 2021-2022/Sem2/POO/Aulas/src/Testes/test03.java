package Testes;

import java.util.Scanner;

public class test03 {
    double real, complexo;
    
    
    public test03(double r, double c) {
        this.real = r;
        this.complexo = c;
    }
    
    public static void representComp(test03 c1) {
        System.out.printf(c1.real + " + " + c1.complexo + "i");
        
    }



    public static void main(String[] args) {  // Program entry point
        test03 c1 = new test03(5.5, 4);
        representComp(c1);
    }
}