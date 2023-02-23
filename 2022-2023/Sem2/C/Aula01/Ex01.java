package Aula01;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class Ex01 {
    public static void main(String[] args) {
        
        try {

            BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        
            System.out.println("             ---Calculadora---");
            System.out.println("     Introduza os valores e a operação");
            System.out.println("  pretendida no formato 'val0 operator val1'");
            System.out.println("   ----------------------------------------\n");
            System.out.print("                 > ");

            int nInputs = 0;
            String[] values = {"", "", ""};

            while (nInputs < 3) {
                String input = reader.readLine();

                String[] inpVals = input.split("[ ]");

                for (int i = 0; i < inpVals.length; i++) {
                    values[nInputs + i] = inpVals[i];
                }

                nInputs += inpVals.length;
            }

            if (nInputs > 3) {
                throw new Exception("Foram inseridos demasiados valores! Coloque só 'val0 operador val1'");
            }

            Double val0 = Double.parseDouble(values[0]);
            String operator = values[1];
            Double val1 = Double.parseDouble(values[2]);

            Double returnVal = null;

            switch(operator) {
                case ("+"):
                    returnVal = val0 + val1;
                    break;

                case ("-"):
                    returnVal = val0 - val1;
                    break;
                
                case ("/"):
                case (":"):
                    returnVal = val0 / val1;
                    break;
                
                case ("*"):
                case ("x"):
                    returnVal = val0 * val1;
                    break;
                
                default:
                    throw new Exception("Operador inválido! Utilize '+', '-', '*' ou '/'");
            }

            System.out.println("\nResultado >>> " + returnVal);
            System.out.println("\n   ----------------------------------------\n");

            //Character again = '\0';

            //while (again != 'n' && again != 'y') {
            //    System.out.println("  Realizar outro cálculo? (y/n) ");    
            //    System.out.print("                 > ");
            //    again = reader.readLine().charAt(0);
            //}

            //if (again == 'n') {
            //    System.out.println("\n   ----------------------------------------\n");
            //    System.out.println("  Programa terminado. Adeus! ");    
            //    System.exit(0);
            //}          
        }
        catch(Exception e) {
            e.printStackTrace();
            System.out.println("Occoreu um erro na execução do programa! Saindo...");
            System.exit(1);
        }




    }
}