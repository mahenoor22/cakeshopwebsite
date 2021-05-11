 <%--
 * Page Task :  Top navigation for CSR  
 --%>
 
 <head>   
 <link rel="stylesheet" type="text/css" href="styles.css">
 
  <link href="https://fonts.googleapis.com/css?family=Flamenco" rel="stylesheet">
 </head>

	 <!--  TOP MENU : After CRS Login-->
	 <nav class="navbar navbar-default navbar-fixed-top">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="index.jsp" style='color:white'>Online Cake Shop</a>
	    </div>
 		<ul class="nav navbar-nav">
	       
	      <li><a href="CsrProdForm.jsp" style='color:white'>New Product</a></li>
	      <li><a href="CsrProdListController?category=Pastery" style='color:white'>Product List</a></li>
	      <li><a href="CsrOrderListController" style='color:white'>Order List</a></li>
	      <li><a href="CsrCustListController" style='color:white'>Customers</a></li>
	    </ul>
		<ul class="nav navbar-nav navbar-right"> 
	      <li><a href="Logout" style='color:white'><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
	    </ul>
	  </div>
	</nav>