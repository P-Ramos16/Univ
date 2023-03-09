package Aula02;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Stack;


public class Ex07 {
    public static void main(String[] args) {
        
        try {

            BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        
            System.out.println("             ---Calculadora---");
            System.out.println("     Introduza os valores e a operação");
            System.out.println("  pretendida no formato 'operator val0 val1'");
            System.out.println("   ----------------------------------------\n");

            String[] inpVals;

            while (true) {

                System.out.print("                 > ");
                String input = reader.readLine();
                System.out.println("");
                inpVals = input.split("[ \n]");

                Stack<String> inputStack = new Stack<String>();
                ExpressionTree expTree = new ExpressionTree();

                for (String inputNum : inpVals) {
                    inputStack.push(inputNum);
                }

                while (!inputStack.isEmpty()) {

                    String newNum = inputStack.pop();

                    if (isNumeric(newNum)) {
                        expTree.insertNumber(newNum);
                    }                    
                    else {
                        expTree.insertOperator(newNum);
                    }
                }

                
                expTree.printTree();


                System.out.println(expTree.printInfix());                

                expTree.eval();

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