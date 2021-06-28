<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.*"%>
<%
	Item i = (Item) request.getAttribute("item");
	ArrayList<Integer> galleriaItem = (ArrayList<Integer>) request.getAttribute("galleriaItem");
	ArrayList<String> tag = (ArrayList<String>) request.getAttribute("tag");
	ArrayList<PrintCaratteristica> c = (ArrayList<PrintCaratteristica>) request.getAttribute("c");
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
<%@ include file="main/style.jsp"%>
</head>
<body>
	<%@ include file="main/script.jsp"%>
	<%@ include file="main/menuMobile.jsp"%>
	<div id="main">
		<header>
			<%@ include file="main/header.jsp"%>
		</header>
		<nav>
			<%@ include file="main/navigationBar.jsp"%>
		</nav>
		<h1 id="titoloItem" class="titoloItem HeaderInfoBox"><%= i.getNome() %></h1>
		<div class="contenerSuperiore">
			<div>
				<div id="galleriaItem" class="galleria">
					<div id="imgXL" class="w3-content" style="max-width: 1200px">
						<% int count=1;
								for(Integer img: galleriaItem){%>
						<img class="mySlides" src="mostraImg?imgID=<%=img%>"
							style="width:100%;
								<%if(count!=1){%>
									<%="display:none"%>
								<%}%>">
						<% count++; }%>
						<div id="listimg" class="w3-row-padding w3-section">
							<% int count1=1;
    							for(Integer img: galleriaItem){%>
							<div class="w3-col s4">
								<img class="demo w3-opacity w3-hover-opacity-off"
									src="mostraImg?imgID=<%=img%>"
									style="width: 100%; cursor: pointer"
									onclick="currentDiv(<%=count1%>)">
							</div>
							<% count1++; }%>
						</div>
					</div>
				</div>
				<h3>caratterisiche</h3>
				<div id="caratterisicheItem" class="caratterisiche">
					<%for(PrintCaratteristica printCaratteristica:c){%>
					<div>
						<h5 style="display: inline-block;"><%=printCaratteristica.getNome()%>:
						</h5>
						<%for(String s:printCaratteristica.getValore()){%>
						<%if(s.startsWith("#")){
									String[] s1=s.split(":");%>
						<i class="fas fa-circle" style="color:<%=s1[0]%>"
							onmouseenter="cShow('<%=s1[0]+s1[1]%>')"
							onmouseleave="cNotShow('<%=s1[0]+s1[1]%>')"></i>
						<p id="<%=s1[0].replace("#", "")+s1[1]%>" class="caratterisicap"><%=s1[1]%></p>
						<%}else{%>
						<p class="tagp"><%=s%></p>
						<%}%>
						<%}%>
					</div>
					<%}%>
				</div>
				<h3>tag</h3>
				<div id="tagItem" class="tag">
					<% for(String t: tag){%>
					<p class="tagp"><%=t %></p>
					<%}%>
				</div>
				<h3>descrizione</h3>
				<div id="descrizioneItem" class="descrizione"><%= i.getDescrizione() %></div>
			</div>
			<div>
				<div class="infoItem">
					<h3>Acquista</h3>
					<div id="prezzoItem" class="prezzo"><%=String.format(Locale.ENGLISH,"%.2f",  i.calcolaPrezzo()) %>
						&euro;
					</div>
					<label for="quantity">Quantit&agrave; </label> <select
						class="quantity" name="quantity" id="quantityItem">
						<% for(int x=1;x<=i.getQuantita();x++){ %>
						<option value="<%= x %>">
							<%= x %>
						</option>
						<%} %>
					</select> <br>
					<% if(i.getQuantita()>0) { %>
					<button
						onclick="addCart(<%= i.getId() %>,$('#quantityItem').val())">Aggiungi
						al carrello</button>
					<% } else{%>
					<div>
						<p>Prodotto non disponibile al momento</p>
					</div>
					<% }%>
				</div>
			</div>
		</div>
		<footer>
			<%@ include file="main/footer.jsp"%>
		</footer>
	</div>
	<script type="text/javascript"> cerca();</script>
</body>
</html>