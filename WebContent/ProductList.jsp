<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
 * Page Task :   product List   
 * 
 * Reference DB :  product 
 * 
 *
 --%>
<!DOCTYPE html>
<html>
<head>
  <title>Online Cake Shop </title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
    body { 
    background-image:linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.6)), url('productImages/header.jpg');
        background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
	height: 110vh;
}
.colorchange{
	animation:  colorchangemahicafe 3s infinite;
}

@keyframes colorchangemahicafe{
	0%{color: red;}
	25%{color:#bf55ec;}
	50%{ color: white; }
	100%{ color:#bf55ec;  }
}

.mobile-icon{display: none;}

.container,.label,.jumbotron,.list-group,.container-fluid{
    background-color: transparent;
}
table p,button{
    color:#ffffff;
}
p{
    color:#000000;
}
</style>  
   
  <script>
  
  // show modal window to confirm to add prods to their cart
  function addCart(itemId,itemName)
  {
	  document.getElementById('modal_item_title').innerHTML = itemName;
	  
	  document.cartForm.itemId.value = itemId;
	  
	  $('#myModal').modal('show'); 
	  return;
	 	  
  }
  
  // close modal and then form submit
  function submitCart()
  {
	  
	  $('#myModal').modal('toggle'); 
	  document.cartForm.submit(); 
	 
  }
  
  $('#myModal').on('shown.bs.modal', function () {
	  $('#myInput').trigger('focus')
	})
	
  </script>
  
</head>
<body>

 <div class="container-fluid">

 <!--  INCLUDE : TOP MENU NAVIGATION  -->
 <jsp:include page="/TopNav.jsp" />
 
 <div class="container">
 <div class="jumbotron">
 
<!--  Menu title  -->
<c:if test="${!empty category }">		
    <table  align="center" width="500" border="0">
      <tr class="normal">
          <td><br><p class="colorchange" , align="center" , style='font-size:50px'>${category}</p><br></td>
      </tr>
      <tr>
        <td>
            <table width="400" border="0">
</c:if>
 

<!--  No List -->

	<c:if test="${empty prodsList }">		 
			<h3>  No Items ${prodsList}</h3><br>
	</c:if>

<!-- /////////////    Shoes List Start  : forEach  /////////////// -->

	<c:forEach var="prods" items="${requestScope.prodsList}" begin="0" step="1" varStatus="status">
	
	  
	  	<!--         		
		${prods.itemId} 
		${prods.itemName} 
		${prods.category} 
		${prods.quantity} 
		${prods.price} 
                ${prods.pimage}
                ${prods.content}
	 	-->
	  	<c:if test = "${status.end == 0}">
	  	No list
	  	</c:if>
                
                <td width="350px" height="100px" class="center1">		
	  	<p>${prods.itemName}</p>
              <p>Rs ${prods.price}</p>
                <table width="180" height="220" border="0" align="center">
              <tr>
                  <td><a href="javascript:addCart('${prods.itemId}','${prods.itemName}');"><img src="productImages/${prods.pimage}" width="150px" height="150px" class="img-thumbnail" alt="Cinque Terre"></a></td>
              </tr>
                </table>
                <p>${prods.content}</p>
               </td>
              
          
	</c:forEach>
	</table> 
<!-- /////////////   End  : forEach  /////////////// -->	

            
    </table>
   </div> 
 </div>
 
 
 <!-- the modal to add cart item --> 
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button> 
          <div id="modal_item_title" class="modal-title"></div> 
        </div>
        <div class="modal-body">
          <p>Do you want to add this item?</p>
        </div>
         <!-- form for cart --> 
		<form action="cartController" method="post" name="cartForm">
		 	<input type="hidden" name="category" value="${category}">
		 	<input type="hidden" value="" name="itemId">
		 	<input type="hidden" value="${sessionScope.customer.customerId}" name="customerId">
		 </form> 
        <div class="modal-footer">
        <!-- data-dismiss="modal"  -->
          <button type="button" class="btn btn-default" onClick="javascript:submitCart();">Add to Cart </button>
        </div>
      </div>
    </div>
  </div>
 <!-- END : the modal to add cart item -->   
  
</div> 
</body>
</html>

