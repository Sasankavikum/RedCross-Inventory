<%@ page import="java.util.*" %>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
    <head>
    
    <link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/footer.css">
	<link rel="stylesheet" type="text/css" href="css/inventory_searchview.css">	

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
    
    	<h1>Item Search result</h1>
    	<a href="inventory_view.jsp"><button class="btnback" align="right">Back</button></a>
        <table border="2">
           
            <tr>
                <td><b>Number</b></td>
                <td><b>Item Name</b></td>
                <td><b>Shop Purchased</b></td>
                <td><b>Date</b></td>
                <td><b>Quantity</b></td>
                <td><b>Entered By</b></td>
                <td><b>Total</b></td>

            </tr>
            <%
                int count = 0;
                String color = "#F9EBB3";
                if (request.getAttribute("piList") != null) {
                    ArrayList al = (ArrayList) request.getAttribute("piList");
                    System.out.println(al.toString());
                    
                    Iterator itr = al.iterator();
                    while (itr.hasNext()) {
 
                        if ((count % 2) == 0) {
                            color = "#eeffee";
                        }
                        count++;
                        ArrayList pList = (ArrayList) itr.next();
                        
            %>
            <tr style="background-color:<%=color%>;">
                <td><%=pList.get(0)%></td>
                <td><%=pList.get(1)%></td>
                <td><%=pList.get(2)%></td>
                <td><%=pList.get(3)%></td>
                <td><%=pList.get(4)%></td>
                <td><%=pList.get(5)%></td>
                <td><%=pList.get(6)%></td>
                
            </tr>
            <%
                    }
                }
                
            %>
            <%
            if (count == 0) {
            %>
            <tr>
                <td colspan=8 align="center"
                    style="background-color:#eeffee"><b>No Record Found..</b></td>
            </tr>
            <%            
            	}
            %>
        </table>
        <br><br><br><br>
       </body>
</html>