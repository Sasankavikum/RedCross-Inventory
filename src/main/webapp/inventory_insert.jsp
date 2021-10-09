<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/redcrossdb";
String userId = "root";
String password = "";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="css/inventory_insert.css">
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/footer.css">
	
	<hr>
	
		<ul class="one" position=fixed;>
		
			<li><lable style="font-size:30px;">Red Cross</lable></li>
			<li><a href="#">Home</a></li>
			<li><a href="#">Employees</a></li>
			<li><a href="#">Members</a></li>
			<li><a href="#">Vaccine</a></li>
			<li><a href="#">Hospital</a></li>
			<li><a href="#">Uber Central</a></li>
			<li><a href="inventory_login.jsp">Inventory</a></li>
			<li><a href="#">KOBO</a></li>
			<li><a href="#">Complaints & Suggestions</a></li>
			
		</ul>
	

</head>
<body>
	<script src="InventoryJS/inventory.js"></script>
	<div class="container">
	<h1>Add New Item</h1>
		<form action="insert" method="post">
  	<div class="row">
    <div class="col-25">
      	<label for="fname">Item Name</label>
    	</div>
    	<div class="col-75">
      		<select id="name" name="name">
        		<option value="mask">Mask</option>
        		<option value="gloves">Gloves</option>
        		<option value="sanitizer">Sanitizer</option>
        		<option value="ppekit">PPE kit</option>
        		<option value="jackets">Jackets</option>
        		<option value="caps">Caps</option>
        		<option value="soap">Soap</option>
        		<option value="dress">Dress</option>
      		</select>
    </div>
  	</div>
  	<div class="row">
    <div class="col-25">
      	<label for="lname">Shop Purchased</label>
   		</div>
    	<div class="col-75">
      		<input type="text" name="shop" required>
    </div>
  	</div>
  	<div class="row">
    <div class="col-25">
      	<label for="fname">Date</label>
    	</div>
    	<div class="col-75">
      		<input type="date" name="date" id="dateWithMax" required>
      		<script>
				var today = new Date();
				var dd = today.getDate();
				var mm = today.getMonth() + 1; //January is 0!
				var yyyy = today.getFullYear();

				if (dd < 10) {
   					dd = '0' + dd;
				}

				if (mm < 10) {
  	 				mm = '0' + mm;
				} 
    
				today = yyyy + '-' + mm + '-' + dd;
				document.getElementById("dateWithMax").setAttribute("max", today);
			</script>
    </div>
  	</div>
  	
  	<div class="row">
    <div class="col-25">
      	<label for="lname">Quantity</label>
   		</div>
    	<div class="col-75">
      		<input type="number" name="quantity" min="1" required>
    </div>
  	</div>
  	

  	
  	<div class="row">
    <div class="col-25">
      	<label for="fname">Inserted By</label>
    	</div>
    	<div class="col-75">
      		<select id="name" name="user">
      		<%
				try{ 
					connection = DriverManager.getConnection(connectionUrl, userId, password);
					statement=connection.createStatement();
					String sql ="SELECT * FROM customer";
					
					resultSet = statement.executeQuery(sql);
					while(resultSet.next()){
					%>
  	
        		<option value="<%=resultSet.getString("name") %>"><%=resultSet.getString("name") %></option>
        		
        		<% 
				}
				
				} catch (Exception e) {
				e.printStackTrace();
				}
				%>
        		
      		</select>
    </div>
  	</div>

  
  	<div class="row">
  		<br><input type="checkbox" id="check" onclick="enablesubmit()">Inserted date Correctly 
    	<input type="submit" name="submit" id="subb" value="Add New Item" disabled>
 	 </div>
  	</form>
</div>
	<a href="inventoryunit_view.jsp"><button class="btnnext" style=background-color:green;>To Edit Unit Price List</button></a>
	<br><br><br><br><br><br>

</body>
</html>