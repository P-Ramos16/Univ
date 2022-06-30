package a107348;

public class Client implements Comparable<Client> {
    private String nome, localidade;
    private Integer num;
    private static int id = 0;
    
    public Client(String name, String local) {
        this.nome = name;
        this.localidade = local;
        this.num = id;
        id++;
    }

    public String getNome() {
        return nome;
    }

    public String getLocal() {
        return localidade;
    }

    public Integer getNum() {
        return num;
    }

    public int compareTo(Client obj) {
        return this.num.compareTo(obj.getNum());
    }

}
