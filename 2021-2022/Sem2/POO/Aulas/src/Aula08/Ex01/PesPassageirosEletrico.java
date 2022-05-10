package Aula08.Ex01;

public class PesPassageirosEletrico extends PesPassageiros implements VeiculoEletrico {
            
    public int legElecBateria;
    public int legEleAlcance;

    public PesPassageirosEletrico(String matricula, String marca, String modelo, int potencia, int quadro, int peso, int pessoas, int bateria, int alcance) {
        super(matricula, marca, modelo, potencia, quadro, peso, pessoas);
        veicMatricula = matricula;
        veicMarca = marca;
        veicModelo = modelo;
        veicPotencia = potencia;
        pesNumQuadro= quadro;
        pesMaxPeso = peso;
        passPessoasMax = pessoas;
        legElecBateria = bateria;
        legEleAlcance = alcance;
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
   
    public int autonomia() {
        return (legElecBateria / 100) * legEleAlcance;
    }

    public void carregar(int perc) {
        legElecBateria += perc;
    }
    
}
