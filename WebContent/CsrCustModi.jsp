 <%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
 
 * Page Task :  Change Customer Info Form  
 * 
 * Reference :  TABLE Customers  
 * 
 *
 --%>
     
<!DOCTYPE html>
<html>
<head>
  <title>Online Shop Cake</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
body { 
    background-image:linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.6)), url('productImages/header.jpg');
        background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
	height: 110vh;
}
h2{
    animation:  colorchangeor 1s infinite;
}

@keyframes colorchangeor{
	0%{color: red;}
	25%{color:#bf55ec;}
	50%{ color: white; }
	100%{ color:#bf55ec;  }
}</style>  
 
</head>
<body>

<div class="container-fluid">
 
 <!--  INCLUDE : TOP MENU NAVIGATION  -->
 <jsp:include page="/TopNavCSR.jsp" />
 
 <div class="container"> 

	<!--   Form  --> 
	  <h2>${requestScope.customer.userName} </h2>
 
		<br> 
    
	  <form class="form-inline"  method="post" name="RegistForm" action="CsrCustListController" >
	  	<input type="hidden" id="mode" name="mode" value="edit">
	  	<input type="hidden" id="customerId" name="customerId" value="${requestScope.customer.customerId}">
	  	<div class="form-group">
	      <label for="focusedInput"> Email Account : ${requestScope.customer.customerId} </label><br><br>
 
	   </div>  
	   <br>
	   <div class="form-group">
	      <label for="focusedInput">First Name : </label><br>
	      <input class="form-control" type="text" id="firstName" size="50"  value="${requestScope.customer.firstName }" name="firstName" maxlength="30">
	   </div>
	   <br>
	 	<div class="form-group">
	      <label for="focusedInput">Last Name : </label><br>
	      <input class="form-control" type="text" id="lastName" size="50"  value="${requestScope.customer.lastName }" name="lastName" maxlength="30">
	   </div> 
	   <br> 
	 	<div class="form-group">
	      <label for="focusedInput">Address : </label><br>
	      <input class="form-control" type="text" id="address" size="100" value="${requestScope.customer.address }" name="address">
	   </div>
	   <br> 
	   <div class="form-group">
	      <label for="focusedInput">City : </label><br>
	      <input class="form-control" type="text" id="city" size="50" value="${requestScope.customer.city }" name="city">
	   </div>
	   <br> 
	   <div class="form-group">
	      <label for="focusedInput">Postal Code : </label><br>
	      <input class="form-control" type="text" id="postalCode" size="10" value="${requestScope.customer.postalCode }" name="postalCode">
	   </div>
	   <br> 
	   
	   <br><br>
	    <button type="submit" class="btn btn-primary active" >Submit</button>
	  </form>
	 </div> 
</div> 
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
</body>
</html>

 