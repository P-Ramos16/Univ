package ExamP_2017.Ex2;

import java.io.*;
import java.nio.*;
import java.util.*;

import ExamP_2017.Ex2.TipoJogador;

public class RoboCopa {
	public static void main(String[] args) {
		RoboCopa exam = new RoboCopa();
		exam.parte1();
		exam.parte2();
	}

	private void parte1() {
		
		Bola bola = null;
		bola = new Bola(CorDaBola.Amarela);
		showOMStatus(bola);
		
		Equipa e1 = new Equipa("BeiraMar", "JJ");
		Robo r[] = {
				new Robo("Ron", TipoJogador.GuardaRedes, 5, 0),
				new Robo("Mes", TipoJogador.Avancado, 2, 40),
				new Robo("Pau", TipoJogador.Defesa, 7, 10),
				new Robo("Ema", TipoJogador.Medio, 5, 25),
				new Robo("Tim", TipoJogador.Medio, 1, 20) };
		for (ObjetoMovel o: r)
			showOMStatus(o);
		
		e1.add(r[0]);
		e1.add(r[1]);
		e1.add(r[2]);
		e1.add(r[1]);
		e1.add(r[3]);
		e1.add(r[4]);
		e1.remove(r[3]);
		System.out.print("-- " + e1);

		Equipa e2 = new Equipa("PortoDAveiro", "Lopes");
		e2.add(new Robo("Liu", TipoJogador.GuardaRedes, 5, 80));
		e2.add(new Robo("Min", TipoJogador.Avancado, 3, 10));
		e2.add(new Robo("Hus", TipoJogador.Defesa, 6, 70));
		e2.add(new Robo("Taw", TipoJogador.Medio, 5, 65));
		e2.add(new Robo("Taw", TipoJogador.Medio, 5, 65));
		System.out.print("-- " + e2);

		if(Bola.getnBolas() == 0)
			bola = new Bola(CorDaBola.Azul);
		else
			System.out.println("Já temos bola!");
		
		Jogo tacoataco = new Jogo(e1, e2, bola, 20);
		System.out.println("--- " + tacoataco);
	 	
		// simulação simples de movimentos e golos de uma equipa
		Robo[] r2 = e2.getRobos();
	 	r2[1].marcaGolo();
	 	r2[1].move(40, 40);
	 	r2[1].move(60, 40);
	 	r2[1].move(70, 40);
	 	r2[1].marcaGolo(); 
	 	r2[2].move(55, 55, 20);
	 	r2[3].move(40, 20);
	 	r2[3].move(60, 20);
	 	r2[3].move(70, 20);
	 	r2[3].marcaGolo(); 
	 	for (Robo rob: r)
	 		showRoboStatus(rob);
	 	
		System.out.println("Score: " + e1.getGolosMarcados() + " - "+e2.getGolosMarcados());
	}

	private void showOMStatus(ObjetoMovel om) {
		System.out.printf("OM: %3d %3d %3d %5.1f\n", om.getX(), om.getY(), om.getVelocidade(), om.getDistancia());
	}

	private void showRoboStatus(Robo rob) {
		System.out.printf("%-10s %-15s %3d %3d %3d %5.1f %3d\n", rob.getId(), rob.getTipo(), 
 				rob.getX(), rob.getY(), rob.getVelocidade(), rob.getDistancia(), rob.getGolos());
	}
	
	private void parte2() {

		TreeSet<String> equipasNames = new TreeSet<String>();
		ArrayList<Equipa> equipas = new ArrayList<Equipa>(); 

		File fPath = new File("src/ExamP_2017/Ex2/robos.txt");
		try {
			Scanner file = new Scanner(fPath);

			if(file.hasNextLine()) { // Skip First Line
				file.nextLine();
			}

			while(file.hasNextLine()) {
				String[] words = file.nextLine().split("[\t]");
				
				TipoJogador tempType;
				switch(words[2]) {
					case("Defesa"):
						tempType = TipoJogador.Defesa;
						break;
					case("Avançado"):
						tempType = TipoJogador.Avancado;
						break;
					case("Médio"):
						tempType = TipoJogador.Medio;
						break;
					default:
						tempType = TipoJogador.GuardaRedes;
						break;
				}

				if(!equipasNames.contains(words[1])) {
					equipasNames.add(words[1]);
					Equipa tempE = new Equipa(words[1], "unknown");

					tempE.add(new Robo(words[0], tempType, 0, 0));
					equipas.add(tempE);
				}

				else {
					for (Equipa tempE : equipas) {
						if (tempE.getName().equals(words[1])) {
							tempE.add(new Robo(words[0], tempType, 0, 0));
						}
					}
				}

			}

			System.out.println("Lista de euipas (" + equipas.size() + "equipas)");
			for (Equipa tempE : equipas) {
				System.out.println(tempE);
			}
			System.out.println();

			file.close();
		}
		catch(FileNotFoundException e) {
			System.out.println("ERRO! Ficheiro não existente");
		}
	}
	

}
