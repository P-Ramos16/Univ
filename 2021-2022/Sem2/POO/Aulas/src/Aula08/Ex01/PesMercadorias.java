package Aula08.Ex01;

public class PesMercadorias extends Pesado{
    
    public int mercCargaMax;

    public PesMercadorias(String matricula, String marca, String modelo, int potencia, int quadro, int peso, int carga) {
        super(matricula, marca, modelo, potencia, quadro, peso);
        veicMatricula = matricula;
        veicMarca = marca;
        veicModelo = modelo;
        veicPotencia = potencia;
        pesNumQuadro= quadro;
        pesMaxPeso = peso;
        mercCargaMax = carga;
    }

    public void set(String matricula, String marca, String modelo, int potencia, int quadro, int peso, int carga) {
        veicMatricula = matricula;
        veicMarca = marca;
        veicModelo = modelo;
        veicPotencia = potencia;
        pesNumQuadro= quadro;
        pesMaxPeso = peso;
        mercCargaMax = carga;
    }
}
