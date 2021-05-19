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
		<link rel=StyleSheet href="style.css?ts=<?=time()?>&quot" type="text/css">
	</head>
	<body>
		<header>
			<%@include file="main/header.jsp" %>
		</header>
		<nav>
			<%@ include file="main/navigationBar.jsp"%>
		</nav>
		<h2>Products</h2>
		<table border="1">
			<tr>
				<th>ID</th>
				<th>Nome</th>
				<th>Descrizione</th>
				<th>Categoria</th>
				<th>Prezzo</th>
				<th>Quantità Disponibile</th>
				<th>Azioni</th>
			</tr>
			<%
				if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					Item bean = (Item) it.next();
			%>
			<tr>
				<td><%= bean.getId() %></td>
				<td><%= bean.getNome() %></td>
				<td><%= bean.getDescrizione() %></td>
				<td><%= bean.getTipo().toString() %></td>
				<td><%= bean.calcolaPrezzo() %></td>
				<td><%= bean.getQuantita() %></td>
				<td>
					<% 
						User user=(User) sessione.getAttribute("loggedUser");
						if(!(user==null||user.getPermessi()!=Permessi.admin)){ %>
							<a href="delete?itemID=<%=bean.getId()%>"><button type="button" >Elimina da db </button></a> <br>
					<% } %>
					<a href="MostraDettagliItem?itemID=<%=bean.getId()%>"><button type="button" >Mostra dettagli </button></a> <br> 
					<% if(bean.getQuantita()>0) { %>
						<a href="addCart?itemID=<%=bean.getId()%>" onclick="alertAddCart()"><button type="button" >Aggiungi al Carrello </button> </a> 
					<% } %>
				</td> 
			</tr>
			<% }
			} else { %>
				<tr>
					<td colspan="6">No products available</td>
				</tr>
			<% } %>
		</table>
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
		<script src="code.js" ></script>
	</body>
</html>