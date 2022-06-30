package ExamP_2020;

import java.util.*;

public class compareDescs implements Comparator<Produto>
{
    public int compare(Produto s1, Produto s2)
    {
        return s1.getDescricao().compareTo(s2.getDescricao());
    }
}