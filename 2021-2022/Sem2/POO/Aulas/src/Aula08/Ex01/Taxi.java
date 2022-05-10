package Aula08.Ex01;

public class Taxi extends Ligeiro{
    
    public int taxiNumLicenca;

    public Taxi(String matricula, String marca, String modelo, int potencia, int quadro, int bagageira, int licenca) {
        super(matricula, marca, modelo, potencia, quadro, bagageira);
        veicMatricula = matricula;
        veicMarca = marca;
        veicModelo = modelo;
        veicPotencia = potencia;
        ligNumQuadro = quadro;
        ligCapBagageira = bagageira;
        taxiNumLicenca = licenca;
    }

    public void set(String matricula, String marca, String modelo, int potencia, int quadro, int bagageira, int licenca) {
        veicMatricula = matricula;
        veicMarca = marca;
        veicModelo = modelo;
        veicPotencia = potencia;
        ligNumQuadro = quadro;
        ligCapBagageira = bagageira;
        taxiNumLicenca = licenca;
    }
}
