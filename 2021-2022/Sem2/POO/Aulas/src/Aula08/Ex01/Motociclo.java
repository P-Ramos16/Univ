package Aula08.Ex01;

public class Motociclo extends VeiculoMotorizado {
    private String motoType;

    public Motociclo(String matricula, String marca, String modelo, int potencia, String tipo) {
        super(matricula, marca, modelo, potencia);
        veicMatricula = matricula;
        veicMarca = marca;
        veicModelo = modelo;
        veicPotencia = potencia;
        motoType = tipo;
    }

    public void set(String matricula, String marca, String modelo, int potencia, String tipo) {
        veicMatricula = matricula;
        veicMarca = marca;
        veicModelo = modelo;
        veicPotencia = potencia;
        motoType = tipo;
    }
}
