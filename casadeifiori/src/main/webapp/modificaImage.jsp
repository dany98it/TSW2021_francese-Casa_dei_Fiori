<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.*"%>
<%
	Item i = (Item) request.getAttribute("item");
	ArrayList<Integer> galleriaItem = (ArrayList<Integer>) request.getAttribute("galleriaItem");
	ArrayList<String> tag = (ArrayList<String>) request.getAttribute("tag");
	ArrayList<PrintCaratteristica> c = (ArrayList<PrintCaratteristica>) request.getAttribute("c");
%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Casa dei fiori</title>
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
		<%	boolean isAdmin;
					if(sessione.getAttribute("isAdmin")!=null){
						isAdmin=(boolean) sessione.getAttribute("isAdmin"); 
					} else{
						isAdmin=false;
					}
					if(isAdmin){ %>
		<div class="insertItem">
			<div>
				<form action="saveImg" method="post" enctype="multipart/form-data">
					<label for="img">immagini:</label><br> <input type="file"
						id="img" name="img" accept="image/*" multiple="multiple"
						required="required" maxlength="4294967296"> <br>
					<div id="selectedFiles"></div>
					<input type="submit" value="Add"><input type="reset"
						value="Reset">
				</form>
			</div>
			<div>
				<h1 id="titoloItem" class="titoloItem"><%= i.getNome() %></h1>
				<div class="contenerSuperiore">
					<div>
						<div id="galleriaItem" class="galleria">
							<div id="imgXL" class="w3-content" style="max-width: 1200px">
								<% int count=1;
								for(Integer img: galleriaItem){%>
								<img id="imgXXL<%=img%>" class="mySlides"
									src="mostraImg?imgID=<%=img%>"
									style="width:100%;
								<%if(count!=1){%>
									<%="display:none"%>
								<%}%>">
								<% count++; }%>
								<div id="listimg" class="w3-row-padding w3-section">
									<% int count1=1;
    							for(Integer img: galleriaItem){%>
									<div id="imgL<%=img%>" class="w3-col s4">
										<img class="demo w3-opacity w3-hover-opacity-off"
											src="mostraImg?imgID=<%=img%>"
											style="width: 100%; cursor: pointer"
											onclick="currentDiv(<%=count1%>)">
										<button type="button" onclick="rimuoviImg(<%=img%>)">elimina</button>
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
						<h6>descrizione</h6>
						<div id="descrizioneItem" class="descrizione"><%= i.getDescrizione() %></div>
					</div>
					<div>
						<div class="infoItem">
							<h3>Acquista</h3>
							<div id="prezzoItem" class="prezzo"><%= i.calcolaPrezzo() %>
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
							<button>Aggiungi al carrello</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<% } else { %>
		<%@ include file="main/nonPermessi.jsp"%>
		<% } %>
		<footer>
			<%@ include file="main/footer.jsp"%>
		</footer>
	</div>
	<script type="text/javascript">
			initFileSelect();
			cerca();
		</script>
</body>
</html>