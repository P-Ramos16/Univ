package ExamP_2017.Ex1;

public class ObjetoMovel {
    public int X, Y;
    private double currSpeed, totalDistance = 0;

    public ObjetoMovel() {}

    public void move(int newX, int newY) {
        calcDistance(newX, newY);
        this.X = newX;
        this.Y = newY;
    }

    public void move(int newX, int newY, double speed) {
        calcDistance(newX, newY);
        this.X = newX;
        this.Y = newY;
        this.currSpeed = speed;
    }

    public void calcDistance(int newX, int newY) {
        totalDistance += Math.sqrt((newX - this.X)^2 + (newY - this.Y)^2);
    }

    public Integer getX() {
        return (this.X);
    }

    public Integer getY() {
        return (this.Y);
    }

    public int getVelocidade() {
        return (int)(this.currSpeed);
    }

    public double getDistancia() {
        return (this.totalDistance);
    }

}
