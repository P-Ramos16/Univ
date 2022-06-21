package ExamP_2017;

public class Robo extends ObjetoMovel {
    private String id;
    private TipoJogador playerType;
    private int numScores;

    public Robo(String name, TipoJogador type, int scores, int unused) {
        this.id = name;
        this.playerType = type;
        this.numScores = scores;
    }

    public String getId() {
        return String.valueOf(this.id);
    }

    public String getTipo() {
        return String.valueOf(this.playerType);
    }
    
    public String getGolos() {
        return String.valueOf(this.numScores);
    }

}
