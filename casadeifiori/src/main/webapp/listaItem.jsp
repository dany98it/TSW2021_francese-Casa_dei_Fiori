<%@page import="java.util.*,model.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
	Collection<?> products = (Collection<?>) request.getAttribute("itemsCollection");
	if(products == null) {
		response.sendRedirect("./MostraItem");	
		return;
	} %>
<!DOCTYPE html>
<html lang="it">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="Content-Type" content="text/html; utf-8">
		<title>Casa dei Fiori</title>
		<link rel=StyleSheet href="style.css" type="text/css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"  />
	</head>
	<body>
		<%@ include file="main/menuMobile.jsp" %>
		<div id="main">
			<header>
				<%@include file="main/header.jsp" %>
			</header>
			<nav>
				<%@ include file="main/navigationBar.jsp"%>
			</nav>
			<h2>Products</h2>
			<div id="itemListFilter">
		
				<button id="submitItemFitler" value="filtra" >filtra</button>
			
			</div>
			
			<div class="itemListing">
			<%
					if (products != null && products.size() != 0) {
					Iterator<?> it = products.iterator();
					while (it.hasNext()) {
						Item bean = (Item) it.next();
			%>
			<div class= "itemCard">
				
				<div class="box-up">
					<a href="MostraDettagliItem?itemID=<%=bean.getId()%>">
					<img alt="itemCarrello" class="itemCardImg" src="img/fiori2.jpg" height="200px"></a>
						<div class="itemCardImgInfo">
							<div class="itemCardImgInfoInner">
								<a href="MostraDettagliItem?itemID=<%=bean.getId()%>"><span class="itemCardProductName"><%= bean.getNome()%></span></a>
							</div>
						</div>
				</div>
				
          			
          			<% if(bean.getQuantita()>0) { %>
							 <div class="box-down">
          						<div class="h-bg">
            						<div class="h-bg-inner"></div>
          						</div>
          					<a class="itemCardCart" href="javascript:addCart(<%=bean.getId()%>,1)">
            					<span class="itemCardPrice"><%= bean.calcolaPrezzo() %> <i class="fas fa-cart-plus iconCart"></i></span>
            					<span class="itemCardAddCart">
              					<span class="itemCardAddCartText">Aggiungi</span>
            					</span>
          					</a>
          					</div>
						<% } else{%>
							<div class="box-down">
          						<div class="h-bg">
            						<div class="h-bg-inner"></div>
          						</div>
          					<div class="itemCardCart" href="">
          						<span class="itemCardPrice">Esaurito</span>
            					<span class="itemCardAddCart">
              					<span class="itemCardAddCartText">Non dispoibile</span>
            					</span>
    						</div>
						</div>
						<% }%>
					</div>
			<% }} %>
		</div>
			<footer>
				<%@ include file="main/footer.jsp" %>
			</footer>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha256-OFRAJNoaD8L3Br5lglV7VyLRf0itmoBzWUoM+Sji4/8=" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/46a2d5ed1b.js" ></script>
		<script src="code.js" ></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script type="text/javascript"> cerca();</script>
	</body>
</html>