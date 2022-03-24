package Aula03;

import java.util.*;
import java.util.List;
import java.util.ArrayList;
import java.util.Scanner;

public class Ex04 {
    public static void main(String[] args) {

        int newN, maxN, minN, medN = 0;

        List<Integer> nums = new ArrayList<Integer>();
        
		Scanner sc = new Scanner(System.in);

        do {
		    System.out.print("Insira um número >");
		    newN = sc.nextInt();
            nums.add(newN);
            medN += newN;
        } while(nums.get(0) != nums.get(nums.size() - 1) || medN == newN);

        maxN = Collections.max(nums, null);
        minN = Collections.min(nums, null);



        medN = medN / (nums.size() - 1);


        System.out.println("");
        System.out.println(" | -- Min -- | -- Max -- | -- Med -- |");
		System.out.println(" Min >" + minN);
		System.out.println(" Max >" + maxN);
		System.out.println(" Med >" + medN);

        sc.close();
    }    
}
