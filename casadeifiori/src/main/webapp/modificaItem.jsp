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
		<link rel=StyleSheet href="style.css" type="text/css">
		
	</head>
	<body>
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
						<div>
							<form method="post" action="AggiungiItem"> 
								<label for="name">Nome:</label><br> 
								<input id="name" name="name" type="text" maxlength="20" value="<%= i.getNome() %>" required placeholder="inserire nome"><br> 
								<label for="description">Descrizione:</label><br>
								<textarea id="editortesto" name="description" placeholder="inserire descrizione"><%= i.getDescrizione() %></textarea><br>
								<label for="price">Prezzo:</label><br> 
								<input id="price" name="price" type="text" value="<%= i.getPrezzo() %>" pattern="[0-9]{1,}.[0-9]{2}" required><br>	
								<label for="iva">Iva:</label><br> 
								<input id="iva" name="iva" type="number" min="0" value="<%= i.getIva() %>" required><br>
								<label for="sconto">Sconto:</label><br> 
								<input id="sconto" name="sconto" type="number" min="0" value="<%= i.getSconto() %>" required><br>
								<label for="tipo">Tipo:</label><br> 
								<select name="tipo" id="tipo">
									<option value="piante"> piante </option>
									<option value="fioriVeri"> fiori veri </option>
									<option value="fioriFinti"> fiori finti </option>
									<option value="oggettistica"> oggettistica </option>
								</select><br>
								<label for="quantity">Quantità:</label><br> 
								<input id="quantity" name="quantity" type="number" min="1" value="<%= i.getQuantita() %>" required><br>
								<input type="submit" value="Add"><input type="reset" value="Reset">
							</form>
						</div>
						<div>
							<h1 class="titoloItem"></h1>
							<div class="contenerSuperiore">
								<div>
									<div class="galleria"></div>
									<div class="caratterisiche"></div>
									<div class="tag"></div>
									<div class="descrizione"></div>
								</div>
								<div>
									<div class="infoItem">
										<div class="prezzo"> &euro;</div>
										<label for="quantity">Quantit&agrave; </label>
										<select class="quantity" name="quantity" id="quantity">
										</select> <br>
										<button>Aggiungi al carrello</button>		
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
		<script src="https://kit.fontawesome.com/46a2d5ed1b.js" ></script>
		<script src="https://cdn.tiny.cloud/1/g2c80f7e3j2a84roh0japxama71ob4iv5qwvfyc01h1zyx7f/tinymce/5/tinymce.min.js" ></script>
		<script src="code.js"></script>
		<script type="text/javascript">
			document.getElementById("tipo").value="<%= i.getTipo() %>";
		</script>
	</body>
</html>