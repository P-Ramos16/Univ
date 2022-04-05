package Aula05;

public class Circle {
    private int r;

    public Circle(int r) {
        this.r = r;
    }

    public void set(int r) {
        if (r >= 0) {
            this.r = r;
        }
        else {
            System.out.println("Raio iválido!!");
        }
    }

    public String get() {
        return Integer.toString(this.r);
    }

    public String toString() {
        System.out.print("Tipo      > ");
        System.out.println("Circle");
        System.out.print("Área      > ");
        System.out.println(area());
        System.out.print("Perimetro > ");
        System.out.println(perimeter());
        return "Circle";
    }

    public double area() {
        return (this.r ^ 2) * Math.PI;
    }

    public double perimeter() {
        return this.r * 2 * Math.PI;
    }

}
