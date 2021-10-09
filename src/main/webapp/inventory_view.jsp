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
	<title>View All and Delete</title>
	
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/footer.css">
	<link rel="stylesheet" type="text/css" href="css/inventory_view.css">	

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
	<h1 align="center"><font><strong>View All and Delete</strong></font></h1>

	<div class="headline headline-md"><h3>Search By Item Name  :</h3></div>
	<form method="post" action="Inventory_Search" name="frm" >
    
    <input type="text" name="name" class="form-control" placeholder="Search">
    <input class="submit" style=background-color:green; type="submit" name="submit" value="Search" >
	</form>
	<style>

	.headline-md,h2,form{
       display:inline-block !important;
    }

    .headline-md{
    width:200px !important;
    margin-right:1px !important;
    }
	</style>
	
	<table id="view" border="2">
	<tr></tr>

		<td><b>Number</b></td>
		<td><b>Item Name</b></td>
		<td><b>Shop Name</b></td>
		<td><b>Date</b></td>
		<td><b>Quantity</b></td>
		<td><b>Entered By</b></td>
		<td><b>Total</b></td>
		<td><b>Delete</b></td>
	</tr>
	

<%
try{ 
connection = DriverManager.getConnection(connectionUrl, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM inventory_all";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>


<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("shop") %></td>
<td><%=resultSet.getString("date") %></td>
<td><%=resultSet.getString("quantity") %></td>
<td><%=resultSet.getString("user") %></td>
<td><%=resultSet.getString("total") %></td>
<td><a href="inventory_delete.jsp?id=<%=resultSet.getString("id")%>&name=<%=resultSet.getString("name")%>&quantity=<%=resultSet.getString("quantity")%>">Delete</a></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<br>
<div>

	<div class="headline headline-m"><h3>Enter Month :</h3></div>
		<form name="RE_month" action="InventoryAllPrint.jsp" method="post">	
			<select name="Month" id="Month">
			
 				<option value="2021-01">January</option>
  				<option value="2021-02">February</option>
                <option value="2021-03">March</option>
                <option value="2021-04">April</option>
                <option value="2021-05">May</option>
                <option value="2021-06">June </option>
                <option value="2021-07">July </option>
                <option value="2021-08">August</option>
                <option value="2021-09">September</option>
                <option value="2021-10">October </option>
                <option value="2021-11">November </option>
                <option value="2021-12">December</option>
            </select>
            
            <input class="submit" {background-color:green;} type="submit" name="submit" value="Submit" >           
		</form>
	<style>

	.headline-m,h2,form{
       display:inline-block !important;
    }

    .headline-m{
    width:150px !important;
    margin-right:1px !important;
    }
    
    
	</style>


	
	</style>
	
	</div>
<br><br><br>
</body>

</html>