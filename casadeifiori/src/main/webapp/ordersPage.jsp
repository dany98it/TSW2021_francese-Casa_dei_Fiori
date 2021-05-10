<%@page import="java.util.Collection"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	Collection<?> ordini = (Collection<?>) request.getAttribute("ordiniEffettuati");
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>I miei ordini</title>
</head>
<header>
		<%@ include file="main/header.jsp"%>
	</header>
	<nav>
		<%@ include file="main/navigationBar.jsp"%>
	</nav>
<body>
	<h1> Ordini effettuati</h1>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Tipo Ordine</th>
			<th>Tipo Pagamento</th>
			<th>Prezzo Totale</th>
			<th>Data Ordine</th>
		</tr>
		<%
			if (ordini != null && ordini.size() != 0) {
				Iterator<?> it = ordini.iterator();
				while (it.hasNext()) {
					Ordine ordine = (Ordine) it.next();
		%>
		<tr>
			<td><%= ordine.getId() %></td>
			<td><%= ordine.getTipoOrdine().toString() %></td>
			<td><%= ordine.getTipoPagamento().toString() %></td>
			<td><%= ordine.getPrezzoTotale() %></td>
			<td><%= ordine.getDataOrdine().toString() %></td>

		</tr>
		<% } }else{  %>
			<tr>
			<td colspan="6">Non ci sono ordini effettuati</td>
			</tr>
		<% }%>
	</table>
</body>
	<footer>
		<%@ include file="main/footer.jsp" %>
	</footer>
</html>