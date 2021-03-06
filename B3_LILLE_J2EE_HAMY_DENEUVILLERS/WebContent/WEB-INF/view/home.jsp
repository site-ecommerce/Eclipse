
	<%@include file="header.jsp" %>

<%
//Affichage des produits
%>

<c:choose>
<c:when test="${ productFoundList != null }">
<div class="products-list">
  <div class="container">
<h1>Produits recherch�s :</h1>
<ul class="thumbnails">
<c:forEach items="${ productFoundList }" var="product" varStatus="status">
 	
				<li class="span3"> 
					<div class="thumbnail"><a href="<c:url value="/product">
							  <c:param name="productID" value="${ product.id }"/>
							</c:url>" class="thumb">
							<img src="http://placehold.it/350x150">
							</a>
			          <p><a href="<c:url value="/product">
							  <c:param name="productID" value="${ product.id }"/>
							</c:url>" class="thumb">
							<c:out value="${product.label}"></c:out>
							</a></p>
			          <p class="price">&euro; <c:out value="${product.ATIP}" /> </p>
			             <c:choose>
			          <c:when test="${ customer != null }">
					      <a class="buyLink" href="<c:url value="/myCart">
							  <c:param name="transaction" value="add"/>
							  <c:param name="productId" value="${ product.id }"/>
							</c:url>"  ><div class="addTocart" >Ajouter au panier</div></a>
				     </c:when>
				     <c:otherwise>
					     <a class="buyLink" href="<c:url value="/login">
							</c:url>">Ajouter au panier</a>
				     </c:otherwise>
				     </c:choose>
		            </div>	    				     
				</li>
	  
</c:forEach>
</ul>
</div>
</div>
<%
session.removeAttribute("productFoundList");
%>
</c:when>
<c:otherwise>
<div class="products-list">
  <div class="container">
    <h3>Notre <span>S�lection</span></h3>
    <ul class="thumbnails">
      <c:forEach items="${ productList }" var="product" varStatus="status">
				<li class="span3"> 
					<div class="thumbnail"><a href="<c:url value="/product">
							  <c:param name="productID" value="${ product.id }"/>
							</c:url>" class="thumb">
							<img src="http://placehold.it/350x150">
							</a>
					<% //<img src="<c:out value="${product.visual}" />" alt="Product" /> %>
					
					
			          <p><a href="<c:url value="/product">
							  <c:param name="productID" value="${ product.id }"/>
							</c:url>" class="thumb">
							<c:out value="${product.label}"></c:out>
							</a>
						</p>
			          <p class="price">&euro; <c:out value="${product.ATIP}" /> </p>
			          <c:choose>
			          <c:when test="${ customer != null }">
					      <a class="buyLink" href="<c:url value="/myCart">
							  <c:param name="transaction" value="add"/>
							  <c:param name="productId" value="${ product.id }"/>
							</c:url>"  ><div class="addTocart" >Ajouter au panier</div></a>
				     </c:when>
				     <c:otherwise>
					     <a  class="buyLink" href="<c:url value="/login">
							</c:url>">Ajouter au panier</a>
				     </c:otherwise>
				     </c:choose>
		            </div>	    				     
				</li>
	  </c:forEach>
    </ul>
  </div>
</div>
<div class="container">
  <div class="row">
    <div class="span12">

      
      <!-- Portfolio Columns -->
      <div class="products-list products-list-simple">
        <h2 class="text-center margin-top margin-bottom">Derniers <span>Produits</span></h2>
        <ul class="thumbnails">
          
          <!-- Products Single Box -->
           <c:forEach items="${ productList }" var="product" varStatus="status">
				<li class="span3"> 
					<div class="thumbnail"><a href="<c:url value="/product">
							  <c:param name="productID" value="${ product.id }"/>
							</c:url>" class="thumb">
							<img src="http://placehold.it/350x150">
							</a>
			          <p><a href="<c:url value="/product">
							  <c:param name="productID" value="${ product.id }"/>
							</c:url>"><c:out value="${product.label}"></c:out></a></p>
			          <p class="price">&euro; <c:out value="${product.ATIP}" /> </p>
		            </div>	    				     
				</li>
			</c:forEach>
        </ul>
      </div>
    </div>
  </div>
</div>
</c:otherwise>
</c:choose>





<%@include file="footer.jsp" %>
