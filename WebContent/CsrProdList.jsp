<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
 * --------------------------------------------- 
 *
 * Page Task :  CSR - Shoes List   
 * 
 * Reference DB :  Shoes 
 * 
 *
 --%>
<!DOCTYPE html>
<html>
<head>
  <title>Online Cake Shop</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style>
body { 
    padding-top: 60px;
    background-image:linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.6)), url('productImages/header-img.jpg');
        background-size: cover;
	background-repeat:repeat;
	background-position: center;
	height: 110vh;
}

table{
    color:black;
}
.pagination{
    padding-left: 60px;
}
.jumbotron{
    padding-top: 5px;
    background-color: transparent;
}
</style>  
<script>

// set to move form to edit info
function moveEditPage(itemId,mode){
		
	var form = document.listForm;
	
	form.mode.value = mode;
	form.itemId.value = itemId;
	form.submit();
}
</script>  
</head>
<body>

 <div class="container-fluid">

 <!--  INCLUDE : TOP MENU NAVIGATION  -->
 <jsp:include page="/TopNavCSR.jsp" />
 
 <div class="container">
 
   <ul class="pagination">
    <li><a href="CsrProdListController?category=Cupcakes">CupCakes</a></li>
    <li><a href="CsrProdListController?category=BirthdayCakes">BirthdayCakes</a></li>
    <li><a href="CsrProdListController?category=MarriageCakes">MarriageCakes</a></li>
    <li><a href="CsrProdListController?category=Pastery">Pastery</a></li>
    <li><a href="CsrProdListController?category=Icecakes">IceCakes</a></li>
  </ul>
  
 <div class="jumbotron">
<h3>${requestScope.category}</h3>

 <ul class="list-group">

<!-- /////////////    Shoes List Start  : forEach  /////////////// -->

	<c:forEach var="prods" items="${requestScope.prodsList}" begin="0" step="1" varStatus="status">
	
	  <li class="list-group-item">
	  	<!--    /prods info/     		
		${prods.itemId} 
		${prods.itemName} 
		${prods.category} 
		${prods.quantity} 
		${prods.price} 
		${prods.content}
	 	-->
	  	
	  	<table>
	  		<tr>
	  			<td> <h4>${status.count}.</h4></td><td colspan="2"><h4><b>${prods.itemName}</b></h4></td>
	  			<td align="right">
	  				<button type="button" class="btn btn-primary btn-sm" onClick="javascript:moveEditPage('${prods.itemId}','search')">Edit</button> 
	  				<button class="btn btn-danger btn-sm" onClick="javascript:moveEditPage('${prods.itemId}','del')">Delete</button>
	  			</td>
	  		</tr>
	  		<tr>
	  			<td> </td><td width="120px"><img src="productImages/${prods.pimage}" width="100px" class="img-thumbnail" alt="Cinque Terre"></td>
	  			<td colspan="2"> 
	  			    - <b>Rs ${prods.price}</b><br>
	  			    - category: ${prods.category} <br>
	  				- qty: ${prods.quantity} <br>
	  				- ${prods.content}
	  			</td>
	  		</tr>
	  	</table>
	  		 
	  	  
	  </li> 
		 
	</c:forEach>
	
<!-- /////////////   End  : forEach  /////////////// -->	
 </ul> 

   </div> 
 </div>
          <!-- form for edit or del --> 
		 <form action="CsrProdController" method="post" name="listForm"> 
		 	<input type="hidden" value="" name="mode">
		 	<input type="hidden" value="" name="itemId">
		 	<input type="hidden" value="${requestScope.category}" name="category">
		 </form> 
</div> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>

