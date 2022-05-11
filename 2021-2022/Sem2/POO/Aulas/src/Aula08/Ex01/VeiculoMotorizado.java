package Aula08.Ex01;

public abstract class VeiculoMotorizado implements KmPercorridosInterface {
    public String veicMatricula;
    public String veicMarca;
    public String veicModelo;
    public int veicPotencia;

    public int veicTrajeto;
    public int veicLastTrajeto;
    public int veicDistTotal;

    public VeiculoMotorizado(String matricula, String marca, String modelo, int potencia) {
        veicMatricula = matricula;
        veicMarca = marca;
        veicModelo = modelo;
        veicPotencia = potencia;
    }


    public void trajeto(int newKm) {
        veicLastTrajeto = veicTrajeto;
        veicTrajeto = newKm;
        veicDistTotal += newKm;
    }

    public int ultimoTrajeto() {
        return veicLastTrajeto;
    }
    
    public int distanciaTotal() {
        return veicDistTotal;
    }

    public String toString() {
        return "Tipo : " + this.getClass().getSimpleName() + " Marca: " + veicMarca + " Modelo: " + veicModelo + " Matricula: " + veicMatricula + "  Potência: " + veicPotencia + " Distância Total: " + veicDistTotal;
    }

    public String get() {
        return veicMatricula;
    }

    public int getKm() {
        return veicDistTotal;
    }

    public String getModel() {
        return veicModelo;
    }

    public abstract void carregar(int batt);
}
