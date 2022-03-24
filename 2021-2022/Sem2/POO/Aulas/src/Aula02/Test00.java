package Aula02;

import java.util.Scanner;

public class Test00 {
    
    public static void main(String[] args) {

        int res = 0;

        String[] text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.".split(" ");

		Scanner sc = new Scanner(System.in);

        System.out.println("/----------------------\\");
        System.out.println("|---Choose an option---|");
        System.out.println("|--- 1 -> Calc --------|");
        System.out.println("|--- 2 -> Area --------|");
        System.out.println("|--- 3 -> Text --------|");
        System.out.println("\\----------------------/");

        System.out.print("          > ");
        int option = sc.nextInt();

        switch(option) {
            case (1):
                System.out.print("    num 1 > ");
                int num1 = sc.nextInt();

                System.out.print(" operação > ");
                String ope = sc.next();

                System.out.print("    num 2 > ");
                int num2 = sc.nextInt();


                switch(ope) {
                    case ("+"):
                        res = num1 + num2;
                        break;

                    case ("-"):
                        res = num1 - num2;
                        break;

                    case ("*"):
                        res = num1 * num2;
                        break;

                    case ("/"):
                        res = num1 / num2;
                        break;

                    default:
                        System.out.print("   ---operador inexistente---");
                        break;
                    
                }

                break;

            case (2):


                System.out.println("/----------------------\\");
                System.out.println("|---Choose an option---|");
                System.out.println("|--- 1 -> Square ------|");
                System.out.println("|--- 2 -> Cube --------|");
                System.out.println("|--- 3 -> Trapezoid ---|");
                System.out.println("|--- 4 -> Pyramid -----|");
                System.out.println("\\----------------------/");

                System.out.print("          > ");
                int shape = sc.nextInt();

                System.out.print("    len 1 > ");
                int len1 = sc.nextInt();

                System.out.print("    len 2 > ");
                int len2 = sc.nextInt();

                switch(shape) {
                    case (1):
                        res = len1 * len2;
                        break;

                    case (2):

                        System.out.print("    len 3 > ");
                        int len3 = sc.nextInt();

                        res = len1 * len2 * len3;
                        break;

                    case (3):

                        System.out.print("    len 3 > ");
                        len3 = sc.nextInt();

                        res = (len1 + len2) * len3 / 2; 
                        break;

                    case (4):

                        System.out.print("    len 3 > ");
                        len3 = sc.nextInt();

                        res = (len1 + len2) * len3 / 3; 
                            break;

                    default:
                        System.out.print("   ---operador inexistente---");
                        break;
                    
                }

                break;

            case (3):


                System.out.print("          > ");

                for (int i = 0; i < text.length; i++) {
                }
                break;

            default:

        }

        System.out.println("/----------------------\\");
        System.out.println("|----- Resultado ------|");
        System.out.println(String.format("|--------- %d ----------|", res));
        System.out.println("\\----------------------/");
        

        sc.close();

    }
}
