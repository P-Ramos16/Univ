package Aula08.Ex01;

public class LigeiroEletrico extends Ligeiro implements VeiculoEletrico{
    
    public int legElecBateria;
    public int legEleAlcance;

    public LigeiroEletrico(String matricula, String marca, String modelo, int potencia, int quadro, int bagageira, int bateria, int alcance) {
        super(matricula, marca, modelo, potencia, quadro, bagageira);
        veicMatricula = matricula;
        veicMarca = marca;
        veicModelo = modelo;
        veicPotencia = potencia;
        ligNumQuadro = quadro;
        ligCapBagageira = bagageira;
        legElecBateria = bateria;
        legEleAlcance = alcance;

    }

    public void set(String matricula, String marca, String modelo, int potencia, int quadro, int bagageira) {
        veicModelo = modelo;
        veicPotencia = potencia;
        ligNumQuadro = quadro;
        ligCapBagageira = bagageira;
    }

    public int autonomia() {
        return (legElecBateria / 100) * legEleAlcance;
    }

    public void carregar(int perc) {
        legElecBateria += perc;
    }
}
