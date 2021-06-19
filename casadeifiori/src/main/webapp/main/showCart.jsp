<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

<h2>Carrello</h2>
<div class="cartPage">
	<!--  <div class="basket-module">
        	<label for="promo-code">Enter a promotional code</label>
        	<input id="promo-code" type="text" name="promo-code" maxlength="5" class="promo-code-field">
        <button class="promo-code-cta">Apply</button>
      </div>
      -->
</div>
<div class="basket-labels">
	<ul>
		<li class="item item-heading">Item</li>
		<li class="price">Prezzo</li>
		<li class="quantity">Quantità</li>
		<li class="subtotal">Prezzo</li>
	</ul>
</div>
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
				ItemCarrello bean = (ItemCarrello) it.next(); %>
	<tr>
		<td><%= bean.getItem().getId() %></td>
		<td><%= bean.getItem().getNome() %></td>
		<td><%= bean.getItem().getDescrizione() %></td>
		<td><select
			onchange="addShop(<%=bean.getItem().getId() %>,<%= bean.getItem().getQuantita() %>);"
			class="quantity" name="quantity"
			id="<%="quantity"+bean.getItem().getId() %>">
				<% for(int x=0;x<=bean.getItem().getQuantita();x++){ %>
				<option value="<%= x %>"
					<%if(x==bean.getQuantita()||(x==bean.getItem().getQuantita()&&x<bean.getQuantita())){%>
					selected="selected" <%}%>>
					<%= x %>
				</option>
				<%} %>
		</select></td>
		<td><%= bean.getItem().calcolaPrezzo()%></td>
		<td id="errorQ">quantità invalita max <%= bean.getItem().getQuantita() %></td>
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
		<td colspan="6">Il Carrello è vuoto</td>
	</tr>
	<% } %>
</table>
<%  if(cart!=null && products != null && products.size() != 0){
			if(sessione.getAttribute("loggedUser")!=null){ %>
<a href="EffettuaCheckOut" id="acquista"><button type="button">Acquista
	</button></a>
<% }else{ %>
<a href="logInPage.jsp" id="acquista"><button type="button">Acquista
	</button></a>
<% } %>
<% } %>