package Aula08.Ex01;

public class PesPassageiros extends Pesado{
        
    public int passPessoasMax;

    public PesPassageiros(String matricula, String marca, String modelo, int potencia, int quadro, int peso, int pessoas) {
        super(matricula, marca, modelo, potencia, quadro, peso);
        veicMatricula = matricula;
        veicMarca = marca;
        veicModelo = modelo;
        veicPotencia = potencia;
        pesNumQuadro= quadro;
        pesMaxPeso = peso;
        passPessoasMax = pessoas;
    }

    public void set(String matricula, String marca, String modelo, int potencia, int quadro, int peso, int pessoas) {
        veicMatricula = matricula;
        veicMarca = marca;
        veicModelo = modelo;
        veicPotencia = potencia;
        pesNumQuadro= quadro;
        pesMaxPeso = peso;
        passPessoasMax = pessoas;
    }
}
