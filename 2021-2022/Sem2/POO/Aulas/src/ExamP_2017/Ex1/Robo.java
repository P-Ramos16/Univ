package ExamP_2017.Ex1;

public class Robo extends ObjetoMovel implements Comparable<Robo> {
    private String id;
    private TipoJogador playerType;
    private int numScores;

    public Robo(String name, TipoJogador type, int newX, int newY) {
        super();
        this.id = name;
        this.playerType = type;
        this.numScores = 0;
        X = newX;
        Y = newY;
    }

    public int compareTo(Robo robo2) {
        return this.id.compareTo(robo2.getId());
    }

    public void marcaGolo() {
        numScores++;
    }

    public String getId() {
        return this.id;
    }

    public String getTipo() {
        return String.valueOf(this.playerType);
    }
    
    public int getGolos() {
        return this.numScores;
    }

}
