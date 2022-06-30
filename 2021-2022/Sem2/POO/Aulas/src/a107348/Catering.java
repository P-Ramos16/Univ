package a107348;

import java.util.*;


public class Catering extends Activity {
    private static double preco = 25;
    protected Catering.Option opcao;

    public Catering(Catering.Option modal, int part) {
        super();
        this.opcao = modal;
        this.numParti = part;

    }
    public enum Option {    
        FULL_MENU, DRINKS_AND_SNACKS, LIGHT_BITES;
    }

    public double getPreco() {
        return preco;
    }

    @Override
    public String toString() {       
        return  "    " + opcao.toString() + " for " + numParti + " participants\n";
    }
}
