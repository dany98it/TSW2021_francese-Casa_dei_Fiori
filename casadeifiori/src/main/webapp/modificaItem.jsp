<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.*"%>
<%
Item i = (Item) request.getAttribute("item");
ArrayList<Integer> galleriaItem = (ArrayList<Integer>) request.getAttribute("galleriaItem");
ArrayList<String> tag3 = (ArrayList<String>) request.getAttribute("tag");
ArrayList<PrintCaratteristica> c = (ArrayList<PrintCaratteristica>) request.getAttribute("c");
if (i == null) {
	response.sendRedirect("./MostraItem");
	return;
}
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
		<%
		boolean isAdmin;
		if (sessione.getAttribute("isAdmin") != null) {
			isAdmin = (boolean) sessione.getAttribute("isAdmin");
		} else {
			isAdmin = false;
		}
		if (isAdmin) {
		%>
		<h1 class="HeaderInfoBox">Modifica item</h1>
		<div class="insertItem">
			<div class="formsAddItem contenerSuperiore">
				<form method="post" action="modificaItems">
					<input value="<%=i.getId()%>" name="id" hidden="false"> <label
						for="name">Nome:</label><br> <input value="<%=i.getNome()%>"
						id="name" name="name" type="text" maxlength="20" required
						placeholder="inserire nome"
						onchange="prewiev('name','titoloItem')"><br> <label
						for="description">Descrizione:</label><br>
					<textarea id="editortesto" name="description"
						placeholder="inserire descrizione"><%=i.getDescrizione()%></textarea>
					<br> <label for="tag">tag:</label><input class="infoDetailsItemButton" type="button"
						value="Crea tag" class="float-right" data-toggle="modal"
						data-target="#tagModal"><br>
					<%
							String t2="";
							for (String t3 : tag3) {
								t2=t3+","+t2;
							}
						%>
					<input id="tag" name="tag" type="text" data-role="tagsinput"
						placeholder="tag,..." onchange="prewievTag('tag','tagItem')"
						value="<%= t2%>"> <label for="caratterisiche">caratterisiche:</label>
					<input class="infoDetailsItemButton" type="button" value="aggiungi" class="float-right"
						onclick="addCaratterisica()"> <input class="infoDetailsItemButton" type="button"
						value="Crea" class="float-right" data-toggle="modal"
						data-target="#caratterisicheModal"><br>
					<section id="caratterisicheSection"></section>
					<label for="price">Prezzo:</label><br> <input
						value="<%=String.format(Locale.ENGLISH,"%.2f", i.getPrezzo())%>"
						id="price" name="price" type="text" pattern="[0-9]{1,}.[0-9]{2}"
						required onchange="prewievPrezzo('prezzoItem')"><br>
					<label for="iva">Iva:</label><br> <input
						value="<%=i.getIva()%>" id="iva" name="iva" type="number" min="0"
						value="22" required onchange="prewievPrezzo('prezzoItem')"><br>
					<label for="sconto">Sconto:</label><br> <input
						value="<%=i.getSconto()%>" id="sconto" name="sconto" type="number"
						min="0" value="0" required onchange="prewievPrezzo('prezzoItem')"><br>
					<label for="tipo">Tipo:</label><br> <select name="tipo"
						id="tipo">
						<option value="piante">piante</option>
						<option value="fioriVeri">fiori veri</option>
						<option value="fioriFinti">fiori finti</option>
						<option value="oggettistica">oggettistica</option>
					</select><br> <label for="quantity">Quantità:</label><br> <input
						value="<%=i.getQuantita()%>" id="quantity" name="quantity"
						type="number" min="1" value="1" required
						onchange="addQuantita('quantity','quantityItem')"><br>
					<input class="infoDetailsItemButton" type="submit" value="Procedi"><input class="infoDetailsItemButton" style="background-color: red;" type="reset"
						value="Reset">
				</form>
			</div>
			<div>
				<h1 id="titoloItem" class="titoloItem"><%=i.getNome()%></h1>
				<div class="contenerSuperiore">
					<div>
						<div id="galleriaItem" class="galleria">
							<div id="imgXL" class="w3-content" style="max-width: 1200px">
								<%
								int count = 1;
								for (Integer img : galleriaItem) {
								%>
								<img class="mySlides" src="mostraImg?imgID=<%=img%>"
									style="width:100%;
								<%if (count != 1) {%>
									<%="display:none"%>
								<%}%>">
								<%
								count++;
								}
								%>
								<div id="listimg" class="w3-row-padding w3-section">
									<%
									int count1 = 1;
									for (Integer img : galleriaItem) {
									%>
									<div class="w3-col s4">
										<img class="demo w3-opacity w3-hover-opacity-off"
											src="mostraImg?imgID=<%=img%>"
											style="width: 100%; cursor: pointer"
											onclick="currentDiv(<%=count1%>)">
									</div>
									<%
									count1++;
									}
									%>
								</div>
							</div>
						</div>
						<h3>caratterisiche</h3>
						<div id="caratterisicheItem" class="caratterisiche"></div>
						<h3>tag</h3>
						<div id="tagItem" class="tag">
							<%
							for (String t3 : tag3) {
							%>
							<p class="tagp"><%=t3%></p>
							<%
							}
							%>
						</div>
						<h6>descrizione</h6>
						<div id="descrizioneItem" class="descrizione"><%=i.getDescrizione()%></div>
					</div>
					<div>
						<div class="infoItem">
							<h3>Acquista</h3>
							<div id="prezzoItem" class="prezzo"><%=String.format(Locale.ENGLISH,"%.2f", i.calcolaPrezzo())%>
								&euro;
							</div>
							<label for="quantity">Quantit&agrave; </label> <select
								class="quantity" name="quantity" id="quantityItem">
								<%
								for (int x = 1; x <= i.getQuantita(); x++) {
								%>
								<option value="<%=x%>">
									<%=x%>
								</option>
								<%
								}
								%>
							</select> <br>
							<button class="infoDetailsItemButton">Aggiungi al carrello</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%
		} else {
		%>
		<%@ include file="main/nonPermessi.jsp"%>
		<%
		}
		%>
		<footer>
			<%@ include file="main/footer.jsp"%>
		</footer>
	</div>
	<script type="text/javascript">
			document.getElementById("tipo").value="<%=i.getTipo()%>";
		<%for(PrintCaratteristica printCaratteristica:c){
			String v2="";
			for(String v1:printCaratteristica.getValore()){
				v2=v1+","+v2;
			}
		%>
			loadCaratterisica("<%=printCaratteristica.getNome()%>","<%=v2%>");
		<%}%>
		initFileSelect();
		tagAutoComplite();
	</script>
</body>
</html>