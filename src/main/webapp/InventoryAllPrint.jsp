<%@page import="com.mysql.fabric.xmlrpc.base.Data"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import ="java.util.Date" %>




<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "redcrossdb";
String userid = "root";
String password = "";
try {
	Class.forName(driver);
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}
Connection connection = null;
Statement statement = null;

ResultSet resultSet = null;
ResultSet resultSet1 = null;
%>

<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>

<meta charset="ISO-8859-1">
<title>Patients Report</title>

<script src="JavaScriptSources/St_search.js"></script>




<style>
table {
    border-collapse: collapse;
 	}
  
th, td {
    border: 2px solid black;
    padding: 10px;
    text-align: left;
  	}
  
.back{
  
  	background-color:  	#D3D3D3;
	}
  
  
fieldset{	
	margin:50px 20px 20px 20px;
	width: 70%;
	border-color:black;
	border-radius: 10px;	
	background-color:#F8F8F8;
	}
	
.button2 {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	}
 
</style>

</head>
<body>
	<!-- header -->
	<div class="header">
	</div>

	<!-- <br><br>-->
<center>

<fieldset> 
	<center>

	</center>
	<!-- table -->
	<br>
	<br>

<div id="list">

		<center>
			<img alt="" src="images/redcross.png" width="30%" height="30%">
		</center>

  
<center>
<p style="width: 50%;margin:0% 5%">Date&Time:<%=new Date().toString()%> </p>
	<table>
	
	<h1>All Inventory</h1>
		<tr >
		    <th><h3>ID<h3></th>
			<th><h3>Inventory Name<h3></th>
			<th><h3>Shop Purchased<h3></th>
			<th><h3>Date<h3></th>
			<th><h3>Quantity<h3></th>
			<th><h3>Total<h3></th>

		</tr>
		
		<br>

			<br><br>
			

		<%
		try {
			String month = request.getParameter("Month");

			connection = DriverManager.getConnection(connectionUrl + database, userid, password);
			statement = connection.createStatement();
			
		
			String sql = "select *  from inventory_all where date like '"+month+"%'";
			resultSet = statement.executeQuery(sql);
				

			while (resultSet.next()) {

		%>
		<tr>
			<td><%=resultSet.getString("id")%></td>
			<td><%=resultSet.getString("name")%></td>
			<td><%=resultSet.getString("shop")%></td>
			<td><%=resultSet.getString("date")%></td>
			<td><%=resultSet.getString("quantity")%></td>
			<td><%=resultSet.getString("total")%></td>
		</tr> 
		<%
		}
	
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>

	</table>
	<br><br>
	
			<div class="row mt-4">
			<div class="col-md-12">
				<p class="font-weight-bold m-0 p-0 mt-1 ml-5">Prepaired By: ................................................ </p>
				<p class="font-weight-bold m-0 p-0 mt-1 ml-5">Prepaired Date: ................................................ </p>
			</div>

	</center>
  </div> 

	<br>
	
</fieldset> 

<button onclick="print()" class="button2">Download  Report</button>
</center>

	
	<script >
	
	function print(){
	var element = document.getElementById("list");
	var opt = {
	  margin:       1,
	  filename:     'All Inventory.pdf',
	  image:        { type: 'jpeg', quality: 0.98 },
	  html2canvas:  { scale: 2 },
	  jsPDF:        { unit: 'in', format: 'letter', orientation: 'portrait' }
	};
	 
	// New Promise-based usage:
	html2pdf().from(element).set(opt).save();
	
	}
	
	
	</script>
	
	
	
	
	
</body>
</html>
