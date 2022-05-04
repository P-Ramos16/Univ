package Aula07;

import java.util.*;

public class Ex03 {
    public static void main(String[] args) {

        ArrayList<Viatura> ViaturaList = new ArrayList<Viatura>();
        ArrayList<Alojamentos> AlojamentosList = new ArrayList<Alojamentos>();

        while (true) {

            Scanner sc = new Scanner(System.in);

            System.out.println("Agency operations:");
            System.out.println("1 - create new Viatura");
            System.out.println("2 - create new Alojamento");
            System.out.println("3 - print current Viaturas");
            System.out.println("4 - print current Alojamentos");
            System.out.println("5 - reserve uma Viatura");
            System.out.println("6 - reserve um Alojamento");;
            System.out.println("7 - retrieve uma Viatura");
            System.out.println("8 - retrieve um Alojamento");
            System.out.println("0 - exit");
            System.out.print("     > ");
            int option = sc.nextInt();
            System.out.println("");
            System.out.println("");

            switch(option) {
                case(0):
                    System.out.println(" __EXITING__ ");
                    sc.close();
                    System.out.println("");
                    System.out.println("");
                    System.exit(0);
                    break;
                
                case(1):
                    System.out.println(" __CREATE_NEW_VIATURA__ ");

                    System.out.println(" Insert Name:");
                    System.out.print("      > ");
                    String name = sc.nextLine();
                    name = sc.nextLine();
                    System.out.println(" Insert Class:");
                    System.out.print("      > ");
                    Character vclass = sc.nextLine().charAt(0);
                    System.out.println(" Insert Type:");
                    System.out.print("      > ");
                    String type = sc.nextLine();
                    Viatura currViatura = new Carro();
                    currViatura.set(name, vclass, type);
                    System.out.println("");
                    System.out.println("");
                    ViaturaList.add(currViatura);                 
                    
                    break;

                case(2):
                    System.out.println(" __CREATE_NEW_ALOJAMENTO__ ");

                    System.out.println("Which Type?:");
                    System.out.println("1 - Apartamento");
                    System.out.println("2 - Hotel");
                    System.out.println("0 - exit");
                    System.out.print("     > ");
                    option = sc.nextInt();
                    System.out.println("");
                    System.out.println("");

                    if (option == 1) {
                        System.out.println(" Insert Name:");
                        System.out.print("      > ");
                        name = sc.nextLine();
                        name = sc.nextLine();
                        System.out.println(" Insert Code:");
                        System.out.print("      > ");
                        String code = sc.nextLine();
                        System.out.println(" Insert Address:");
                        System.out.print("      > ");
                        String address = sc.nextLine();
                        System.out.println(" Insert Preço:");
                        System.out.print("      > ");
                        Double price = sc.nextDouble();
                        System.out.println(" Insert Reserved (true/false):");
                        System.out.print("      > ");
                        Boolean reserved = sc.nextBoolean();
                        System.out.println(" Insert Review:");
                        System.out.print("      > ");
                        Double review = sc.nextDouble();
                        Alojamentos currAloj = new Apartamento(name, code, address, price, reserved, review);
                        currAloj.set(name, code, address, price, reserved, review);
                        System.out.println("");
                        System.out.println("");
                        AlojamentosList.add(currAloj);     
                    }
            
                    else if (option == 0) {
                        System.out.println(" Insert Name:");
                        System.out.print("      > ");
                        name = sc.nextLine();
                        name = sc.nextLine();
                        System.out.println(" Insert Code:");
                        System.out.print("      > ");
                        String code = sc.nextLine();
                        code = sc.nextLine();
                        System.out.println(" Insert Address:");
                        System.out.print("      > ");
                        String address = sc.nextLine();
                        address = sc.nextLine();
                        System.out.println(" Insert Preço:");
                        System.out.print("      > ");
                        Double price = sc.nextDouble();
                        price = sc.nextDouble();
                        System.out.println(" Insert Reserved (true/false):");
                        System.out.print("      > ");
                        Boolean reserved = sc.nextBoolean();
                        reserved = sc.nextBoolean();
                        System.out.println(" Insert Review:");
                        System.out.print("      > ");
                        Double review = sc.nextDouble();
                        review = sc.nextDouble();
                        Alojamentos currAloj = new Hotel();
                        currAloj.set(name, code, address, price, reserved, review);
                        System.out.println("");
                        System.out.println("");
                        AlojamentosList.add(currAloj);     
                    }
                    
                    break;


                case(3):
                    System.out.println(" __PRINT_CURRENT_VIATURES__ ");
                    System.out.println("");
                    System.out.println("");
                    for (int i = 0; i < ViaturaList.size(); i++) {
                        System.out.println(ViaturaList.get(i).print());
                    }
                    System.out.println("");
                    System.out.println("");
                    
                    break;
                
                case(4):
                    System.out.println(" __PRINT_CURRENT_ALOJAMENTOS__ ");
                    System.out.println("");
                    System.out.println("");
                    for (int i = 0; i < AlojamentosList.size(); i++) {
                        System.out.println(AlojamentosList.get(i).print());
                    }
                    System.out.println("");
                    System.out.println("");
                    
                    break;
            
                case(5):

                    System.out.println(" __RESERVE_VIATURA__ ");

                    System.out.println("");
                    System.out.println("Which viatura (name)?");
                    System.out.print("     > ");
                    name = sc.nextLine();
                    System.out.println("");
                    System.out.println("");

                    for (int i = 0; i < ViaturaList.size(); i++) {
                        if (name == ViaturaList.get(i).get()) {
                            ViaturaList.get(i).request();
                        }
                    }
                
                    break;

                            
                case(6):

                    System.out.println(" __RESERVE_ALOJAMENTO__ ");

                    System.out.println("");
                    System.out.println("Which alojamento (name)?");
                    System.out.print("     > ");
                    name = sc.nextLine();
                    System.out.println("");
                    System.out.println("");

                    for (int i = 0; i < AlojamentosList.size(); i++) {
                        if (name == ViaturaList.get(i).get()) {
                            AlojamentosList.get(i).request();
                        }
                    }
                
                    break;

            case(7):

                System.out.println(" __RETRIEVE_VIATURA__ ");

                System.out.println("");
                System.out.println("Which viatura (name)?");
                System.out.print("     > ");
                name = sc.nextLine();
                System.out.println("");
                System.out.println("");

                for (int i = 0; i < ViaturaList.size(); i++) {
                    if (name == ViaturaList.get(i).get()) {
                        ViaturaList.get(i).recieve();
                    }
                }
            
                break;

                        
            case(8):

                System.out.println(" __RETRIEVE_ALOJAMENTO__ ");

                System.out.println("");
                System.out.println("Which alojamento (name)?");
                System.out.print("     > ");
                name = sc.nextLine();
                System.out.println("");
                System.out.println("");

                for (int i = 0; i < AlojamentosList.size(); i++) {
                    if (name == ViaturaList.get(i).get()) {
                        AlojamentosList.get(i).recieve();
                    }
                }
            
                break;
            }

        }
    }

}
