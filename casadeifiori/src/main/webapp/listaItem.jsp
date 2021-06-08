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
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha256-aAr2Zpq8MZ+YA/D6JtRD3xtrwpEz2IqOS+pWD/7XKIw=" crossorigin="anonymous" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
				<img alt="itemCarrello" src="img/occhioChiuso.svg">
				<h1 class="itemTitle"><a href="MostraDettagliItem?itemID=<%=bean.getId()%>"><%= bean.getNome()%></a></h1>
				<p class="prezzoItemCard"><%= bean.calcolaPrezzo() %></p>
				<ul>
					<% 
							User user=(User) sessione.getAttribute("loggedUser");
							if(!(user==null||user.getPermessi()!=Permessi.admin)){ %>
								<li> <a href="delete?itemID=<%=bean.getId()%>"><button type="button" class="itemCardBtn">Elimina da db </button></a></li>
								<li> <a href="modifica?itemID=<%=bean.getId()%>"><button type="button" class="itemCardBtn">Modifica </button></a> </li>
						<% } %>
						<% if(bean.getQuantita()>0) { %>
							<li><a href="javascript:addCart(<%=bean.getId()%>,1)" ><button type="button" class="itemCardBtn">Aggiungi al Carrello </button> </a> </li>
						<% } %>
				</ul>
			</div>
			<% }} %>
			</div>
			<br>
			<br>
			<br>
			<footer>
				<%@ include file="main/footer.jsp" %>
			</footer>
		</div>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha256-OFRAJNoaD8L3Br5lglV7VyLRf0itmoBzWUoM+Sji4/8=" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/46a2d5ed1b.js" ></script>
		<script src="code.js" ></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script type="text/javascript"> cerca();</script>
	</body>
</html>