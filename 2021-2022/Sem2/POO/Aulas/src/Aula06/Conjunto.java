package Aula06;

import java.util.*;

public class Conjunto {
    private List<Integer> intList;

    public Conjunto() {
        this.intList = new ArrayList<Integer>();
    }

    public Conjunto(List<Integer> intList) {
        this.intList = new ArrayList<Integer>(intList);
    }

    void insert(int n) {
        if (!this.intList.contains(n)) {
            this.intList.add(n);
        }
    }

    boolean contains(int n) {
        return this.intList.contains(n);
    }

    void remove(int n) {
        for (int i = 0; i < this.intList.size(); i++) {
            if (this.intList.get(i) == n) {
                this.intList.remove(i);
            }
        }
    }

    void empty() {
        this.intList = new ArrayList<Integer>();
    }

    @Override public String toString() {
        String StringList = " | ";

        for (int i = 0; i < this.intList.size(); i++) {
            StringList += this.intList.get(i) + " | "; 
        }

        return StringList;
    }

    int size() {
        return this.intList.size();
    }

    int get(int n) {
        return this.intList.get(n);
    }

    Conjunto combine(Conjunto addConj) {
        Conjunto ConjFinal = new Conjunto(this.intList);

        for (int x = 0; x < addConj.size(); x++) {
            if (!ConjFinal.contains(addConj.get(x))) {
                ConjFinal.insert(addConj.get(x));
            }
        }

        return ConjFinal;
    }

    Conjunto subtract(Conjunto diffConj) {
        Conjunto ConjFinal = new Conjunto();

        for (int y = 0; y < this.intList.size(); y++) {
            if (!diffConj.contains(this.intList.get(y))) {
                ConjFinal.insert(this.intList.get(y));
            }
        }


        return ConjFinal;
    }

    Conjunto intersect(Conjunto interConj) {
        Conjunto ConjFinal = new Conjunto();

        for (int x = 0; x < interConj.size(); x++) {
            if (this.intList.contains(interConj.get(x))) {
                ConjFinal.insert(interConj.get(x));
            }
        }

        return ConjFinal;
    }
}
