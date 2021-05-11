<%@page import="com.cakeshop.Customer"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%--
 * Page Task :   Welcome Page after login for customer  
 * 
 *
 --%>
<!DOCTYPE html>
<html>
<head>
  <title>Online Cake Shop</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <meta name= viewport content= "width=device-width, initial-scale=1.0">
  <link rel="stylesheet" type="text/css" href="styles.css">
  <link href="https://fonts.googleapis.com/css?family=Flamenco" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

.itemTitle{ color:#4C4C4C; size:10px }
</style>  
</head>

<body>


 <!--  INCLUDE : TOP MENU NAVIGATION  -->
 <jsp:include page="/TopNav.jsp" />
 
	 <%
	 //Session  
	 HttpSession sessionCustomer = request.getSession();
	 
	 try{
		 
	 	Customer customer = (Customer)sessionCustomer.getAttribute("customer"); 
	 %>
	<header>
		<div class="main-content-header">
			<h1> WELCOME TO <span class="colorchange">THE BAKERY HOUSE</span>.<br>
				HOUSE OF CAKE LOVER OO YES. </h1>
			<a href="about.jsp" class="btn btn-full"> How To Order</a>
		</div>
	</header>

	

	 <%
	 	
	 }
	 catch(Exception e)
	 {
	%>
		
		<jsp:forward page="Login.jsp" />
		
	<%	 
	 }
	 %>
 



  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>

