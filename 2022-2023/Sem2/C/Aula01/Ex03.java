package Aula01;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Stack;


public class Ex03 {
    public static void main(String[] args) {
        
        try {

            BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        
            System.out.println("             ---Calculadora---");
            System.out.println("     Introduza os valores e a operação");
            System.out.println("  pretendida no formato 'val0 operator val1'");
            System.out.println("   ----------------------------------------\n");

            String[] inpVals;
            Double val0, val1, returnVal = 0.0;
            String operator;

            while (true) {

                int nInputs = 0;
                Stack<Double> inputStack = new Stack<Double>();

                System.out.print("                 > ");
                String input = reader.readLine();
                System.out.println("");
                inpVals = input.split("[ \n]");
                nInputs += inpVals.length;

                for (int i = 0; i < nInputs; i++) {


                    if (isNumeric(inpVals[i])) {
                        inputStack.push(Double.parseDouble(inpVals[i]));
                        System.out.println("Stack >>> " + inputStack.toString());
                        continue;
                    }
                    else {

                        val1 = inputStack.pop();
                        val0 = inputStack.pop();

                        switch(inpVals[i]) {
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

                        inputStack.push(returnVal);

                        System.out.println("Stack >>> " + inputStack.toString());
                    }

                }
                System.out.println("\nResultado >>> " + returnVal);
                System.out.println("\n   ----------------------------------------\n");
                continue;
            }    
        }
        catch(Exception e) {
            e.printStackTrace();
            System.out.println("Occoreu um erro na execução do programa! Saindo...");
            System.exit(1);
        }




    }


    public static boolean isNumeric(String string) {            
        if(string == null || string.equals("")) {
            return false;
        }

        try {
            Double intValue = Double.parseDouble(string);
            return true;
        } 
        catch (NumberFormatException e) {
            return false;
        }
    }
}