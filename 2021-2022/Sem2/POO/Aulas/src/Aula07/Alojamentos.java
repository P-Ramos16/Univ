package Aula07;

public abstract class Alojamentos extends Agencia {
    
    public String alojName;
    public String alojCode;
    public String alojAddress;
    public Double alojPrice;
    public Boolean alojReserved;
    public Double alojReview;


    public Alojamentos(String aName, String aCode, String aAddress, Double aPrice, Boolean aReserved, Double aReview) {
        super();
        alojName = aName;
        alojCode = aCode;
        alojAddress = aAddress;
        alojPrice = aPrice;
        alojReserved = aReserved;
        alojReview = aReview;
    }

    public void request() {
        if (!alojReserved) {
            alojReserved = true;
        }
    }

    public void recieve() {
        if (alojReserved) {
            alojReserved = false;
        }
    }
    
    public abstract void set(String alojName, String alojCode, String alojAddString, Double alojPrice, Boolean alojReserved, Double alojReviDouble);

    public String get() {
        return alojName; 
    }
    public String print() {
        return "Alojamento: " + alojName + " " + "Code: " + alojCode + " " + "Address: " + alojAddress + " " + "Price: " + alojPrice + " " + "Reserved: " + alojReserved + " " + "Review: " + alojReview; 
    }
}
