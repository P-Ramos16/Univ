package Aula07;

import java.util.Scanner;

public class Hotel extends Alojamentos {
    
    public String alojName;
    public String alojCode;
    public String alojAddress;
    public Double alojPrice;
    public Boolean alojReserved;
    public Double alojReview;
    private String hotelType;
    
    public Hotel(String alojName, String alojCode, String alojAddress, Double alojPrice, Boolean alojReserved, Double alojReview) {
        super(alojName, alojCode, alojAddress, alojPrice, alojReserved, alojReview);
    }

    public void set(String aName, String aCode, String aAddress, Double aPrice, Boolean aReserved, Double aReview) {
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
        System.out.println(" Insert Hotel Type:");
        System.out.print("      > ");
        String type = sc.nextLine();
        type = sc.nextLine();
        hotelType = type;
        sc.close();
    }
    

    public String get() {
        return "Apartamento: " + alojName + " " + "Room Type: " + hotelType + " " + "Code: " + alojCode + " " + "Address: " + alojAddress + " " + "Price: " + alojPrice + " " + "Reserved: " + alojReserved + " " + "Review: " + alojReview; 
    }
}
