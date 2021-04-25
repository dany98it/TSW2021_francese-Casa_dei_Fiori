<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%
  	ArrayList<?> products = (ArrayList<?>) session.getAttribute("carrello");
	if(products == null) {
		response.sendRedirect("./MostraItem");	
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Carrello</title>
</head>
<body>
	<h2>Carrello</h2>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Nome</th>
			<th>Descrizione</th>
			<th>Quantita</th>
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
			<td><a href="delete?itemID=<%=bean.getId()%>">Elimina da db</a> <br>
				<a href="product?itemID=<%=bean.getId()%>">Mostra dettagli</a> <br> 
				<a href="addCart?itemID=<%=bean.getId()%>"> Aggiungi ala Carrello </a> </td> 
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
</body>
</html>