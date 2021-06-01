<%@page import="java.util.Collection"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="it">
	<head>
		<meta charset="ISO-8859-1">
		<title>Dettagli Ordine</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel=StyleSheet href="style.css" type="text/css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	</head>
	<body>
		<%@ include file="main/menuMobile.jsp" %>
		<div id="main">
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
				} %>
			<table border= "1">
				<tr>
					<th> Item </th>
					<th> Quantità </th>
					<th> Iva Vendita </th>
					<th> Prezzo Vendita </th>
					<th> Dettagli </th> 
				</tr>
				<%
					if (products != null && products.size() != 0) {
						Iterator<?> it = products.iterator();
						while (it.hasNext()) {
							ContenutoOrdine bean = (ContenutoOrdine) it.next(); %>
							<tr>
								<td><%= bean.getItem() %></td>
								<td><%= bean.getQuantita() %></td>
								<td><%= bean.getIvaVendita() %></td>
								<td><%= bean.getPrezzoVendita() %></td>
								<td><a href="MostraDettagliItem?itemID=<%=bean.getItem()%>"><button type="button" >Mostra dettagli </button> </a> <br></td> 
							</tr>
						<% } %>
					<tr>
						<td colspan="6">Prezzo totale : <%= ordine.getPrezzoTotale() %></td>
					</tr>
				<% } else { %>
					<tr>
						<td colspan="6">L'ordine non esiste</td>
					</tr>
				<% } %>
			</table>
			<footer>
				<%@ include file="main/footer.jsp"%>
			</footer>
		</div>
		<script src="https://kit.fontawesome.com/46a2d5ed1b.js" ></script>
		<script src="code.js" ></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script type="text/javascript"> cerca();</script>
	</body>
</html>