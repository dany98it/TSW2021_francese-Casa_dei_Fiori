<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="model.*"%>
<%
	Item i = (Item) request.getAttribute("item");
	ArrayList<Integer> galleriaItem = (ArrayList<Integer>) request.getAttribute("galleriaItem");
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
		<%@ include file="main/style.jsp" %>
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
							<% int count=1;
								for(Integer img: galleriaItem){%>
								<img class="mySlides" src="mostraImg?imgID=<%=img%>" style="width:100%;
								<%if(count!=1){%>
									<%="display:none"%>
								<%}%>">
							<% count++; }%>
    						<div id="listimg" class="w3-row-padding w3-section">
    						<% int count1=1;
    							for(Integer img: galleriaItem){%>
								<div class="w3-col s4">
									<img class="demo w3-opacity w3-hover-opacity-off" src="mostraImg?imgID=<%=img%>" style="width:100%;cursor:pointer" onclick="currentDiv(<%=count1%>)">
								</div>
							<% count1++; }%>
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
						
						<% if(i.getQuantita()>0) { %>
						<button onclick="addCart(<%= i.getId() %>,$('#quantityItem').val())">Aggiungi al carrello</button>
						<% } else{%>
							<div>
								<p>Prodotto non disponibile al momento</p>
							</div>
						<% }%>
					</div>
				</div>
			</div>
			<footer>
				<%@ include file="main/footer.jsp" %>
			</footer>
		</div>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha256-OFRAJNoaD8L3Br5lglV7VyLRf0itmoBzWUoM+Sji4/8=" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/46a2d5ed1b.js" ></script>
		<script src="code.js" ></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script type="text/javascript"> cerca();</script>
	</body>
</html>