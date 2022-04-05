package Aula05;

public class Rect {
    private int[] comp_alt = new int[2];

    public Rect(int c, int h) {
        this.comp_alt[0] = c;
        this.comp_alt[1] = h;
    }

    public void set(int c, int h) {
        if (c >= 0 && h >= 0) {
            this.comp_alt[0] = c;
            this.comp_alt[1] = h;
        }
        else {
            System.out.println("Comp/Alt iválido!!");
        }
    }

    public String get() {
        return Integer.toString(this.comp_alt[0]) + Integer.toString(this.comp_alt[1]);
    }

    public String toString() {
        System.out.println("_____________");
        System.out.print("Tipo      > ");
        System.out.println("Rectangle");
        System.out.print("Length    > ");
        System.out.println(this.comp_alt[0]);
        System.out.print("Heigth    > ");
        System.out.println(this.comp_alt[1]);
        System.out.print("Área      > ");
        System.out.println(area());
        System.out.print("Perimetro > ");
        System.out.println(perimeter());
        System.out.println("_____________");
        return "Circle";
    }

    public int area() {
        return comp_alt[0] * comp_alt[1];
    }

    public int perimeter() {
        return comp_alt[0] + comp_alt[1];
    }

}
