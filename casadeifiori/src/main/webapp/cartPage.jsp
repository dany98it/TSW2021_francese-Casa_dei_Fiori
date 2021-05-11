<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Carrello</title>
</head>
	<header>
		<%@ include file="main/header.jsp"%>
	</header>	
	<nav>
		<%@ include file="main/navigationBar.jsp"%>
	</nav>
<%
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
			<td><input name="quantity" id="<%="quantity"+bean.getItem().getId() %>" type="number" min="0" max="<%= bean.getItem().getQuantita() %>" value= "<%= bean.getQuantita() %>" 
			required onchange="addShop(<%=bean.getItem().getId() %>,<%= bean.getItem().getQuantita() %>);">
			<td><%= bean.getItem().calcolaPrezzo()%></td>
			<td id="errorQ">quantità invalita max <%= bean.getItem().getQuantita() %></td>
			
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
		<% if(sessione.getAttribute("loggedUser")!=null){ %>
			<a href="effettuaCheckOut" id="acquista"><button type="button" >Acquista </button></a>
		<% }else{%>
			<a href="logInPage.jsp" id="acquista"><button type="button" >Acquista </button></a>
		<% } %>
	<% }%>
	
	<script type="text/javascript">
	function addShop(id,quantitymax) {
		var quantity=document.getElementById("quantity"+id).value
		var page=document.getElementById("page").value
		if(quantity<=quantitymax){
			window.location.href ="addCart?itemID="+id+"&numItems="+quantity+"&page="+page;
		}else{
			document.getElementById("errorQ").style.display="block";
			document.getElementById("acquista").style.display="none";
		}
		
	}
	</script>
</body>
	<footer>
		<%@ include file="main/footer.jsp" %>
	</footer>
</html>