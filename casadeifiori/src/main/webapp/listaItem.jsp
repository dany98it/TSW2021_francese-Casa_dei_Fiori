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
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Casa dei Fiori</title>
		<script src="https://kit.fontawesome.com/46a2d5ed1b.js" ></script>
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
				<p> <%= bean.getDescrizione() %> </p>
				<ul>
					<% 
							User user=(User) sessione.getAttribute("loggedUser");
							if(!(user==null||user.getPermessi()!=Permessi.admin)){ %>
								<li> <a href="delete?itemID=<%=bean.getId()%>"><button type="button" >Elimina da db </button></a></li>
								<li> <a href="modifica?itemID=<%=bean.getId()%>"><button type="button" >Modifica </button></a> </li>
						<% } %>
						<li><a href="MostraDettagliItem?itemID=<%=bean.getId()%>"><button type="button" >Mostra dettagli </button></a> </li> 
						<% if(bean.getQuantita()>0) { %>
							<li><a href="addCart?itemID=<%=bean.getId()%>" ><button type="button" >Aggiungi al Carrello </button> </a> </li>
						<% } %>
				</ul>
			</div>
			<% }} %>
			</div>
			<br>
			<br>
			<br>
			<div class="cart">
				<input type="text" class="notShow" id="page" value="listaItem.jsp">
				<i>mosta carrello </i>
				<div class="show">
					<jsp:include page="main/showCart.jsp"/>
				</div>
			</div>
			<footer>
				<%@ include file="main/footer.jsp" %>
			</footer>
		</div>
		<script src="code.js" ></script>
	</body>
</html>