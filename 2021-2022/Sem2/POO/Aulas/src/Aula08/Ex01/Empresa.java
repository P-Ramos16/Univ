package Aula08.Ex01;

import java.util.*;

public class Empresa {
    public String empresaNome;
    public String empresapostal;
    public String empresaEmail;

    public ArrayList<VeiculoMotorizado> VeiculoList = new ArrayList<VeiculoMotorizado>();

    public Empresa(String nome, String postal, String email) {
        empresaNome = nome;
        empresapostal = postal;
        empresaEmail = email;
    }

    public void addVeiculos(VeiculoMotorizado veiculo) {
        VeiculoList.add(veiculo);
    }
    
    public void setTrajeto(String veic, int km) {
        for (int i = 0; i < VeiculoList.size(); i++) {
            if (VeiculoList.get(i).get().equals(veic)) {
                VeiculoList.get(i).trajeto(km);
                return;
            }
        }
        System.out.println("ERRO: Veiculo não existe!!");        
    }

    public int lastTrajeto(String veic) {
        for (int i = 0; i < VeiculoList.size(); i++) {
            if (VeiculoList.get(i).get().equals(veic)) {        
                return VeiculoList.get(i).ultimoTrajeto();
            }
        }
        System.out.println("ERRO: Veiculo não existe!!");     
        return 0;   
    }

    public int distanciaTotal(String veic) {
        for (int i = 0; i < VeiculoList.size(); i++) {
            if (VeiculoList.get(i).get().equals(veic)) {        
                return VeiculoList.get(i).distanciaTotal();
            }
        }
        System.out.println("ERRO: Veiculo não existe!!");     
        return 0;   
    }

    public boolean compareVeic(String veic0, String veic1) {
        int nv0 = 0;
        int nv1 = 0;

        for (int i = 0; i < VeiculoList.size(); i++) {
            if (VeiculoList.get(i).get().equals(veic0)) {        
                nv0 = i;
            }
            else if (VeiculoList.get(i).get().equals(veic1)) {
                nv1 = i;
            }
        }
        return VeiculoList.get(nv0).getModel().equals(VeiculoList.get(nv1).getModel()) ? true: false;
    }

    public String mostKM() {

        int mostKm = VeiculoList.get(0).getKm();
        int n = 0;

        for (int i = 0; i < VeiculoList.size(); i++) {
            if (VeiculoList.get(i).getKm() > mostKm) {        
                mostKm = VeiculoList.get(i).getKm();
                n = i;
            }
        }  
        return VeiculoList.get(n).toString();   
    }

    public void carregar(String veic, int batt) {

        int n = 0;

        for (int i = 0; i < VeiculoList.size(); i++) {
            if (VeiculoList.get(i).get().equals(veic)) {     
                n = i;
            }
        }

        if (VeiculoList.get(n) instanceof LigeiroEletrico || VeiculoList.get(n) instanceof PesPassageirosEletrico ) {
            VeiculoList.get(n).carregar(batt);
        }

        else {
            System.out.println("Erro: Esse veiculo não é eletrico!!");
        }
    }

    public VeiculoMotorizado getVeic(String veic) {
        for (int i = 0; i < VeiculoList.size(); i++) {
            if (VeiculoList.get(i).get() == veic) {
                return  VeiculoList.get(i);
            }
        }
        
        return VeiculoList.get(0);
    }

    public String get() {
        return "Nome: " + empresaNome + " Cód.Postal: " + empresapostal + " Email: " + empresaEmail;
    }

    public void print() {
        for (int i = 0; i < VeiculoList.size(); i++) {
            System.out.println(VeiculoList.get(i).toString());
        }
    }
}
