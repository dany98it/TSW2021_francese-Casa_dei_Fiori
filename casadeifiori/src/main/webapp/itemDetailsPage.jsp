<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="model.*"%>
<%
	Item i = (Item) request.getAttribute("item");
    if(i==null){
    	response.sendRedirect("./MostraItem");	
    	return;
    }%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta charset="ISO-8859-1">
		<title>Dettagli Item</title>
		<link rel=StyleSheet href="style.css" type="text/css">
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
			<h1 class="titoloItem"><%= i.getNome() %></h1>
			<div class="contenerSuperiore">
				<div>
					<div class="galleria"></div>
					<div class="caratterisiche"></div>
					<div class="tag"></div>
					<div class="descrizione"><%= i.getDescrizione() %></div>
				</div>
				<div>
					<div class="infoItem">
						<div class="prezzo"><%= i.calcolaPrezzo() %> &euro;</div>
						<label for="quantity">Quantit&agrave; </label>
						<select class="quantity" name="quantity" id="quantity">
							<%
								for(int x=1; x<=i.getQuantita(); x++){ %>
									<option value="<%=x%>"><%=x%></option>
								<% } %>
						</select> <br>
						<button onclick='window.location.href ="addCart?itemID=<%=i.getId()%>&addItem="+document.getElementById("quantity").value ;'>Aggiungi al carrello</button>		
					</div>
				</div>
			</div>
			<footer>
				<%@ include file="main/footer.jsp" %>
			</footer>
		</div>
		<script src="https://kit.fontawesome.com/46a2d5ed1b.js" ></script>
		<script src="code.js" ></script>
	</body>
</html>