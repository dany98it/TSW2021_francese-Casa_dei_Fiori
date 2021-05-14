<%@page import="java.util.Collection"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<% Collection<?> ordini = (Collection<?>) request.getAttribute("ordiniEffettuati"); %>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>I miei ordini</title>
		<script src="https://kit.fontawesome.com/46a2d5ed1b.js" ></script>
		<link rel=StyleSheet href="style.css" type="text/css">
	</head>
	<body>
		<header>
			<%@ include file="main/header.jsp"%>
		</header>
		<nav>
			<%@ include file="main/navigationBar.jsp"%>
		</nav>
		<h1> Ordini effettuati</h1>
		<table border="1">
			<tr>
				<th>ID</th>
				<th>Tipo Ordine</th>
				<th>Tipo Pagamento</th>
				<th>Prezzo Totale</th>
				<th>Data Ordine</th>
				<th>Dettagli</th>
			</tr>
			<%
				if (ordini != null && ordini.size() != 0) {
				Iterator<?> it = ordini.iterator();
				while (it.hasNext()) {
					Ordine ordine = (Ordine) it.next(); %>
					<tr>
						<td><%= ordine.getId() %></td>
						<td><%= ordine.getTipoOrdine().toString() %></td>
						<td><%= ordine.getTipoPagamento().toString() %></td>
						<td><%= ordine.getPrezzoTotale() %></td>
						<td><%= ordine.getDataOrdine().toString() %></td>
						<td> <a href="MostraDettagliOrdine?orderID=<%=ordine.getId()%>"><button type="button" >Mostra dettagli </button></a> <br>  </td>
					</tr>
				<% } 
			}else{  %>
				<tr>
					<td colspan="6">Non ci sono ordini effettuati</td>
				</tr>
			<% } %>
		</table>
		<footer>
			<%@ include file="main/footer.jsp" %>
		</footer>
	</body>
</html>