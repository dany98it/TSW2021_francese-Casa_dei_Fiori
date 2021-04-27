<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="model.*"%>
    <%
    	Item i = (Item) request.getAttribute("item");
    	if(i==null){
    		response.sendRedirect("./MostraItem");	
    		return;
    	}
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dettagli Item</title>
</head>
<body>
	<h2>Dattagli Item</h2>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Nome</th>
			<th>Descrizione</th>
			<th>Prezzo</th>
			<th>Iva %</th>
			<th>Tipo</th>
			<th>Sconto %</th>
			<th>Quantità Disponibile</th>
			<th>Prezzo finale</th>
		</tr>
		<tr>
			<td><%= i.getId() %></td>
			<td><%= i.getNome() %></td>
			<td><%= i.getDescrizione() %></td>
			<td><%= i.getPrezzo() %></td>
			<td><%= i.getIva() %></td>
			<td><%= i.getTipo() %></td>
			<td><%= i.getSconto() %></td>
			<td><%= i.getQuantita() %></td>
			<th><%= i.calcolaPrezzo() %></th>
		</tr>
	</table>
</body>
</html>