<%@page import="model.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	Collection<?> products = (Collection<?>) request.getAttribute("itemsCollection");
	if(products == null) {
		response.sendRedirect("./MostraItem");	
		return;
	}
%>

<!DOCTYPE html>
<html>
<%@ page import="java.util.*, model.Item"%>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Casa dei Fiori</title>
</head>

<body>
	<h2>Products</h2>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Nome</th>
			<th>Descrizione</th>
			<th>categoria</th>
			<th>prezzo</th>
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
			<%
				double costo=bean.getPrezzo();
				costo=costo+((costo*bean.getIva())/100);
				costo=costo-((costo*bean.getSconto())/100);
			%>
			<td><%= String.format("%.2f", costo) %></td>
			<td><a href="delete?itemID=<%=bean.getId()%>">Elimina da db</a> <br>
				<a href="product?itemID=<%=bean.getId()%>">Mostra dettagli</a> <br> 
				<a href="addCart?itemID=<%=bean.getId()%>">Aggiungi al Carrello</a> </td> 
		</tr>
		<%
				}
			} else {
		%>
		<tr>
			<td colspan="6">No products available</td>
		</tr>
		<%
			}
		%>
	</table>