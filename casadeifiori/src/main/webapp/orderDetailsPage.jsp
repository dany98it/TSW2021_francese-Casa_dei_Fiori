<%@page import="java.util.Collection"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="ISO-8859-1">
<title>Dettagli Ordine</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="main/style.jsp"%>
</head>
<body>
	<%@ include file="main/script.jsp"%>
	<%@ include file="main/menuMobile.jsp"%>
		<header>
			<%@ include file="main/header.jsp"%>
		</header>
		<nav>
			<%@ include file="main/navigationBar.jsp"%>
		</nav>
	<div id="main" class="mainCart">
		<div>
			<a href="MostraOrdiniEffettuati">Torna ai miei ordini</a>
		</div>
		
		<%
				Ordine ordine = (Ordine) request.getAttribute("ordine");
				Collection<?> products;
				try{
					products = (Collection<?>) request.getAttribute("contenutoOrdine");
				}catch(Exception e){
					products = (Collection<?>) request.getAttribute("contenutoOrdine");
					e.printStackTrace();
				} %>
		<div class="basket">
			<div class="basket-labels">
				<ul>
					<li class="item item-heading">Item</li>
					<li class="quantity">Iva Vendita</li>
					<li class="price">Quantità</li>
					<li class="subtotal">Prezzo Vendita</li>
				</ul>
			</div>

			<%
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ContenutoOrdine bean = (ContenutoOrdine) it.next(); %>
			<div class="basket-product">
				<div class="item">
					<div class="product-image">
						<img src="img/fiori2.jpg" alt="Immagine prodotto non disponibile"
							class="product-frame">
					</div>
					<div class="product-details">
						<h1>
							<strong><span class="item-quantity"><%= bean.getQuantita() %>
									x</span></strong>
							<%= bean.getItem() %></h1>
						<p>
							<strong></strong>
						</p>
						<p>
							Codice prodotto -
							<%= bean.getItem() %></p>
					</div>
				</div>
				<div id="ivaOrder" class="price"><%= bean.getIvaVendita() %></div>
				<div class="cartItemQuantity">
					<div class="quantity" id="<%="quantity"+bean.getItem() %>">
						<%= bean.getQuantita() %>
					</div>
				</div>
				<div class="subtotal"><%=String.format(Locale.ENGLISH,"%.2f", bean.getPrezzoVendita())%></div>
			</div>
			<% }}%>	
		</div>
		<aside>
			<div class="summary">
				<div class="summary-total-items">
					<span class="total-items"></span> <p>Dettagli ordine ID <%= ordine.getId() %></p>
				</div>
				<div class="summary-subtotal">
					<div class="subtotal-title">Data Ordine</div>
					<div class="subtotal-value final-value" id="basket-subtotal2"><%= ordine.getDataOrdine() %></div>
				</div>
				<div class="summary-subtotal">
					<div class="subtotal-title">Tipo Di Pagamento</div>
					<div class="subtotal-value final-value" id="basket-subtotal2"><%= ordine.getTipoPagamento() %></div>
				</div>
				<div class="summary-subtotal">
					<div class="subtotal-title">Tipo Ordine</div>
					<div class="subtotal-value final-value" id="basket-subtotal2"><%= ordine.getTipoOrdine() %></div>
				</div>
				<div class="summary-total">
					<div class="total-title">Totale</div>
					<div class="total-value final-value" id="basket-total"><%= String.format(Locale.ENGLISH,"%.2f", ordine.getPrezzoTotale())%></div>
				</div>
			</div>
		</aside>
		</div>
		<footer>
			<%@ include file="main/footer.jsp"%>
		</footer>
	<script type="text/javascript"> cerca();</script>
</body>
</html>