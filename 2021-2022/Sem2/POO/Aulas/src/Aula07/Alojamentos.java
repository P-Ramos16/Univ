package Aula07;

public abstract class Alojamentos extends Agencia {
    
    private String alojType;
    private String alojName;
    private String alojCode;
    private String alojAddress;
    private Double alojPrice;
    private Boolean alojReserved;
    private Double alojReview;


    public Alojamentos(String aType, String aName, String aCode, String aAddress, Double aPrice, Boolean aReserved, Double aReview) {
        super();
        alojType = aType;
        alojName = aName;
        alojCode = aCode;
        alojAddress = aAddress;
        alojPrice = aPrice;
        alojReserved = aReserved;
        alojReview = aReview;
    }
    
    public abstract void set(String alojType, String alojName, String alojCode, String alojAddString, Double alojPrice, Boolean alojReserved, Double alojReviDouble);

    public String get() {
        return alojName; 
    }
    public String print() {
        return "Tipo: " + alojType + " Alojamento: " + alojName + " " + "Code: " + alojCode + " " + "Address: " + alojAddress + " " + "Price: " + alojPrice + " " + "Reserved: " + alojReserved + " " + "Review: " + alojReview; 
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
}
