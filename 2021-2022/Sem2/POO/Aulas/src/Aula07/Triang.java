package Aula07;

public class Triang extends Forma {
    private int[] l = new int[3];
    public String cor;

    public Triang(int l1, int l2, int l3, String colour) {
        super(type, colour);
        this.l[0] = l1;
        this.l[1] = l2;
        this.l[2] = l3;
        this.cor = colour;
    }

    public void set(int l1, int l2, int l3) {
        if (l1 >= 0 && l2 >= 0 && l3 >= 0 &&
        (l1 + l2 != l3) && (l1 + l3 != l2) && (l2 + l3 != l1)) {
            this.l[0] = l1;
            this.l[1] = l2;
            this.l[2] = l3;
        }
        else {
            System.out.println("Lados iválido!!");
        }
    }

    public void cor(String cor) {
        this.cor = cor;
        return;
    }

    public String get() {
        return Integer.toString(this.l[0]) + Integer.toString(this.l[1]) + Integer.toString(this.l[2]) + cor;
    }

    public String toString() {
        System.out.println("_____________");
        System.out.print("Tipo      > ");
        System.out.println("Triangulo");
        System.out.print("Len1      > ");
        System.out.println(this.l[0]);
        System.out.print("Len2      > ");
        System.out.println(this.l[1]);
        System.out.print("Len3      > ");
        System.out.println(this.l[2]);
        System.out.print("Área      > ");
        System.out.println(area());
        System.out.print("Perimetro > ");
        System.out.println(perimeter());
        System.out.println("_____________");
        return "Triangle";
    }

    public double area() {
        double p = perimeter() / 2;
        double area = Math.sqrt(p * (p-l[0]) * (p-l[1]) * (p-l[2]));
        return area;
    }

    public double perimeter() {
        return l[0] + l[1] + l[2];
    }

}
