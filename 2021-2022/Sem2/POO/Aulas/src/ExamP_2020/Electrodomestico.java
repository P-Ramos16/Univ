package ExamP_2020;

public class Electrodomestico extends Produto {
    private String tipo, marca, modelo;
    private ClasseEnergetica classeEnergetica;
    private double potencia;

    public Electrodomestico(String tipoSet, String marcaSet, String modeloSet, int potSet, int priceSet) {
        super();
        this.tipo = tipoSet;
        this.marca = marcaSet;
        this.modelo = modeloSet;
        this.potencia = potSet;
        this.basePrice = priceSet;
        this.code = "E" + Integer.toString(codeInt);
        codeInt++;
        this.stock = 0;
    }

    public Electrodomestico(String tipoSet, String marcaSet, String modeloSet, int priceSet) {
        super();
        this.tipo = tipoSet;
        this.marca = marcaSet;
        this.modelo = modeloSet;
        this.basePrice = priceSet;
        this.code = "E" + Integer.toString(codeInt);
        codeInt++;
    }

    public void setClasse(ClasseEnergetica classSet) {
        this.classeEnergetica = classSet;
    }

    public void addStock(int stockSetter) {
        this.stock += stockSetter;
    }

    public String getDescricao() {
        return tipo + ":" + marca + "/" + modelo;
    }

    

}
