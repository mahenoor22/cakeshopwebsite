<%@page import="com.cakeshop.CSR"%>]
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%--
 * Page Task :   Welcome Page after login for CSR  
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
 <jsp:include page="/TopNavCSR.jsp" />
 
	 <%
	 //Session  
	 HttpSession sessionCsr = request.getSession();
	 
	 
	 
	 try{
		 
	 	CSR csr = (CSR)sessionCsr.getAttribute("csr"); 
	 	
	 		
	 	
	 %>
	   	
        	<header>
		<div class="main-content-header">
			<h1> WELCOME TO <span class="colorchange">Baking Bits</span>.<br>
				HOUSE OF CAKE LOVER OO YES. </h1>
			<h2>This is the Owner's Site</h2>
		</div>
	</header>

	

	 <%
	 	
	 
	 }
	 catch(Exception e)
	 {
	%>
		
		The username or password you entered is incorrect.
		
	<%	 
	 }
	 %>
 

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>

