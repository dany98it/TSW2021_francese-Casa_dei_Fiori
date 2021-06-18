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
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Casa dei fiori</title>
		<%@ include file="main/style.jsp" %>
	</head>
	<body>
		<%@ include file="main/script.jsp" %>
		<%@ include file="main/menuMobile.jsp" %>
		<div id="main">
			<header>
				<%@ include file="main/header.jsp" %>
			</header>
			<nav>
				<%@ include file="main/navigationBar.jsp" %>
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
							<form method="post" action="modificaItem"> 
							<input value="<%= i.getId() %>" name="id" hidden="false"> 
								<label for="name">Nome:</label><br> 
								<input value="<%= i.getNome() %>" id="name" name="name" type="text" maxlength="20" required placeholder="inserire nome" onchange="prewiev('name','titoloItem')"><br> 
								<label for="img">immagini:</label><br>
								<input type="file" id="img" name="img" accept="image/*" multiple="multiple"> <br>
								<div id="selectedFiles"></div> 
								<label for="description">Descrizione:</label><br>
								<textarea id="editortesto" name="description" placeholder="inserire descrizione"><%= i.getDescrizione() %></textarea><br>
								<label for="tag">tag:</label><br> 
								<input id="tag" name="tag" type="text" data-role="tagsinput"placeholder="tag,..." onchange="prewievTag('tag','tagItem')">
								<label for="caratterisiche">caratterisiche:</label><br> 
								<input id="caratterisiche" name="caratterisiche" type="text" data-role="tagsinput" placeholder="caratterisica:valore,..." onchange="prewievTag('caratterisiche','caratterisicheItem')">
								<label for="price">Prezzo:</label><br> 
								<input value="<%= i.getPrezzo() %>" id="price" name="price" type="text" pattern="[0-9]{1,}.[0-9]{2}" required onchange="prewievPrezzo('prezzoItem')"><br>	
								<label for="iva">Iva:</label><br> 
								<input value="<%= i.getIva() %>" id="iva" name="iva" type="number" min="0" value="22" required onchange="prewievPrezzo('prezzoItem')"><br>
								<label for="sconto">Sconto:</label><br> 
								<input value="<%= i.getSconto() %>" id="sconto" name="sconto" type="number" min="0" value="0" required onchange="prewievPrezzo('prezzoItem')"><br>
								<label for="tipo">Tipo:</label><br> 
								<select name="tipo" id="tipo">
									<option value="piante"> piante </option>
									<option value="fioriVeri"> fiori veri </option>
									<option value="fioriFinti"> fiori finti </option>
									<option value="oggettistica"> oggettistica </option>
								</select><br>
								<label for="quantity">Quantità:</label><br> 
								<input value="<%= i.getQuantita() %>" id="quantity" name="quantity" type="number" min="1" value="1" required onchange="addQuantita('quantity','quantityItem')"><br>
								<input type="submit" value="Add"><input type="reset" value="Reset">
							</form>
						</div>
						<div>
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
										<h3>Acquista</h3>
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
						</div>
					</div>
				<% } else { %>
					<%@ include file="main/nonPermessi.jsp" %>
				<% } %>
			<footer>
				<%@ include file="main/footer.jsp" %>
			</footer>
		</div>
		<script type="text/javascript">
			document.getElementById("tipo").value="<%= i.getTipo() %>";
			initFileSelect();
			cerca();
		</script>	
	</body>
</html>