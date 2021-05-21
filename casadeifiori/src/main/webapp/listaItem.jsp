<%@page import="java.util.*,model.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
	Collection<?> products = (Collection<?>) request.getAttribute("itemsCollection");
	if(products == null) {
		response.sendRedirect("./MostraItem");	
		return;
	} %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Casa dei Fiori</title>
		<link rel=StyleSheet href="style.css" type="text/css">
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
			<div class="itemListing">
			<%
					if (products != null && products.size() != 0) {
					Iterator<?> it = products.iterator();
					while (it.hasNext()) {
						Item bean = (Item) it.next();
				%>
			<div class= "itemCard">
				<img alt="itemCarrello" src="img/occhioChiuso.svg">
				<h1><%= bean.getNome() %></h1>
				<p class="prezzoItemCard"><%= bean.calcolaPrezzo() %></p>
				<ul>
					<% 
							User user=(User) sessione.getAttribute("loggedUser");
							if(!(user==null||user.getPermessi()!=Permessi.admin)){ %>
								<li> <a href="delete?itemID=<%=bean.getId()%>"><button type="button" class="itemCardBtn">Elimina da db </button></a></li>
								<li> <a href="modifica?itemID=<%=bean.getId()%>"><button type="button" class="itemCardBtn">Modifica </button></a> </li>
						<% } %>
						<li><a href="MostraDettagliItem?itemID=<%=bean.getId()%>"><button type="button" class="itemCardBtn">Mostra dettagli </button></a> </li> 
						<% if(bean.getQuantita()>0) { %>
							<li><a href="addCart?itemID=<%=bean.getId()%>" ><button type="button" class="itemCardBtn">Aggiungi al Carrello </button> </a> </li>
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
		<script src="https://kit.fontawesome.com/46a2d5ed1b.js" ></script>
		<script src="code.js" ></script>
	</body>
</html>