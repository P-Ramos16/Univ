package Aula08.Ex01;

import java.util.*;

public class Ex01 {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.println(" __CREATE_NEW_EMPRESA__ ");
        System.out.println(" Insert Name:");
        System.out.print("      > ");
        String name = sc.nextLine();
        System.out.println(" Insert Postal Code:");
        System.out.print("      > ");
        String postal = sc.nextLine();
        System.out.println(" Insert Email:");
        System.out.print("      > ");
        String email = sc.nextLine();
        System.out.println("");
        System.out.println("");

        Empresa currEmpresa = new Empresa(name, postal, email);

        while (true) {


            System.out.println("Agency operations:");
            System.out.println("1 - create new Viatura");
            System.out.println("2 - print current Empresa");
            System.out.println("3 - compare Veiculos");
            System.out.println("4 - set Trajeto");
            System.out.println("5 - get last Trajeto");
            System.out.println("6 - get Total Distance");
            System.out.println("7 - get Viatura with most km");
            System.out.println("8 - carregar elétrico");
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
                    System.out.println(" __CREATE_NEW_VEICULO__ ");

                    System.out.println("Which Type?:");
                    System.out.println("1 - Motociclo");
                    System.out.println("2 - Ligeiro");
                    System.out.println("3 - Ligeiro (Taxi)");
                    System.out.println("4 - Pesado Mercadorias");
                    System.out.println("5 - Pesado Passageiros");
                    System.out.println("6 - Ligeiro Elétrico");
                    System.out.println("7 - Pesado Elétrico");
                    System.out.println("0 - exit");
                    System.out.print("     > ");
                    option = sc.nextInt();
                    System.out.println("");
                    System.out.println("");

                    System.out.println(" Insert Matricula:");
                    System.out.print("      > ");
                    String matricula = sc.nextLine();
                    matricula = sc.nextLine();
                    System.out.println(" Insert Marca:");
                    System.out.print("      > ");
                    String marca = sc.nextLine();
                    System.out.println(" Insert Modelo:");
                    System.out.print("      > ");
                    String modelo = sc.nextLine();
                    System.out.println(" Insert Potencia:");
                    System.out.print("      > ");
                    int potencia = sc.nextInt();

                    if (option == 1) {
                        System.out.println(" Insert Tipo (Desportivo / Estrada):");
                        System.out.print("      > ");
                        String tipo = sc.nextLine();
                        tipo = sc.nextLine();
                        System.out.println("");
                        System.out.println("");
                        VeiculoMotorizado currVeic = new Motociclo(matricula, marca, modelo, potencia, tipo);
                        currEmpresa.addVeiculos(currVeic);
                    }
            
                    else if (option == 2) {
                        System.out.println(" Insert Num Quadro:");
                        System.out.print("      > ");
                        int quadro = sc.nextInt();
                        System.out.println(" Insert Capacidade da Bagageira:");
                        System.out.print("      > ");
                        int bagage = sc.nextInt();
                        System.out.println("");
                        System.out.println("");
                        VeiculoMotorizado currVeic = new Ligeiro(matricula, marca, modelo, potencia, quadro, bagage);
                        currEmpresa.addVeiculos(currVeic); 
                    }             
                    
                    else if (option == 3) {
                        System.out.println(" Insert Num Quadro:");
                        System.out.print("      > ");
                        int quadro = sc.nextInt();
                        System.out.println(" Insert Capacidade da Bagageira:");
                        System.out.print("      > ");
                        int bagage = sc.nextInt();
                        System.out.println(" Insert Num Licença:");
                        System.out.print("      > ");
                        int licenca = sc.nextInt();
                        System.out.println("");
                        System.out.println("");
                        VeiculoMotorizado currVeic = new Taxi(matricula, marca, modelo, potencia, quadro, bagage, licenca);
                        currEmpresa.addVeiculos(currVeic); 
                    }         

                    else if (option == 4) {
                        System.out.println(" Insert Num Quadro:");
                        System.out.print("      > ");
                        int quadro = sc.nextInt();
                        System.out.println(" Insert Peso:");
                        System.out.print("      > ");
                        int peso = sc.nextInt();
                        System.out.println(" Insert Carga Máxima:");
                        System.out.print("      > ");
                        int carga = sc.nextInt();
                        System.out.println("");
                        System.out.println("");
                        VeiculoMotorizado currVeic = new PesMercadorias(matricula, marca, modelo, potencia, quadro, peso, carga);
                        currEmpresa.addVeiculos(currVeic); 
                    }         

                    else if (option == 5) {
                        System.out.println(" Insert Num Quadro:");
                        System.out.print("      > ");
                        int quadro = sc.nextInt();
                        System.out.println("");
                        System.out.println("");
                        System.out.println(" Insert Peso:");
                        System.out.print("      > ");
                        int peso = sc.nextInt();
                        System.out.println("");
                        System.out.println("");
                        System.out.println(" Insert Num Máximo de Passageiros:");
                        System.out.print("      > ");
                        int passageiros = sc.nextInt();
                        System.out.println("");
                        System.out.println("");
                        VeiculoMotorizado currVeic = new PesPassageiros(matricula, marca, modelo, potencia, quadro, peso, passageiros);
                        currEmpresa.addVeiculos(currVeic); 
                    }     
                                
                    else if (option == 6) {
                        System.out.println(" Insert Num Quadro:");
                        System.out.print("      > ");
                        int quadro = sc.nextInt();
                        System.out.println(" Insert Capacidade da Bagageira:");
                        System.out.print("      > ");
                        int bagage = sc.nextInt();
                        System.out.println(" Insert Capacidade da Bateria:");
                        System.out.print("      > ");
                        int bateria = sc.nextInt();
                        System.out.println(" Insert Alcance:");
                        System.out.print("      > ");
                        int alcance = sc.nextInt();
                        System.out.println("");
                        System.out.println("");
                        VeiculoMotorizado currVeic = new LigeiroEletrico(matricula, marca, modelo, potencia, quadro, bagage, bateria, alcance);
                        currEmpresa.addVeiculos(currVeic); 
                    } 

                    else if (option == 7) {
                        System.out.println(" Insert Num Quadro:");
                        System.out.print("      > ");
                        int quadro = sc.nextInt();
                        System.out.println("");
                        System.out.println("");
                        System.out.println(" Insert Peso:");
                        System.out.print("      > ");
                        int peso = sc.nextInt();
                        System.out.println(" Insert Num Máximo de Passageiros:");
                        System.out.print("      > ");
                        int passageiros = sc.nextInt();
                        System.out.println(" Insert Capacidade da Bateria:");
                        System.out.print("      > ");
                        int bateria = sc.nextInt();
                        System.out.println(" Insert Alcance:");
                        System.out.print("      > ");
                        int alcance = sc.nextInt();
                        System.out.println("");
                        System.out.println("");
                        VeiculoMotorizado currVeic = new PesPassageirosEletrico(matricula, marca, modelo, potencia, quadro, peso, passageiros, bateria, alcance);
                        currEmpresa.addVeiculos(currVeic); 
                    } 

                    break;

                case(2):
                    System.out.println(" __PRINT_CURRENT_EMPRESA__ ");
                    System.out.println("");
                    System.out.println(currEmpresa.get());
                    System.out.println("");
                    currEmpresa.print();
                    System.out.println("");
                    
                    break;
                
            
                case(3):

                    System.out.println(" __COMPARE_VEICULOS__ ");

                    System.out.println("");
                    System.out.println("First viatura (matricula)?");
                    System.out.print("     > ");
                    String veic0 = sc.nextLine();
                    veic0 = sc.nextLine();
                    System.out.println("");
                    System.out.println("Second viatura (matricula)?");
                    System.out.print("     > ");
                    String veic1 = sc.nextLine();

                    System.out.println("Are they equal?");
                    System.out.println("     > " + currEmpresa.compareVeic(veic0, veic1));
                    System.out.println("");
                    break;

                            
                case(4):

                    System.out.println(" __SET_TRAJETO__ ");

                    System.out.println("");
                    System.out.println("Which Veiculo (matricula)?");
                    System.out.print("     > ");
                    veic1 = sc.nextLine();
                    veic1 = sc.nextLine();
                    System.out.println("");
                    System.out.println("");

                    System.out.println("Which Trajeto (kms)?");
                    System.out.print("     > ");
                    int kms = sc.nextInt();
                    System.out.println("");

                    currEmpresa.setTrajeto(veic1, kms);
                    System.out.println("");
                
                    break;

                case(5):
                    System.out.println(" __LAST_TRAJETO__ ");

                    System.out.println("");
                    System.out.println("Which Veiculo (matricula)?");
                    System.out.print("     > ");
                    veic1 = sc.nextLine();
                    veic1 = sc.nextLine();
                    System.out.println("");

                    System.out.println("Distancia last trajeto: " + currEmpresa.lastTrajeto(veic1));
                    
                    System.out.println("");
                    break;

                            
                case(6):

                    System.out.println(" __DISTANCIA_TOTAL__ ");

                    System.out.println("");
                    System.out.println("Which Veiculo (matricula)?");
                    System.out.print("     > ");
                    veic1 = sc.nextLine();
                    veic1 = sc.nextLine();
                    System.out.println("");

                    currEmpresa.lastTrajeto(veic1);
                    

                    System.out.println("Distancia total: " + currEmpresa.distanciaTotal(veic1));
                
                    System.out.println("");
                    break;

                 
                case(7):

                    System.out.println(" __MOST_KM__ ");
                    System.out.println("");                
                    System.out.println("Veiculo com mais kms: " + currEmpresa.mostKM());
                    System.out.println("");
                    break;

                 
                case(8):

                    System.out.println(" __CARREGAR_ELETRICO__ ");
                    System.out.println("");
                    System.out.println("Which Veiculo (matricula)?");
                    System.out.print("     > ");
                    veic1 = sc.nextLine();
                    veic1 = sc.nextLine();
                    System.out.println("Carregar por quanto (0-100)?");
                    System.out.print("     > ");
                    int batt = sc.nextInt();
                    System.out.println("");

                    currEmpresa.carregar(veic1, batt);
                    break;
            }
        }
    }
}
