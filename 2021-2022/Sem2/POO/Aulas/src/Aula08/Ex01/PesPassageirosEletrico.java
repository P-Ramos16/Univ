package Aula08.Ex01;

public class PesPassageirosEletrico extends PesPassageiros implements VeiculoEletrico {
            
    public int legElecBateria;
    public int legEleAlcance;
    public int ALLAlcance;

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
        ALLAlcance = alcance;
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
   
    public void trajeto(int newKm) {
        veicLastTrajeto = veicTrajeto;
        veicTrajeto = newKm;
        autonomia();
    }

    public int autonomia() {
        if (veicTrajeto != 0) {
            legElecBateria = legElecBateria - (veicTrajeto * 100 / ALLAlcance);
        }
        
        legEleAlcance = legEleAlcance - veicTrajeto;
        if (0 > legEleAlcance) {
            legEleAlcance = 0;
        }

        return legEleAlcance;

    }

    public void carregar(int perc) {
        legElecBateria += perc;
    }


    public String toString() {
        return "Tipo : " + this.getClass().getSimpleName() + " Marca: " + veicMarca + " Modelo: " + veicModelo + " Matricula: " + veicMatricula + "  Potência: " + veicPotencia + " Distância Total: " + veicDistTotal + " Alcance: " + legEleAlcance + " Bateria: " + legElecBateria;
    }
    
}
