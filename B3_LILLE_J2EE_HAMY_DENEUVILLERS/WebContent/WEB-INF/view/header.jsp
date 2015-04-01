<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<title>VintageVinyle</title>
		<!-- Stylesheet -->
		<link href="/B3_LILLE_J2EE_HAMY_DENEUVILLERS/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link href="/B3_LILLE_J2EE_HAMY_DENEUVILLERS/css/custom.css" rel="stylesheet" type="text/css" />
		<link href="/B3_LILLE_J2EE_HAMY_DENEUVILLERS/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />
		<link href="/B3_LILLE_J2EE_HAMY_DENEUVILLERS/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
		<link href="/B3_LILLE_J2EE_HAMY_DENEUVILLERS/css/style.css" rel="stylesheet" type="text/css" />
		<!--<link href="/B3_LILLE_J2EE_HAMY_DENEUVILLERS/css/color/multicolor.css" rel="stylesheet" type="text/css" id="changeColor" />-->
		<link href="/B3_LILLE_J2EE_HAMY_DENEUVILLERS/css/flexslider.css" rel="stylesheet" type="text/css" />
		<link href="/B3_LILLE_J2EE_HAMY_DENEUVILLERS/css/fancybox.css" rel="stylesheet" type="text/css" />
		<link href="/B3_LILLE_J2EE_HAMY_DENEUVILLERS/css/masonry.css" rel="stylesheet" type="text/css" />
		<link href="http://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet" type="text/css" />
		<link rel="shortcut icon" href="/MyMagicPetShop666/img/favicon.ico" />
		<!-- Scripts -->
		<script type="text/javascript" src="../../code.jquery.com/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="/B3_LILLE_J2EE_HAMY_DENEUVILLERS/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/B3_LILLE_J2EE_HAMY_DENEUVILLERS/js/jquery.nicescroll.min.js"></script>
		<script type="text/javascript" src="/B3_LILLE_J2EE_HAMY_DENEUVILLERS/js/jquery.flexslider.min.js"></script>
		<script type="text/javascript" src="/B3_LILLE_J2EE_HAMY_DENEUVILLERS/js/jquery.fancybox.min.js"></script>
		<script type="text/javascript" src="/B3_LILLE_J2EE_HAMY_DENEUVILLERS/js/jquery.masonry.min.js"></script>
		<!--<script type="text/javascript" src="js/functions.js"></script>-->
	</head>
	<body>
	<div class="header navbar-fixed-top">
  <div class="container">
    <div class="row"> 
      
      <!-- Secondary Menu -->
      <ul class="nav nav-pills span6">
        <li class="active"><a href="<c:url value="/init" />">Accueil</a></li>
        <li><a href="">Mon compte</a></li>
        <li><a href="<c:url value="/myCart">
        				<c:param name="transaction" value="print"/>
        			</c:url>">Panier</a></li>
      </ul>
      
      <!-- Header Cart -->
      <div class="cart"><i class="icon-shopping-cart"></i>
        <p>Panier</p>
        
        <!-- Header Cart Content -->
        <div class="cart-content">
          <div class="mini-cart-info">
            <h3>Panier</h3>
            <ul>
            
            <c:forEach items="${ cart.cartLineList }" var="cartLine" varStatus="status">
				<c:forEach items="${ productList }" var="product" varStatus="status">
					<c:if test="${ product.id == cartLine.productId }">
						<li> 
						<a href="#"><img src="" alt="Produit" /></a>
						 <div class="mini-cart-detail">
			                  <h5><a href="#"><c:out value="${product.label}"/></a></h5>
			                  <em><c:out value="${cartLine.lineNumber}"/> exemplaire(s)</em>
			                  <p>&euro; <c:out value="${product.ATIP}"/> </p>
		                 </div>			    				     
					    </li>
					   <c:set var="total" value="${total = total + product.ATIP * cartLine.lineNumber}" scope="page" />
					</c:if>
				</c:forEach>
			</c:forEach>
			</ul>
          </div>
          
           <div class="mini-cart-total">
           
                   <c:if test="${total != null }">
                   	 <p class="total">Total 
                   	 <span>&euro;
                   	 	 <c:out value="${total}"></c:out>Euros
                   	 	 <div class="checkout"><a href="<c:url value="/myCart">
			 				 	<c:param name="transaction" value="print"/>
								</c:url>" class="btn">Voir le panier</a> 
								<a href="<c:url value="/order">
			  					</c:url>" class="btn btn-checkout">Payer</a><
			 			 </div>
                   	 </span>
                   	</p>
                   </c:if>
                   
                    <c:if test="${total == null }">
                   	 <p class="total"><c:out value="Vous n'avez pas d'articles :'("></c:out></p>
                   </c:if>
           	</div>
        </div>
      </div>
      

      <!-- Header Login -->
      <p class="log-reg">
      	<c:choose>
			<c:when test="${ customer != null }">
				<a href="<c:url value="/logout" />">Se déconnecter ( ${customer.firstname} ) &nbsp;</a>
			</c:when>
			<c:otherwise>
				<c:if test="${ errorMessage != null }">
				    <c:out value="${errorMessage}"/>
				</c:if>
				<c:if test="${ infoMessage != null }">
				    <c:out value="${infoMessage}"/>
				</c:if>
					<a href="<c:url value="/login" />">Se connecter / S'enregistrer &nbsp;</a>
			</c:otherwise>
		</c:choose>
      </p>
      <div class="clearfix"></div>
    </div>
  </div>
</div>
<!-- Logo --> 
<a href="#" id="logo"><img src="./img/logo.png" alt="logo" /></a> 

<!-- Main Navbar -->
<hr class="bordered" />
<div class="navbar-cont">
  <div class="container">
    <div class="row">
      <div class="span12">
        <div class="navbar">
          <div class="navbar-inner">
            <div class="container"><a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-responsive-collapse"><i class="icon-align-justify"></i></a>
              <div class="nav-collapse collapse navbar-responsive-collapse">
                <ul class="nav">
                  <li class="active"><a href="<c:url value="/init" />">Accueil</a></li>
                  
                  <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Catégories<i class="icon-angle-down"></i></a> 
                    
                    <!-- Dropdown Navbar -->
                    <ul class="dropdown-menu">
                    <c:forEach items="${ categoryList }" var="category" varStatus="status">
                    <li><a href="<c:url value="/category">
							  <c:param name="categoryID" value="${ category.categoryId }"/>
							</c:url>"><c:out value="${category.label}"/></a></li>
                    </c:forEach>
                    </ul>
                  </li>
                  <li><a href="#">Contact</a></li>
                </ul>
                
                <!-- Navbar Search -->
               
                <form action="searchServlet" method="post" class="header-search">						
						 <input id="searchId" type="text" name="searchString" required="true" 
						 placeholder="" />
						 <button id="searchB" type="submit" value="search">Go !</button>
				</form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<hr class="bordered" />
<div class="container">
  <div class="row">
    <div class="span12"> 
      
      <!-- Flex Slider -->
      <div class="flexslider">
        <ul class="slides">
          <li><a href="#"><img src="banner/slider.jpg" alt="Slider" /></a></li>
          <li><a href="#"><img src="banner/slider2.jpg" alt="Slider" /></a></li>
        </ul>
      </div>
    </div>
  </div>
</div>
<div class="container">
 
  
</div>