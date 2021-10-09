package red.inventory;

public class Invent {
	
	private int id;
	 private String name;
	 private int quantity;
	 private double unit;
	 private double total;
	 
	 public Invent(int id, String name, int quantity, double unit, double total) {
		 this.id = id;
		 this.name = name;
		 this.quantity = quantity;
		 this.unit = unit;	 }
	 
	 public int getId() {
		 return id;
	 }

	 public String getName() {
		 return name;
	 }

	 public int getQuantity() {
		 return quantity;
	 }
	 
	 public double getUnit() {
		 return unit;
	 }
	 
	 public double getTotal() {
		 return total;
	 }

}
