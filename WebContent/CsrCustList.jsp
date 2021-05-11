<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
 
 * Page Task :  CSR - Customer Information management
 * 				1. show customer list
 *				2. modify customer info
 *				3. delete customer  
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
.container-fluid{
    background-color: transparent;
}
table{
    background-color: white;
    color:black;
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
  
  // move form to change info
  function modifyInfo(customerId, mode)
  {

	  var form = document.cartForm;
	   
	  form.customerId.value= customerId;
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
 
 <div class="container">
 
  <h1 align="center">Customers</h1> <br>
 
  <!--  List Check-->

	<c:choose>
		<c:when test="${!empty customerList }"> 

		<!-- /////////////    Order List Start  : forEach  /////////////// -->
		 
			<c:set var="total" value="${0}"/>
		
			<table class="table">			   
                            <tr class="active">
			        <th>No</th>
			        <th>User Name</th>
			        <th>Customer Id</th> 
			        <th>Address</th>
			        <th>City</th>
			        <th>Postal Code</th> 
			        <th>Management</th> 
			      </tr>
			  <tbody>
  	
			<c:forEach var="customerList" items="${requestScope.customerList}" begin="0" step="1" varStatus="status">
		 
				 	<tr>
				        <td>${status.count} &nbsp;</td>
				        <td width="200px">${customerList.userName}</td>
				        <td>${customerList.customerId}</td>  
				        <td width="500px">${customerList.address}</td>
				        <td>${customerList.city}</td>
				        <td>${customerList.postalCode}</td>
				        <td class="active" width="400px"> 
					        <button type="button" class="btn btn-warning btn-sm" onClick="javascript:modifyInfo('${customerList.customerId}', 'search');">Edit</button>
					  		<button type="button" class="btn btn-danger btn-sm" onClick="javascript:modifyInfo('${customerList.customerId}', 'del');">delete</button>
					    </td>
				      </tr>    
				       
				 
			</c:forEach>
			<!-- /////////////   End  : forEach  /////////////// -->	
			 </tbody>
		</table>
			
	</c:when>
		 
		<c:otherwise>
			<h3>  No Customers </h3><br>
		</c:otherwise>
	</c:choose>
	 
  </div>
  
        <!-- form to edit and delete --> 
		<form action="CsrCustListController" method="post" name="cartForm"> 
		 	<input type="hidden" value="" name="customerId">
		 	<input type="hidden" value="" name="mode"> 
		</form> 
		 
</div> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>