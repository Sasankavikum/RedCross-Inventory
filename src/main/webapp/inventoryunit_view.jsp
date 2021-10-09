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
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Inventory Unit Price View</title>
	
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/footer.css">
	<link rel="stylesheet" type="text/css" href="css/inventoryunit_view.css">	

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
	<h1 align="center"><font><strong>Inventory Unit Price List</strong></font></h1>
	<div id="btn">
		<a href="inventory_login.jsp"><button class="btnback" align="right">Back</button></a>
	</div>
	
	<table border="2">
	<tr></tr>

		<th>Number</td>
		<th>Item Name</td>
		<th>Unit Price</td>
		<th>Update</td>
	</tr>
	

<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM inventory_item";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>


<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("unit") %></td>
<td><a href="inventoryunit_update.jsp?id=<%=resultSet.getString("id")%>">Update</a></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

</body>

</html>