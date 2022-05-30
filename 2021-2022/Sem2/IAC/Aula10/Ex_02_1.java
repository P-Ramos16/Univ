import java.util.*;

public class Ex_02_1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        int res = 0;
        int num;

        for (int i = 0; i < 5; i++) {
            System.out.printf("Introduza o numero (%d) >", i);
            num = sc.nextInt();

            if (num >= 0) {
                res += num;
            }
        }

        System.out.printf("Resultado > %s\n", res);





    }
}
