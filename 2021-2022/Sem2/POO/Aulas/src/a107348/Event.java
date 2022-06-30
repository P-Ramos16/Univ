package a107348;

import java.util.*;
import java.time.LocalDate;

public class Event implements IEvent {
    private LocalDate data;
    private ArrayList<Activity> atividades;
    private static boolean cateringIn;

    public Event(LocalDate date) {
        atividades = new ArrayList<>();
        this.data = date;
        cateringIn = false;
    }


    public Event addActivity(Activity act) {

        if (act.getClass().equals("Catering")) {
            if (cateringIn) {
                return null;
            }
            cateringIn = true;
        }

        atividades.add(act);
        return this;
    }

    @Override
    public LocalDate getDate() {
        return data;
    }

    public double totalPrice() {
        double totalPrice = 0;
        for (Activity act : atividades) {
            totalPrice += act.getPreco() * act.getNumParti();
        }
        return totalPrice;
    }

    public String getActi() {
        String tempStr = "";
        for (Activity act : atividades) {
            tempStr += act.toString();
        }
        return tempStr;
    }

}
