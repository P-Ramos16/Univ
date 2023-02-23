package Aula01;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Map;

public class Ex02 {
    public static void main(String[] args) {
        
        try {

            BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        
            System.out.println("             ---Calculadora---");
            System.out.println("     Introduza os valores e a operação");
            System.out.println("  pretendida no formato 'val0 operator val1'");
            System.out.println("   ----------------------------------------\n");


            HashMap<String, Double> varMap = new HashMap<String, Double>();
            String[] inpVals;
            Double val0, val1, returnVal = 0.0;
            String operator;


            while (true) {

                int nInputs = 0;
                String[] values = new String[24];

                System.out.print("                 > ");
                String input = reader.readLine();

                inpVals = input.split("[ \n]");

                for (int i = 0; i < inpVals.length; i++) {
                    values[nInputs + i] = inpVals[i];
                }

                nInputs += inpVals.length;

                if (nInputs > 2 && values[1].charAt(0) != '=' ) {

                    if (isNumeric(values[0])) {
                        val0 = Double.parseDouble(values[0]);
                    }
                    else {
                        val0 = varMap.get(values[0]);
                    }

                    returnVal = val0;


                    for (int i = 2; i < nInputs; i += 2) {
                        if (!isNumeric(values[i])) {
                            val0 = varMap.get(values[i]);
                        }
                        else {
                            val0 = Double.parseDouble(values[i]);
                        }

                        switch(values[i - 1]) {
                            case ("+"):
                                returnVal += val0;
                                break;
            
                            case ("-"):
                                returnVal -= val0;
                                break;
                            
                            case ("/"):
                            case (":"):
                                returnVal /= val0;
                                break;
                            
                            case ("*"):
                            case ("x"):
                                returnVal *= val0;
                                break;
                            
                            default:
                                throw new Exception("Operador inválido! Utilize '+', '-', '*' ou '/'");
                        }
                    }
                    System.out.println("\nResultado >>> " + returnVal);
                    System.out.println("\n   ----------------------------------------\n");
                    continue;
                }
                else {

                    returnVal = 0.0;

                    if (nInputs == 1) {
                        System.out.println("\nResultado >>> " + varMap.get(values[0]));
                        System.out.println("\n   ----------------------------------------\n");
                        continue;
                    }

                    for (int i = 2; i < nInputs; i += 2) {
                        if (!isNumeric(values[i])) {
                            val0 = varMap.get(values[i]);
                        }
                        else {
                            val0 = Double.parseDouble(values[i]);
                        }

                        switch(values[i - 1]) {
                            case ("="):
                                returnVal = val0;
                                break;

                            case ("+"):
                                returnVal += val0;
                                break;
            
                            case ("-"):
                                returnVal -= val0;
                                break;
                            
                            case ("/"):
                            case (":"):
                                returnVal /= val0;
                                break;
                            
                            case ("*"):
                            case ("x"):
                                returnVal *= val0;
                                break;
                            
                            default:
                                throw new Exception("Operador inválido! Utilize '+', '-', '*' ou '/'");
                        }
                    }
                    
                    varMap.put(values[0], returnVal);

                    continue;
                }

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