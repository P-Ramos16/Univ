package ExamP_2017;

public class ObjetoMovel {
    private int X, Y;
    private double currSpeed, totalDistance = 0;

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

    public String getX() {
        return String.valueOf(this.X);
    }

    public String getY() {
        return String.valueOf(this.Y);
    }

    public String getVelocidade() {
        return String.valueOf(this.currSpeed);
    }

    public String getDistancia()) {
        return String.valueOf(this.totalDistance);
    }

}
