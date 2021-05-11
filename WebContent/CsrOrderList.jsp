<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
 * Page Task :  CSR - Order management
 * 		1. show orders list  
 *
 --%>
<!DOCTYPE html>
<html>
<head>
  <title>Online Cake Shop</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  
 <style>
body {
    padding-top: 70px;
    background-image:linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.6)), url('productImages/header-img.jpg');
    background-size: cover;
    background-repeat: repeat;
    background-position: center;
    height: 110vh;
}
.container{
    background-color: white;
    color: black;
}
h1{
    animation:  colorchangeor 1s infinite;
}

@keyframes colorchangeor{
	0%{color: red;}
	25%{color:#bf55ec;}
	50%{ color: white; }
	100%{ color:#bf55ec;  }
}
</style>  
  <script>
  
  // move form to change order status
  function modifyOrder(orderId, orderStatus)
  {
 
	  var form = document.cartForm;
	  
	  form.orderId.value = orderId; 
	  form.orderStatus.value= orderStatus;
	  form.mode.value = "status";
	  form.submit(); 
 
		  
  }

  // move form with mode; add quantity / cancel order 
  function changeOrder(orderId, quantity, mode)
  {
 
	  var form = document.cartForm;
	  
	  form.orderId.value = orderId; 
	  form.quantity.value= quantity;
	  form.mode.value = mode;
	  form.submit(); 
 
		  
  }
  
  // move form to delete order
  function delOrder(orderId)
  {
 
	  var form = document.cartForm;
	  form.orderId.value = orderId;
	  form.mode.value = "del";
	  form.submit(); 
 
		  
  }
  
  </script>
  
</head>
<body>
 <div class="container-fluid">
 
  <!--  INCLUDE : TOP MENU NAVIGATION  -->
 <jsp:include page="/TopNavCSR.jsp" />
 

 
  <h1 align="center">Orders</h1> <br>
 
  <!--  Order List Check-->
 <div class="container">
	<c:choose>
		<c:when test="${!empty ordersList }"> 

		<!-- /////////////    Order List Start  : forEach  /////////////// -->
		 
			<c:set var="total" value="${0}"/>
		<div class="jumbo">
			<table class="table">
			    <thead>
			      <tr class="active">
			        <th>No</th>
			        <th>Item Name</th>
			        <th>Customer</th>
			        <th>Qty</th>
			        <th>Price(Rs)</th>
			        <th>Status</th>
			        <th>Management</th>
			      </tr>
			    </thead>
			    <tbody>
                                    
                                
			<c:forEach var="orders" items="${requestScope.ordersList}" begin="0" step="1" varStatus="status">
				
				<!-- total price for all items -->
				<c:set var="total" value="${total + orders.price}" />
			   
				  	<c:if test = "${status.end == 0}">
				  	No List
				  	</c:if>
				 
				 	  <tr>
				        <td>${status.count} &nbsp;</td>
				        <td width="100px">${orders.itemName}<br>(${orders.category})</td>
				        <td width="100px">${orders.customerId}</td>
				        <td width="55px" align="center">${orders.quantity}</td>
				        <td >Rs ${orders.price}</td>
				        <td width="150px">${orders.orderStatus}</td>
				        <td> 
					        <button type="button" style='padding-right:13px;padding-left:13px'class="btn btn-info btn-sm" onClick="javascript:modifyOrder('${orders.orderId}', 'In-Process');">In-Process</button>
					  		<button type="button" , style='padding-right:15px;padding-left:15px 'class="btn btn-warning btn-sm" onClick="javascript:modifyOrder('${orders.orderId}', 'Delivered');">Delivered</button>
					  		<button type="button", style='padding-right:18px;padding-left:18px ', class="btn btn-danger btn-sm" onClick="javascript:delOrder('${orders.orderId}');">delete</button>
					    </td>
				      </tr>    
				       
				 
			</c:forEach>
			<!-- /////////////   End  : forEach  /////////////// -->	
			 </tbody>
		</table>
			
	</c:when>
		 
		<c:otherwise>
			<h3>  No Items </h3><br>
		</c:otherwise>
	</c:choose>
	
 </ul> 
  
  </div>
  
           <!-- form to edit and delete --> 
		<form action="CsrOrderListController" method="post" name="cartForm"> 
		 	<input type="hidden" value="" name="orderId">
		 	<input type="hidden" value="" name="mode">
		 	<input type="hidden" value="" name="quantity"> 
		 	<input type="hidden" value="" name="orderStatus"> 
		</form> 
		
		
</div>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>