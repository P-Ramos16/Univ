package Testes;

import java.util.Scanner;

public class test01 {
    public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);

        int x = 1;
        int y = 1;
        int z = 0;

        System.out.print("max >");
        int max = sc.nextInt();

        int res = fibo(x, y, z, max);

        System.out.println("res >" + res);

        sc.close();

    }

    public static int fibo(int x, int y, int z, int max) {
        z = x + y;
        x = y;
        y = z;

        if (z >= max) {

            return z;
        }

        System.out.println(z);
        return fibo(x, y, z, max);
    }
}
