package a107348;

import java.util.*;

public class Sport extends Activity {
    private static double preco = 30;
    protected Sport.Modality modalidade;

    public Sport(Sport.Modality modal, int part) {
        super();
        this.modalidade = modal;
        this.numParti = part;

    }

    public enum Modality {    
        KAYAK, HIKING;
    }

    public double getPreco() {
        return preco;
    }

    @Override
    public String toString() {       
        return "    " + modalidade.toString() + " sporting activity with " + numParti + " participants\n";
    }
}

