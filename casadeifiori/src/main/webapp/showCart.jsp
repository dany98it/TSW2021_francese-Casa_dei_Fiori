<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%
  	HttpSession sessione = request.getSession(true);
  	Carrello cart;
  	if(sessione.isNew()){
  		cart = new Carrello();
     	request.getSession().setAttribute("carrello", cart);
  	}
  	else{
  		cart = (Carrello) request.getSession(true).getAttribute("carrello");
  		if(cart==null){
  			cart=new Carrello();
  		}
  	}
  	Collection<?> products;
  	try{
  		products = (Collection<?>) cart.getItemsOrdinati();
  	}catch(Exception e){
  		products= (Collection<?>) cart.getItemsOrdinati();
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
			<th>Quantità</th>
			<th>Prezzo</th>
		</tr>
		<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ItemCarrello bean = (ItemCarrello) it.next();
		%>
		<tr>
			<td><%= bean.getItem().getId() %></td>
			<td><%= bean.getItem().getNome() %></td>
			<td><%= bean.getItem().getDescrizione() %></td>
			<td><input name="quantity" id="<%="quantity"+bean.getItem().getId() %>" type="number" min="0" value= "<%= bean.getQuantita() %>" 
			required onchange="addShop(<%=bean.getItem().getId() %>);">
			<td><%= bean.getItem().calcolaPrezzo()%></td>
			
		</tr>
		<tr>
			<td colspan="6">Prezzo parziale: <%= bean.getCostoTotale()%></td>
		</tr>
		<%
				}
		%>
			<tr>
				<td colspan="6">Prezzo totale : <%= cart.getCostoTotale()%></td>
			</tr>
		<%
			} else {
		%>
		<tr>
			<td colspan="6">Il Carrello è vuoto</td>
		</tr>
		<%
			}
		%>
	</table>

	<%  if(cart!=null && products != null && products.size() != 0){
		%>
		<a href="effettuaCheckOut"><button type="button" >Acquista </button></a>
	<% }%>
	
	<script type="text/javascript">
	function addShop(id) {
		var quantity=document.getElementById("quantity"+id).value
		window.location.href ="addCart?itemID="+id+"&numItems="+quantity;
	}
		
	</script>
</body>
</html>