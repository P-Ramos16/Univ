package Aula07;

import java.util.Scanner;

public class Apartamento extends Alojamentos {
    
    private String alojType;
    private String alojName;
    private String alojCode;
    private String alojAddress;
    private Double alojPrice;
    private Boolean alojReserved;
    private Double alojReview;
    private int apartRooms;
    
    public Apartamento(String alojType, String alojName, String alojCode, String alojAddress, Double alojPrice, Boolean alojReserved, Double alojReview) {
        super(alojType, alojName, alojCode, alojAddress, alojPrice, alojReserved, alojReview);
    }

    public void set(String aType, String aName, String aCode, String aAddress, Double aPrice, Boolean aReserved, Double aReview) {
        alojType = aType;
        alojName = aName;
        alojCode = aCode;
        alojAddress = aAddress;
        alojPrice = aPrice;
        alojReserved = aReserved;
        alojReview = 2.5;
        
        if (aReview >= 0 && aReview <= 5) {
            alojReview = aReview;
        }

        Scanner sc = new Scanner(System.in);
        System.out.println(" Insert Number of Rooms:");
        System.out.print("      > ");
        int numRooms = sc.nextInt();
        apartRooms = numRooms;
    }
}
