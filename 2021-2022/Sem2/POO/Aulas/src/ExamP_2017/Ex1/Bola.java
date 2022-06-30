package ExamP_2017.Ex1;

public class Bola extends ObjetoMovel {
    CorDaBola colour;
    private static int nBolas = 0;

    public Bola(CorDaBola cor) {
        this.colour = cor;
        nBolas++;
    }

    public static int getnBolas() {
        return nBolas;
    } 
}
