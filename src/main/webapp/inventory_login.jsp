<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Login</title>
	
	<link rel="stylesheet" type="text/css" href="css/styles.css">
	<link rel="stylesheet" type="text/css" href="css/header.css">
	<link rel="stylesheet" type="text/css" href="css/footer.css">
	<link rel="stylesheet" type="text/css" href="css/inventory_login.css">
	
	
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

	<h1>Welcome To Inventory Page</h1>
	<div class="roww">
		<div class="row">
  			<div class="column btn">
    			<a href="inventory_insert.jsp"><button>Add New Item</button></a>
    
  			</div>
  			<div class="column btn">
   				<a href="inventory_view.jsp"><button>View All and Delete</button></a>
    
  			</div>
		</div>
		<div class="row">
 		 	<div class="column btn" >
    			<a href="inventory_stock.jsp"><button>Stock</button></a>
    
  			</div>
  			<div class="column btn">
    			<a href="inventory_getreport.jsp"><button>Get Report</button></a>
    
 			 </div>
		</div>
	</div>
	<br><br><br><br><br><br><br><br>

</body>




</html>