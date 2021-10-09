<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/redcrossdb";
String userid = "root";
String password = "";

try {
	Class.forName(driver);
} 
catch (ClassNotFoundException e) {
	e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<%
try{
	connection = DriverManager.getConnection(connectionUrl, userid, password);
	statement=connection.createStatement();
	String sql ="select * from inventory_item where id="+id;
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Stock Out</title>
	
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/footer.css">
	<link rel="stylesheet" type="text/css" href="css/inventory_update.css">	

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
	<div class="container">
	<h1>Stock Out</h1>
	
  	<form action="update" method="post">
  	<input type="hidden" name="cusid" value="<%=resultSet.getString("id") %>">
  	<div class="row">
    <div class="col-25">
      	<label for="fname">Item Number</label>
    	</div>
    	<div class="col-75">
      		<input type="text" name="id"  value="<%=resultSet.getString("id") %>" readonly >
    </div>
  	</div>
  	
  	<div class="row">
    <div class="col-25">
      	<label for="fname">Item Name</label>
    	</div>
    	<div class="col-75">
      		<input type="text" name="name" value="<%=resultSet.getString("name") %>" readonly> 
    </div>
  	</div>
  	
  	<div class="row">
    <div class="col-25">
      	<label for="lname">Quantity</label>
   		</div>
    	<div class="col-75">
      		<input type="number" name="quantity" max="<%=resultSet.getString("quantity") %>"  value="<%=resultSet.getString("quantity") %>"> 
    </div>
  	</div>

  	
  	<div class="row">
    	<input type="submit" value="Update The Item">
 	 </div>
	
	</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>