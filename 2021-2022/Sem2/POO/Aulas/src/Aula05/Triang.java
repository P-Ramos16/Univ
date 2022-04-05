package Aula05;

public class Triang {
    private int[] l;

    public Triang(int l1, int l2, int l3) {
        this.l[0] = l1;
        this.l[1] = l2;
        this.l[2] = l3;
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

    public String get() {
        return Integer.toString(this.l[0]) + Integer.toString(this.l[1]) + Integer.toString(this.l[2]);
    }

    public String toString() {
        System.out.print("Tipo      > ");
        System.out.println("Triangulo");
        System.out.print("Área      > ");
        System.out.println(area());
        System.out.print("Perimetro > ");
        System.out.println(perimeter());
        return "Triangle";
    }

    public double area() {
        int p = perimeter() / 2;
        double area = Math.sqrt(p * (p-l[0]) * (p-l[1]) * (p-l[2]));
        return area;
    }

    public int perimeter() {
        return l[0] + l[1] + l[2];
    }

}
