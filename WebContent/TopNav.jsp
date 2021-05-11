<%--
* Page Task :  Top navigation for customers  
 *  
 * 
 *
 --%>
 <head>   
 <link rel="stylesheet" type="text/css" href="styles.css">
 </head>
 
	 <!--  TOP MENU : After Login -->
	 <nav class="navbar navbar-default navbar-fixed-top"> 
	  <div class="container-fluid">
 		<ul class="product nav navbar-nav">
	           
              <li><a href="LoginRst.jsp"><img class="logo" src="productImages/home.jpg"/></a></li>
              <li><a href="ProdListController?category=Cupcakes" style='color:white'>CupCakes</a></li>
	      <li><a href="ProdListController?category=BirthdayCakes" style='color:white'>Birthday Cakes</a></li>
	      <li><a href="ProdListController?category=MarriageCakes" style='color:white'>Marriage Cakes</a></li>          
	      <li><a href="ProdListController?category=Pastery" style='color:white'>Pastery</a></li>              
	      <li><a href="ProdListController?category=Icecakes" style='color:white'>IceCakes</a></li>  
	    </ul>
		<ul class="main-nav nav navbar-nav navbar-right">
		  <li><a href="MyCartController" style='color:white'><span class="glyphicon glyphicon-shopping-cart"></span> My Cart</a></li>
	      <li><a href="MyPageController"style='color:white'><span class="glyphicon glyphicon-user"></span> My Page</a></li> 
	      <li><a href="Logout" style='color:white'><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
	    </ul>
	  </div>
	</nav>