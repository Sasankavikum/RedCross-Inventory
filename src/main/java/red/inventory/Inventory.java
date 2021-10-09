package red.inventory;

public class Inventory {
	
	private int id;
    private String name;
    private String shop;
    private String date;
    private int quantity;
    private String user;
    private double total;
    
    public Inventory(int id, String name, String shop, String date, 
    		 int quantity, String user, double total) {
	this.id = id;
	this.name = name;
	this.shop = shop;
	this.date = date;
	this.quantity = quantity;
	this.user = user;
	this.total = total;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getShop() {
        return shop;
    }

    public String getDate() {
        return date;
    }


    public int getQuantity() {
        return quantity;
    } 
    
    public String getUser() {
        return user;
    }
    
    public double getTotal() {
        return total;
    }

}
