<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
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
  	} %>
<!DOCTYPE html>
<html>
	<h2>Carrello</h2>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Nome</th>
			<th>Descrizione</th>
			<th>Quantit�</th>
			<th>Prezzo</th>
		</tr>
		<%
			if (products != null && products.size() != 0) {
			Iterator<?> it = products.iterator();
			while (it.hasNext()) {
				ItemCarrello bean = (ItemCarrello) it.next(); %>
				<tr>
					<td><%= bean.getItem().getId() %></td>
					<td><%= bean.getItem().getNome() %></td>
					<td><%= bean.getItem().getDescrizione() %></td>
					<td><input name="quantity" id="<%="quantity"+bean.getItem().getId() %>" type="number" min="0" max="<%= bean.getItem().getQuantita() %>" value= "<%= bean.getQuantita() %>" 
						required onchange="addShop(<%=bean.getItem().getId() %>,<%= bean.getItem().getQuantita() %>);">
					<td><%= bean.getItem().calcolaPrezzo()%></td>
					<td id="errorQ">quantit� invalita max <%= bean.getItem().getQuantita() %></td>
				</tr>
				<tr>
					<td colspan="6">Prezzo parziale: <%= bean.getCostoTotale()%></td>
				</tr>
			<% } %>
			<tr>
				<td colspan="6">Prezzo totale : <%= cart.getCostoTotale()%></td>
			</tr>
		<% } else { %>
			<tr>
				<td colspan="6">Il Carrello � vuoto</td>
			</tr>
		<% } %>
	</table>
	<%  if(cart!=null && products != null && products.size() != 0){
			if(sessione.getAttribute("loggedUser")!=null){ %>
				<a href="effettuaCheckOut" id="acquista"><button type="button" >Acquista </button></a>
			<% }else{ %>
			<a href="logInPage.jsp" id="acquista"><button type="button" >Acquista </button></a>
		<% } %>
	<% } %>
</html>