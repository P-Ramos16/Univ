package a107348;

import java.util.*;

public class compareCli implements Comparator<Client>
{
    public int compare(Client s1, Client s2)
    {
        return s1.getNum().compareTo(s2.getNum());
    }
}