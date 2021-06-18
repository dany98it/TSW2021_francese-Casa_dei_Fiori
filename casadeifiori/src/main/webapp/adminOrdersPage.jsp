<%@page import="java.util.Collection"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<% Collection<?> ordini = (Collection<?>) request.getAttribute("ordiniEffettuati"); %>
<html lang="it">
	<head>
		<meta charset="utf-8">
		<title>I miei ordini</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<%@ include file="main/style.jsp" %>
	</head>
	<body>
		<%@ include file="main/script.jsp" %>
		<%@ include file="main/menuMobile.jsp" %>
		<div id="main">
			<header>
				<%@ include file="main/header.jsp"%>
			</header>
			<nav>
				<%@ include file="main/navigationBar.jsp"%>
			</nav>
			<h1> Ordini effettuati</h1>
			<form action="adminMostraOrdini" method="post"> 
				<label for="customerName">Nome Cliente</label>
				<input type="text" name="customerName">
				<label for="startDate">Da: </label>
				<input type="date" name="startDate">
				<label for="endDate"> A : </label>
				<input type="date" name="endDate">
				<input type="submit" value="Filtra">
			</form>
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
		</div>
		<script type="text/javascript"> cerca();</script>
	</body>
</html>