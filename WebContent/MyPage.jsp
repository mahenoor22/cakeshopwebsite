<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
 * --------------------------------------------- 
 * Page Task :   My page for customer   
 *  			1. show personal information to edit
 				2. show ordered status
 * 
 *
 --%>
<!DOCTYPE html>
<html>
<head>
  <title> Online Cake Shop </title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <link rel="stylesheet" type="text/css" href="styles.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body { 
background-image:linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.6)), url('productImages/header.jpg');
        background-size: cover;
	background-repeat: repeat;
	background-position: center;
	height: 110vh;
}

.container,.jumbotron{
    background-color:transparent;
}
.itemTitle,table{ color:#4C4C4C; size:12px }
.list-group{
    color:#4C4C4C; size:12px
}

</style>  
   
  <script>
  
  // move form to add quantity
  function modifyOrder(orderId, quantity, mode)
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
 <jsp:include page="/TopNav.jsp" />
 
 <div class="container">
 <div class="jumbotron">
 
<!--  Menu title  -->
 <h1 class="colorchange">${sessionScope.customer.userName}</h1>
<h2>My Order</h2><br>
 
 
 <ul class="list-group">
  
 <!--  Order List Check-->

	<c:choose>
		<c:when test="${!empty ordersList }"> 

		<!-- /////////////    Order List Start  : forEach  /////////////// -->
		 
			<c:set var="total" value="${0}"/>
			
			<c:forEach var="orders" items="${requestScope.ordersList}" begin="0" step="1" varStatus="status">
				
				<!-- total price for all items -->
				<c:set var="total" value="${total + orders.price}" />
			  
				  <li class="list-group-item">
				  	 
				  	<c:if test = "${status.end == 0}">
				  	No List
				  	</c:if>
				 
				 	<table border=0 height='10px'>
				  		<tr>
                                                    <td width="150px">${status.count}&nbsp;&nbsp;<img src="productImages/${orders.pimage}" width="50px" class="img-thumbnail" alt="Cinque Terre">&nbsp;&nbsp;
				  		 
				  			</td> 
				  			<td align="center" width="400px" class="itemTitle"><h3>${orders.itemName}</h3></td>
				  			<td align="center" width="150px"> <b>Rs ${orders.price}</b></td>
				  			<td align="center" width="50px"> * ${orders.quantity} </td>
				  			<td align="center" width="100px">
				  				<c:if test="${orders.quantity > 1 && orders.orderStatus=='Order Placed'}">
					        		<button type="button" class="btn btn-warning" onClick="javascript:modifyOrder('${orders.orderId}','${orders.quantity-1}', 'down');"> -1 </button>
						  	    </c:if>
							  	    
				  				<c:if test="${orders.orderStatus=='Order Placed' }"> 
				  					<button type="button" class="btn btn-warning" onClick="javascript:modifyOrder('${orders.orderId}', '${orders.quantity+1}', 'add');"> +1 </button>
				  				</c:if>
				  			</td> 
                                                        <td align="center" width="200px"> <font color="red"> ${orders.orderStatus}</font> </td>&nbsp;
				  			<td align="center" width="100px">
				  				<c:if test="${orders.orderStatus=='Order Placed' }"> 
				  				<button type="button" class="btn btn-danger" onClick="javascript:delOrder('${orders.orderId}');">cancel</button>
				  				</c:if>
				  			</td>
				  		</tr>
				  	</table>
			 
				  </li> 
				 
			</c:forEach>
			<!-- /////////////   End  : forEach  /////////////// -->	
			
			<!--  total amount -->
			<li class="list-group-item">
				<table>
			  		<tr> 
			  			<td align="right" width="800px" align="right">   
			  			<h3> Total Items :Rs ${total }
			  			</h3> </td> 
			  			<td align="right" width="200px">
			  			 
			  			</td>
			  		</tr>
			  	</table> 
			</li> 
			
	</c:when>
		 
		<c:otherwise>
			<h3>  No Items </h3><br>
		</c:otherwise>
	</c:choose>
	
 </ul> 


<!-- Customer's delivery address information  -->

<h2>My Address</h2><br>
 
 <ul class="list-group">
	<li class="list-group-item">
		 
	  	<b>Shipping Address :</b>  
	  	
	  	${sessionScope.customer.address}	 
	  	
	  	<br> 
		<b>City :</b>  

		 ${sessionScope.customer.city}	<br>
		 
		 <b>Postal Code :</b>  
		 
	  	 ${sessionScope.customer.postalCode} <br><br>
	  	 	 
	  	 <button type="button" class="btn btn-default" onclick="javascript:location.href='RegisterModi.jsp'">Modify Information</button>
	  	  
	  		 
	</li>
</ul> 

   </div> 
 </div>
 
 
         <!-- form to edit and delete --> 
		<form action="MyPageController" method="post" name="cartForm"> 
		 	<input type="hidden" value="" name="orderId">
		 	<input type="hidden" value="" name="mode">
		 	<input type="hidden" value="" name="quantity"> 
		</form> 
        
  
</div> 
</body>
</html>