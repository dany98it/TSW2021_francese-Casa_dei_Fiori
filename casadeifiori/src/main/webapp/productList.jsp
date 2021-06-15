<%@page import="java.util.*,model.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
	Collection<?> products = (Collection<?>) request.getAttribute("itemsCollection");
	if(products == null) {
		response.sendRedirect("./MostraItem");	
		return;
	} %>
<!DOCTYPE html>
<html lang="it">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="Content-Type" content="text/html; utf-8">
		<title>Casa dei Fiori</title>
		<link rel=StyleSheet href="style.css" type="text/css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"  />
	</head>
<body>
	<%@ include file="main/menuMobile.jsp" %>
			<div id="main">
				<header>
					<%@include file="main/header.jsp" %>
				</header>
				<nav>
					<%@ include file="main/navigationBar.jsp"%>
				</nav>
				<h2>Products</h2>
					<div id="itemListFilter">
		
				<button id="submitItemFitler" value="filtra" >filtra</button>
			
			</div>
	<div class="container page-wrapper">
  		<div class="page-inner">
    		<div class="row">
    		
     			<div class="itemCard">
        			<div class="box-up">
          				<img class="img" src="http://code.slicecrowd.com/labs/4/images/t-shirt.png" alt="">
          					<div class="img-info">
            					<div class="info-inner">
              						<span class="p-name">I feel like Pablo</span>
              						<span class="p-company">Yeezy</span>
            					</div>
            					<div class="a-size">Available sizes : <span class="size">S , M , L , XL</span></div>
          					</div>
        			</div>

        	<div class="box-down">
          		<div class="h-bg">
            	<div class="h-bg-inner"></div>
          	</div>

          	<a class="cart" href="#">
            	<span class="price">$120</span>
            	<span class="add-to-cart">
              	<span class="txt">Add in cart</span>
            	</span>
          	</a>
       		 		</div>
      			</div>
      			</div>
				<ul>
					<% 
							User user=(User) sessione.getAttribute("loggedUser");
							if(!(user==null||user.getPermessi()!=Permessi.admin)){ %>
								<li> <a href="delete?itemID=<%=bean.getId()%>"><button type="button" class="itemCardBtn">Elimina da db </button></a></li>
								<li> <a href="modifica?itemID=<%=bean.getId()%>"><button type="button" class="itemCardBtn">Modifica </button></a> </li>
						<% } %>
						<% if(bean.getQuantita()>0) { %>
							<li><a href="javascript:addCart(<%=bean.getId()%>,1)" ><button type="button" class="itemCardBtn">Aggiungi al Carrello </button> </a> </li>
						<% } %>
				</ul>
			</div>
    		</div>
  		</div>
	</div>
</div>
</body>
</html>


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
					<td><select  onchange="addShop(<%=bean.getItem().getId() %>,<%= bean.getItem().getQuantita() %>);" class="quantity" name="quantity" id="<%="quantity"+bean.getItem().getId() %>">
						<% for(int x=0;x<=bean.getItem().getQuantita();x++){ %>
							<option value="<%= x %>" 
								<%if(x==bean.getQuantita()||(x==bean.getItem().getQuantita()&&x<bean.getQuantita())){%>
									selected="selected"
								<%}%>
							> <%= x %> </option>
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