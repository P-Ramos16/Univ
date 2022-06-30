package ExamP_2020;

import java.util.*;

public class Loja {
    private String nome, endereco;
    private TreeSet<Produto> stockMap;

    public Loja(String name, String email) {
        this.nome = name;
        this.endereco = email;
        stockMap = new TreeSet<Produto>();
    }

    public int totalItems() {
        int tempInt = 0;

        for (Produto entry : stockMap) {
            tempInt += entry.getStock();
        }

        return tempInt;
    }

    public void add(Produto tempProd) {
        if (!stockMap.contains(tempProd)) {
            stockMap.add(tempProd);
        }
    }

    public String getProdutoPelaDescricao(String descGet) {

        for (Produto entry : stockMap) {

            if (descGet.equals(entry.getDescricao())) {
                return entry.getDescricao();
            }

        }

        return "";
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setEnderecoWeb(String endereco) {
        this.endereco = endereco;
    }

    public void reorder() {
		TreeSet<Produto> temp = new TreeSet<Produto>(new compareDescs());
		temp.addAll(this.stockMap);
		this.stockMap = temp;
    }

    public List<Produto> produtosPrecoFinalSuperiorA(double maxPrice) {
		List<Produto> tempList = new LinkedList<Produto>();
		
        for (Produto tempProd : stockMap) {
            if (tempProd.precoVendaAoPublico() > maxPrice) {
                tempList.add(tempProd);
            }
        }

        return tempList;
        
    }

    public String electrodomesticosClasseX(String classeStr) {	
        
        String tempStr = "";

        for (Produto tempProd : stockMap) {
            if (tempProd.getClass().equals(classeStr)) {
                tempStr += tempProd.getDescricao();
            }
        }

        return tempStr;
        
    }

    @Override
    public String toString() {
        String tempStr = "";

        tempStr += this.nome + " - Loja Online \n \n   Codigo Produto                  Em Stock        PVP\n";

        for (Produto tempProd : stockMap) {
            tempStr += tempProd.toString();
        }


        return tempStr;
    }

    

}
