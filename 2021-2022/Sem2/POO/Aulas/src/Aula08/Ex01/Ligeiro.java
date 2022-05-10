package Aula08.Ex01;

public class Ligeiro extends VeiculoMotorizado{
    
    public int ligNumQuadro;
    public int ligCapBagageira;

    public Ligeiro(String matricula, String marca, String modelo, int potencia, int quadro, int bagageira) {
        super(matricula, marca, modelo, potencia);
        veicMatricula = matricula;
        veicMarca = marca;
        veicModelo = modelo;
        veicPotencia = potencia;
        ligNumQuadro = quadro;
        ligCapBagageira = bagageira;
    }

    public void set(String matricula, String marca, String modelo, int potencia, int quadro, int bagageira) {
        veicModelo = modelo;
        veicPotencia = potencia;
        ligNumQuadro = quadro;
        ligCapBagageira = bagageira;
    }
}
