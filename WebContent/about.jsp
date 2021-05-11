<html>
<head>
<title> How to Order </title>  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
   body { 
    background-image:linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.6)), url('productImages/header-img.jpg');
        background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
	height: 110vh;
}
h1{
    padding-top: 70px;
    animation:  colorchangeor 1s infinite;
}

@keyframes colorchangeor{
	0%{color: red;}
	25%{color:#bf55ec;}
	50%{ color: white; }
	100%{ color:#bf55ec;  }
}
</style>
</head>
<body>
 <jsp:include page="/TopNav.jsp" />
<header>
        <h1 align=center>About The Website</h1><br>
	<div id="text1">
            <h4 align="center" , style='font-size: 20px' , color="white">
        This website mainly focuses on delivering freshly baked Cakes and Pasteries to your doorstep.<br><br>
	All you have to do is Register / Create your own account on the website.<br><br>
	You can do this by using one of your social networking account.<br><br>
	If you already have an account, you can login any time you want.<br><br>
	Once logged in you can select an product from the list of various cakes and pasteries.<br><br>
	An item selected will be added to your cart.<br><br>
	The items in the cart can be updated or deleted as per the customer's desire.<br><br>
	The items added to the cart are taken as final order after the final submission of the customer.<br><br>
	The items are then delivered to the customer on their specified location.<br><br>
	</div>
</header>
</body>    
</html>
