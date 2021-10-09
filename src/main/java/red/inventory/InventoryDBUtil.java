package red.inventory;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class InventoryDBUtil {
	
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	public static boolean insertcustomer(String name, String shop, String date, int quantity, String user, double total) {
    	
    	boolean isSuccess = false;
    	
    	try {
    		//database call
    		con = dbconnect.getConnection();
    		stmt = con.createStatement();
    		double unitPrice=0;
    		
    		//get the unit price from the item list
    		String sql1 = "SELECT unit FROM inventory_item WHERE name = '"+name+"' limit 1";
    		ResultSet unit1 = stmt.executeQuery(sql1);
		if(unit1.next()) 
			unitPrice = unit1.getDouble(1);
    		double total1 = unitPrice*quantity;
    		
    	    String sql = "insert into inventory_all values (0,'"+name+"','"+shop+"','"+date+"','"+quantity+"','"+user+"','"+total1+"')";
    		int rs = stmt.executeUpdate(sql);
    		
    		if(rs > 0) {
    			isSuccess = true;
    		} else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
 	
    	return isSuccess;
    }
	
	public static boolean insertcustomer1(String name, int quantity, double total) {
    	
    	boolean isSuccess = false;
    	
    	
    	try {
    		
    		con = dbconnect.getConnection();
    		stmt = con.createStatement();
    		double unitPrice=0;
    		String sql1 = "SELECT unit FROM inventory_item WHERE name = '"+name+"' limit 1";
    		ResultSet unit1 = stmt.executeQuery(sql1);
		if(unit1.next()) 
			unitPrice = unit1.getDouble(1);
    		double total1 = unitPrice*quantity;
		
    	    String sql = "update inventory_item set quantity=quantity+'"+quantity+"' where name='"+name+"'";
    	    String sql2 = "update inventory_item set total=total+'"+total1+"' where name='"+name+"'";
    		int rs = stmt.executeUpdate(sql);
    		int rs1 = stmt.executeUpdate(sql2);
    		
    		if(rs > 0) {
    			isSuccess = true;
    		} else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
 	
    	return isSuccess;
    }
	
	public static boolean updatecustomer1(String id, String name, double unit) {
    	
    	try {
    		
    		con = dbconnect.getConnection();
    		stmt = con.createStatement();
    		
    		String sql = "update inventory_item set name='"+name+"',unit='"+unit+"'"
    				+ "where id='"+id+"'";
    		int rs = stmt.executeUpdate(sql);

    		
    		if(rs > 0) {
    			isSuccess = true;
    		}
    		else {
    			isSuccess = false;
    		}
    		
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return isSuccess;
    }
	
	public static boolean updatecustomer(String id, String name, int quantity) {
    	
    	try {
    		
    		con = dbconnect.getConnection();
    		stmt = con.createStatement();
    		double unitPrice=0;
    		String sql1 = "SELECT unit FROM inventory_item WHERE name = '"+name+"' limit 1";
    		ResultSet unit1 = stmt.executeQuery(sql1);
		if(unit1.next()) 
			unitPrice = unit1.getDouble(1);
		
		
    		double total1 = unitPrice*quantity;
    		System.out.println(total1);
    		System.out.println("fsefwsfgwfg");
    		String sql = "update inventory_item set quantity=quantity-'"+quantity+"' where name='"+name+"'";
    		String sql2 = "update inventory_item set total=total-'"+total1+"' where name='"+name+"'";
    		int rs = stmt.executeUpdate(sql);
    		int rs1 = stmt.executeUpdate(sql2);
    		
    		if(rs > 0) {
    			isSuccess = true;
    		}
    		else {
    			isSuccess = false;
    		}
    		
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return isSuccess;
    }
	
	public static List<Inventory> getCustomerDetails(String Id) {
    	
    	int convertedID = Integer.parseInt(Id);
    	
    	ArrayList<Inventory> cus = new ArrayList<>();
    	
    	try {
    		
    		con = dbconnect.getConnection();
    		stmt = con.createStatement();
    		String sql = "select * from inventory_all where id='"+convertedID+"'";
    		rs = stmt.executeQuery(sql);
    		
    		while(rs.next()) {
    			int id = rs.getInt(1);
    			String name = rs.getString(2);
    			String shop = rs.getString(3);
    			String date = rs.getString(4);
    			int quantity = rs.getInt(6);
    			String user = rs.getString(7);
    			double total = rs.getDouble(8);
    			
    			Inventory c = new Inventory(id,name,shop,date,quantity,user,total);
    			cus.add(c);
    		}
    		
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}	
    	return cus;	
    }
    
    

	public static boolean deleteInventory(String id) {
		int convId = Integer.parseInt(id);

    	
    	try {
    		
    		con = dbconnect.getConnection();
    		stmt = con.createStatement();
    		
    		String sql2 = "delete from inventory_all where id='"+convId+"'";
    		int r = stmt.executeUpdate(sql2);
    		
    		if (r > 0) {
    			isSuccess = true;
    		}
    		else {
    			isSuccess = false;
    		}
    		
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}
    	
    	return isSuccess;
	}
	
	public static ArrayList<Invent> getAllInventory1() {
		ArrayList<Invent> invent = new ArrayList<Invent>();
		
		try {
			//database connection
			 String url ="jdbc:mysql://localhost:3306/redcrossdb"; //my sql location
			 String user ="root";
		     String pass = "";
		     
		     Class.forName("com.mysql.jdbc.Driver");//create driver
				Connection con = DriverManager.getConnection(url , user , pass);// create db connections
				java.sql.Statement stmt = con.createStatement();
				
				String sql = "select * from redcrossdb.inventory_item;";
				
				ResultSet rs = stmt.executeQuery(sql);
				
				while(rs.next()) {  //variables for catch the values
					
					int id = rs.getInt(1);
					String name = rs.getString(2);
					int quantity=rs.getInt(3);
					double unit=rs.getDouble(4);
					double total=rs.getDouble(5);
					
				
					Invent cus = new Invent(id,name,quantity,unit,total);// customer object
					
					
					invent.add(cus); //customer ArrayList
				
				}
		     
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return invent;
	}

}
