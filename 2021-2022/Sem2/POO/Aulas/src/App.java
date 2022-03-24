import java.util.Scanner;

public class App {
    public static void main(String[] args) throws Exception {

        Scanner sc = new Scanner(System.in);

        System.out.println("Hello, World!");
        System.out.println("Introduza um número para somar >");

        int x = sc.nextInt();

        int sum = 0;
        
        for (int i = 0; i <= x; i++) {
            sum += i;
        }

        System.out.println(sum);
		sc.close();
    }
}
