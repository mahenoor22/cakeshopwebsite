<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--
 * Page Task :   My Cart for customer   
 *  
 * 
 *
 --%>
<!DOCTYPE html>
<html>
<head>
  <title> Online Cake Shop </title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
body { 
    background-image:linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.6)), url('productImages/header.jpg');
        background-size: cover;
	background-repeat: repeat;
	background-position: center;
	height: 110vh;
}
.container,.jumbotron,.label{
    background-color:transparent;
}
.list-group{
    color: black;
}
.noitems{ color:white; size:14px }
</style>  
   
  <script>
  
  // delete items from cart
  function delCart(itemId)
  {
 
	  document.cartForm.itemId.value = itemId; 
	  document.cartForm.action = "DelCartController";
	  document.cartForm.submit(); 
 
		  
  }
 
  // submit form to checkout
  function checkOut()
  {
	   
	  document.cartForm.submit();  
	  
  }
  </script>
  
</head>
<body>

 <div class="container-fluid">

 <!--  INCLUDE : TOP MENU NAVIGATION  -->
 <jsp:include page="/TopNav.jsp" />
 
 <div class="container">
 <div class="jumbotron">
 
<!--  Menu title  -->
 	 
<h1> <span class="label label-default">My Cart</span></h1><br>
 
 <ul class="list-group">

<!--  No List Check-->

	<c:choose>
		<c:when test="${!empty cartList }">
		
		
			<!-- /////////////    Cart List Start  : forEach  /////////////// -->
 
			<c:set var="total" value="${0}"/>
			
			<c:forEach var="cart" items="${requestScope.cartList}" begin="0" step="1" varStatus="status">
				<!-- total price for all items -->
				<c:set var="total" value="${total + cart.price}" />
			  
			  <li class="list-group-item">
			  	 
			  	<c:if test = "${status.end == 0}">
			  	Your cart is empty
			  	</c:if>
			 
			 	<table height='50px'>
			  		<tr>
                                            <td width="100px">${status.count}&nbsp;&nbsp;<img src="productImages/${cart.pimage}" align="center" width="100px" class="img-thumbnail" alt="Cinque Terre">&nbsp;
			  			</td> 
			  			<td width="500px" class="itemTitle"><h3 align="center">${cart.itemName}</h3></td>
			  			<td align="left" width="200px"> Quantity : ${cart.quantity}</td>
			  			<td align="right" width="100px"> <b>Rs ${cart.price}</b></td>
			  			<td align="right" width="100px"><a href="javascript:delCart('${cart.itemId}');"><img src="productImages/delete.jpg" width="30px"></a></td>
			  		</tr>
			  	</table>
		 
			  </li> 
				 
			</c:forEach>
	
			<li class="list-group-item">
				<table >
			  		<tr>
			  			 
			  			<td align="right" width="800px" align="right">  <h3> Total Items : ${total}</h3> </td> 
			  			<td align="right" width="200px"><button type="submit" class="btn btn-primary active" onclick="javascript:location.href='CheckoutController'">Check out</button></td>
			  		</tr>
			  	</table> 	    
			</li>
			<!-- /////////////   End  : forEach  /////////////// -->
			
	</c:when>
		
		<c:otherwise>
			<h3 class="noitems">  No Items </h3><br>
		</c:otherwise>
	</c:choose>
	
 </ul> 

   </div> 
 </div>
  
         <!-- form for cart --> 
		<form action="DelCartController" method="post" name="cartForm"> 
		 	<input type="hidden" value="" name="itemId">
		 	<input type="hidden" value="${sessionScope.customer.customerId }" name="customerId">
		 </form> 
         
</div> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>

