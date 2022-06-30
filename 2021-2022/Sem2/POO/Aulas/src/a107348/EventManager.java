package a107348;

import java.time.LocalDate;
import java.util.*;

public class EventManager {
    private String nome;
    private Set<String> clientes;
    private TreeMap<Client, LinkedList<Event>> atividades;

    public EventManager(String name) {
        clientes = new TreeSet<>();
        atividades = new TreeMap<>();
        this.nome = name;
    }

    public Client addClient(String name, String local) {

        if (clientes.contains(name)) {
            return null;
        }


        Client tempCl = new Client(name, local);
        clientes.add(name);

        return tempCl;
    }

    public Event addEvent(Client cl, LocalDate date) {

        Event tempEvent = new Event(date);
        
        if (atividades.containsKey(cl)) {
            atividades.get(cl).add(tempEvent);
        }
        else {
            LinkedList<Event> tempArray = new LinkedList<>();
            tempArray.add(tempEvent);
            atividades.put(cl, tempArray);
        }

        return tempEvent;
    }

    public String listClients() {
        String tempStr = "Clientes: \n";
        for (Client cl : atividades.keySet()) {
            tempStr += cl.getNome() + "[" + cl.getLocal() + "]\n";
        }
        return tempStr;
    }

    public String listEvents() {
        String tempStr = "Eventos: \n";

        for (Map.Entry<Client, LinkedList<Event>> entry : atividades.entrySet()) {

            Client key = entry.getKey();
            LinkedList<Event> values = entry.getValue();

            tempStr += key.getNome() + " [" + key.getLocal() + "]\n";

            for (Event eve : values) {
                tempStr += "*** Evento em " + eve.getDate() + ", total = " + eve.totalPrice() + "euros \n";
                tempStr += eve.getActi();

            }


        }

        return tempStr;
    }
}
