package Aula08.Ex01;

public class Pesado extends VeiculoMotorizado{
    
    public int pesNumQuadro;
    public int pesMaxPeso;

    public Pesado(String matricula, String marca, String modelo, int potencia, int quadro, int peso) {
        super(matricula, marca, modelo, potencia);
        veicMatricula = matricula;
        veicMarca = marca;
        veicModelo = modelo;
        veicPotencia = potencia;
        pesNumQuadro = quadro;
        pesMaxPeso = peso;
    }

    public void carregar(int batt) {}


    public String toString() {
        return "Tipo : " + this.getClass().getSimpleName() + " Marca: " + veicMarca + " Modelo: " + veicModelo + " Matricula: " + veicMatricula + "  Potência: " + veicPotencia + " Distância Total: " + veicDistTotal + " CargaMax: " + pesMaxPeso;
    }
}
