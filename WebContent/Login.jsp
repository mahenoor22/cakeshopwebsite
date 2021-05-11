<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%--
 * Page Task :  login form 
 *				customer / CSR 
 * 
 *
 --%>
<!DOCTYPE html>
<html>
<head>
<title>Online Cake Shop</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <link rel="stylesheet" type="text/css" href="styles.css">
  <link href="https://fonts.googleapis.com/css?family=Flamenco" rel="stylesheet">
<style>
    body {
    padding-top: 50px;
}
p{
    color: black;
}
</style>
<script>
	// show modal to validate null value 
	function MsgLoginValid() {

		// validate null value 
		if (document.getElementById("email").value == ""
				|| document.getElementById("pwd").value == "") {
			$('#myModal').modal('show');
			return;
		} else {
			// submit form  
			var form = document.LoginForm;

			if (form.userType[0].checked) {

				form.action = "Login.jsp";    //LoginCSRController
			} else {

				form.action = "LoginController";
			}

			form.submit();
		}

	}

	$('#myModal').on('shown.bs.modal', function() {
		$('#myInput').trigger('focus')
	})
</script>
</head>
<body style="background-image: url(productImages/download.jpg); background-size: 1370px;">

	<div class="container-fluid">

		<!--  INCLUDE : TOP MENU NAVIGATION  -->
		<jsp:include page="/TopNavLogin.jsp" />

		<div class="container">


			<!--  Login Form  -->
			<h2><font color="white">Log In</font></h2>

			<%
				// Fail to login
				try {
					String getMsg = (String) request.getAttribute("loginMsg");

					if (getMsg.equals("fail")) {
			%>
			
                        <p style='color: red;'>The email or password you entered is incorrect.</p>
                        
			<%
				}
				} catch (Exception e) {

				}
			%>
                        <br>
			<form class="form-inline" method="post" name="LoginForm" action=""
				onSubmit="return false;">
				<div class="form-group">
					<label for="focusedInput"><font color="white">Email :</font> </label><br> <input
						class="form-control" type="email" id="email" size="50"
						placeholder="Enter email" name="email">
				</div>
				<br>
				<div class="form-group">
					<label for="pwd"><font color="white">Password:</font></label><br> <input type="password"
						class="form-control" id="pwd" size="50"
						placeholder="Enter password" name="pwd">
				</div>
				<br> <br>
				<div class="checkbox">
					<label><input type="radio" name="userType" id="userType"
						value="csr"> <font color="white">CSR</font> </label> <label><input type="radio"
						name="userType" id="userType" checked value="user"><font color="white">User</font></label>
				</div>
				<br>
				<br>
				<button type="submit" class="btn btn-primary active"
					onclick="javascript:MsgLoginValid();"><font color="white">LOG IN</font></button>
				<button type="submit" class="btn btn-default active" onclick="javascript:location.href='Register.jsp';">Go to
					Sign up</button>
			</form>
		</div>
		<!-- the modal for Login Msg-->
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Log In</h4>
					</div>
					<div class="modal-body">
						<p>Please enter your email and password</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>
