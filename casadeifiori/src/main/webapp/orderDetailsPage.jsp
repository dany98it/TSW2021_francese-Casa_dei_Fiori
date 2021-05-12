<%@page import="java.util.Collection"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dettagli Ordine</title>
</head>
	<header>
		<%@ include file="main/header.jsp"%>
	</header>	
	<nav>
		<%@ include file="main/navigationBar.jsp"%>
	</nav>
<%
	Ordine ordine = (Ordine) request.getAttribute("ordine");
	Collection<?> products;
	try{
		products = (Collection<?>) request.getAttribute("contenutoOrdine");
	}catch(Exception e){
		products = (Collection<?>) request.getAttribute("contenutoOrdine");
		e.printStackTrace();
	}
%>
<body>
	<table border= "1">
		<tr>
			<th> Item </th>
			<th> Quantità </th>
			<th> Iva Vendita </th>
			<th> Prezzo Vendita </th>
		</tr>
		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ContenutoOrdine bean = (ContenutoOrdine) it.next();
		%>
		<tr>
			<td><%= bean.getItem() %></td>
			<td><%= bean.getQuantita() %></td>
			<td><%= bean.getIvaVendita() %></td>
			<td><%= bean.getPrezzoVendita() %></td>
		</tr>
		<%
				}
		%>
			<tr>
				<td colspan="6">Prezzo totale : <%= ordine.getPrezzoTotale() %></td>
			</tr>
		<%
			} else {
				%>
				<tr>
					<td colspan="6">L'ordine non esiste</td>
				</tr>
				<%
					}
				%>
	</table>
</body>
<footer>
	<%@ include file="main/footer.jsp"%>
</footer>
</html>