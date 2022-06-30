package a107348;

import java.util.*;

public class Culture extends Activity {
    private static double preco = 22;
    protected Culture.Option opcao;

    public Culture(Culture.Option modal, int part) {
        super();
        this.opcao = modal;
        this.numParti = part;

    }

    public enum Option {    
        ARCHITECTURAL_TOUR, RIVER_TOUR, ART_MUSEUM, WINE_TASTING;
    }

    public double getPreco() {
        return preco;
    }
    
    @Override
    public String toString() {       
        return  "    " + opcao.toString() + " with " + numParti + " participants\n";
    }
}
