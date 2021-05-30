<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="model.*"%>
<%
	Item i = (Item) request.getAttribute("item");
    if(i==null){
    	response.sendRedirect("./MostraItem");	
    	return;
    }%>
<!DOCTYPE html>
<html lang="it">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta charset="utf-8">
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
			<h1 id="titoloItem" class="titoloItem"><%= i.getNome() %></h1>
			<div class="contenerSuperiore">
				<div>
					<div id="galleriaItem" class="galleria">
						<div id="imgXL"class="w3-content" style="max-width:1200px">
    						<div id="listimg" class="w3-row-padding w3-section">
							</div>
						</div>
					</div>
					<h6>caratterisiche</h6>
					<div id="caratterisicheItem" class="caratterisiche"></div>
					<h6>tag</h6>
					<div id="tagItem" class="tag"></div>
					<h6>descrizione</h6>
					<div id="descrizioneItem" class="descrizione"><%= i.getDescrizione() %></div>
				</div>
				<div>
					<div class="infoItem">
						<h6>prezzo</h6>
						<div id="prezzoItem" class="prezzo"><%= i.calcolaPrezzo() %> &euro;</div>
						<label for="quantity">Quantit&agrave; </label>
						<select class="quantity" name="quantity" id="quantityItem">
							<% for(int x=1;x<=i.getQuantita();x++){ %>
								<option value="<%= x %>"> <%= x %> </option>
							<%} %>
						</select> <br>
						<button>Aggiungi al carrello</button>		
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