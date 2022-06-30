package ExamP_2020;

public abstract class Produto implements PVP, Comparable<Produto>{
    protected String code;
    protected int quantity;
    protected double basePrice;
    protected static int codeInt = 0;
    protected int stock = 0;

    public double precoVendaAoPublico() {
        int IVA = 23;

        System.out.println(this.getClass().getSimpleName());

        if(this.getClass().getSimpleName() == "Livro") {
            IVA = 6;
        }
        
        return basePrice + basePrice * IVA;
    }


    public int compareTo(Produto obj) {
        return this.code.compareTo(obj.getCode());
    }

    public String getCode() {
        return code;
    }

    public int compareDescs(Produto p) {
		return this.getDescricao().compareTo(p.getDescricao());
	}

    public boolean vender(int numVendas) {
        return (numVendas > this.stock);

    }

    public int getStock() {
        return stock;
    }

    public abstract String getDescricao();

}
