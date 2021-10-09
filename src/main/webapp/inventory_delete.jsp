<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String id=request.getParameter("id");
int quantity = Integer.parseInt(request.getParameter("quantity"));
String name=request.getParameter("name");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/redcrossdb", "root", "");
Statement st=conn.createStatement();
//String sql = "update item set quantity=quantity-'"+quantity+"' where name='"+name+"'";
//int rs = st.executeUpdate(sql);
int i=st.executeUpdate("DELETE FROM inventory_all WHERE id="+id);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/footer.css">
	<link rel="stylesheet" type="text/css" href="css/inventory_delete.css">
	
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
	
		

<h1>Data Deleted Successfully</h1>
<a href="inventory_view.jsp"><button align="right">Back</button></a>
