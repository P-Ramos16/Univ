package ExamP_2017.Ex1;

public class Jogo {
    private Equipa team1, team2;
    private Bola ball;
    private int totalTime, currTime;
    
    public Jogo(Equipa equipa1, Equipa equipa2, Bola bola, int tempo) {
        this.team1 = equipa1;
        this.team2 = equipa2;
        this.ball = bola;
        this.totalTime = tempo;
    }

    @Override
    public String toString() {
        return "Jogo entre " + team1.getName() + " e " + team2.getName() + "\n";
    }
    
}
