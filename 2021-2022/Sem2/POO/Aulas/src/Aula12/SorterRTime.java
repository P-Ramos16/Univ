package Aula12;

import java.util.Comparator;

public class SorterRTime implements Comparator<Movie>{

    public int compare(Movie one, Movie another){
        return Integer.valueOf(one.getRunningTime()).compareTo(Integer.valueOf(another.getRunningTime()));
    }
}