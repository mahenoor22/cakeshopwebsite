<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  * Page Task :  CSR - Product information Form  
 * 
 * Reference :  TABLE Product
 * 
 *
 --%>
     
<!DOCTYPE html>
<html>
<head>
  <title> Online Cake Shop</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <style>
body { 
    background-image:linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.6)), url('productImages/header-img.jpg');
        background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
	height: 110vh;
}
.container{
    background-color: transparent;
}
.modal-body{
    color:black;
}
form{
    color:white;
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
  <script>
  
  	// submit form
	  function FormValid()
	  {
			var form = document.RegistForm;
			
		  	// validate null value 
			if(document.getElementById("itemName").value == "" || document.getElementById("price").value == "" || document.getElementById("pimage").value == "" || document.getElementById("quantity").value == "")
			{
				$('#myModal').modal('show'); 
				return;
			}
			else if(form.category[0].checked == false && form.category[1].checked == false && form.category[2].checked == false && form.category[3].checked == false && form.category[4].checked == false )
			{
				$('#myModal').modal('show'); 
				return;
			}
			else
			{ 
				form.action = "CsrProdController";
				 
				form.submit();
			}
			  
	  }
	  
	  $('#myModal').on('shown.bs.modal', function () {
		  $('#myInput').trigger('focus')
		})
	
  </script>
</head>
<body>

<div class="container-fluid">
 
 <!--  INCLUDE : TOP MENU NAVIGATION  -->
 <jsp:include page="/TopNavCSR.jsp" />
 
 <div class="container"> 
 
<!--  Login Form  --> 
  <h2>Shoes Information</h2>
  <br>  
  <form class="form-inline"  method="post" name="RegistForm" action="" onSubmit="return false;">
  <!-- new data or existed data to edit -->
  <c:choose>
		<c:when test="${mode == 'edit'}">
  			<input type="hidden" name="mode" value="edit">
  			<input type="hidden" name="itemId" value="${requestScope.prods.itemId }">
  		</c:when>
  		<c:otherwise >
  			<input type="hidden" name="mode" value="new">
  		</c:otherwise>
  </c:choose>
   
    <div class="checkbox">
        <label><input type="radio" name="category" id="category" value="Cupcakes" <c:if test="${requestScope.prods.category=='Cupcakes'}"> checked </c:if> > CupCakes </label>&nbsp;
      <label><input type="radio" name="category" id="category" value="BirthdayCakes" <c:if test="${requestScope.prods.category=='BirthdayCakes'}"> checked </c:if> > BirthdayCakes </label>&nbsp;
      <label><input type="radio" name="category" id="category" value="MarriageCakes" <c:if test="${requestScope.prods.category=='MarriageCakes'}"> checked </c:if> > MarriageCakes </label>&nbsp;
      <label><input type="radio" name="category" id="category" value="Pastery" <c:if test="${requestScope.prods.category=='Pastery'}"> checked </c:if> > Pastery </label>&nbsp;
      <label><input type="radio" name="category" id="category" value="Icecakes" <c:if test="${requestScope.prods.category=='Icecakes'}"> checked </c:if> > IceCakes </label>
      
      <i><font color="red">V</font></i>
    </div>
     <br><br>
   <div class="form-group">
      <label for="focusedInput">Cake Name : </label><br>
      <input class="form-control" type="text" id="itemName" size="50" placeholder="Enter Cake name (50 characters)" name="itemName" value="${requestScope.prods.itemName}" maxlength="50"> 
       <i><font color="red">V</font></i>
   </div>
   <br>
 	<div class="form-group">
      <label for="focusedInput">Image Name: </label><br>
      <input class="form-control" type="text" id="pimage" size="50" placeholder="Enter Image with extension" name="pimage" value="${requestScope.prods.pimage}">
      <i><font color="red">V</font></i>
   </div>
   <br>  
 	<div class="form-group">
      <label for="focusedInput">Quantity : </label><br>
      <input class="form-control" type="number" id="quantity" size="10" placeholder="Eg: 100" name="quantity" value="${requestScope.prods.quantity}">
      <i><font color="red">V</font></i>
   </div>
   <br> 
   <div class="form-group">
      <label for="focusedInput">Price : </label><br>
      <input class="form-control" type="number" id="price" size="10" placeholder="Eg: 000.00" name="price" value="${requestScope.prods.price}">
      <i><font color="red">V</font></i>
   </div>
   <br> 
   <div class="form-group">
      <label for="focusedInput">Description : </label><br>
      <textarea class="form-control" id="content" name="content" rows="5" cols="100" >${requestScope.prods.content}</textarea>
   </div>
   <br> 
   
   <br>
    <button type="submit" class="btn btn-primary active" onclick="javascript:FormValid();">Submit</button>
  </form>
 </div> 
 
<!-- the modal for Login Msg--> 
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">New Product</h4>
        </div>
        <div class="modal-body">
          <p>Please select the category and <br>
          enter Cake name, price, and its quantity.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
</div> 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>
