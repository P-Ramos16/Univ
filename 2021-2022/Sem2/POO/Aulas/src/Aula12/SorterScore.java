package Aula12;

import java.util.Comparator;

public class SorterScore implements Comparator<Movie>{

    public int compare(Movie one, Movie another){
        return one.getScore().compareTo(another.getScore());
    }
}