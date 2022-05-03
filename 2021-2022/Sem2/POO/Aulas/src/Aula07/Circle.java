package Aula07;

public class Circle extends Forma {
    public int r;
    public String cor;

    public Circle(int r, String colour) {
        super(type, colour);
        this.r = r;
        this.cor = colour;
    }

    public void set(int r) {
        if (r >= 0) {
            this.r = r;
        }
        else {
            System.out.println("Raio iválido!!");
        }
        return;
    }

    public void cor(String cor) {
        this.cor = cor;
        return;
    }

    public String get() {
        return Integer.toString(this.r) + cor;
    }

    public String toString() {
        System.out.println("_____________");
        System.out.print("Tipo      > ");
        System.out.println("Circle");
        System.out.print("Cor       > ");
        System.out.println(this.cor);
        System.out.print("Raio      > ");
        System.out.println(this.r);
        System.out.print("Área      > ");
        System.out.println(area());
        System.out.print("Perimetro > ");
        System.out.println(perimeter());
        System.out.println("_____________");
        return "Circle";
    }

    public double area() {
        return Math.pow(this.r, 2) * Math.PI;
    }

    public double perimeter() {
        return this.r * 2 * Math.PI;
    }
}
