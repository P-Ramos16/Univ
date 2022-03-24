package Aula01;

public class Ex04 {
    public static void main(String[] args) {
		recursivoSimples(100);
	}

	public static void recursivoSimples(int x) {
		System.out.println(x);
		x--;
		if (x>0) 
			recursivoSimples(x);
	}
}
