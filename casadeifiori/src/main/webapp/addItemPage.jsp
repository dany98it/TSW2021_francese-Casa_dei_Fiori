<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Casa dei fiori</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
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
			<script src="https://cdn.tiny.cloud/1/g2c80f7e3j2a84roh0japxama71ob4iv5qwvfyc01h1zyx7f/tinymce/5/tinymce.min.js"></script>
				<%	boolean isAdmin;
					if(sessione.getAttribute("isAdmin")!=null){
						isAdmin=(boolean) sessione.getAttribute("isAdmin"); 
					} else{
						isAdmin=false;
					}
					if(isAdmin){ %>
						<form method="post" action="AggiungiItem"> 
							<label for="name">Nome:</label><br> 
							<input id="name" name="name" type="text" maxlength="20" required placeholder="inserire nome"><br> 
							<label for="description">Descrizione:</label><br>
							<textarea id="editortesto" name="description" placeholder="inserire descrizione"></textarea><br>
							<label for="price">Prezzo:</label><br> 
							<input id="price" name="price" type="text" pattern="[0-9]{1,}.[0-9]{2}" required><br>	
							<label for="iva">Iva:</label><br> 
							<input id="iva" name="iva" type="number" min="0" value="22" required><br>
							<label for="sconto">Sconto:</label><br> 
							<input id="sconto" name="sconto" type="number" min="0" value="0" required><br>
							<label for="tipo">Tipo:</label><br> 
							<select name="tipo" id="tipo">
								<option value="piante"> piante </option>
								<option value="fioriVeri"> fiori veri </option>
								<option value="fioriFinti"> fiori finti </option>
								<option value="oggettistica"> oggettistica </option>
							</select><br>
							<label for="quantity">Quantità:</label><br> 
							<input id="quantity" name="quantity" type="number" min="1" value="1" required><br>
							<input type="submit" value="Add"><input type="reset" value="Reset">
						</form>
				<% } else { %>
					<%@ include file="main/nonPermessi.jsp" %>
				<% } %>
			<footer>
				<%@ include file="main/footer.jsp" %>
			</footer>
		</div>
		<script src="https://kit.fontawesome.com/46a2d5ed1b.js" ></script>
		<script src="code.js" ></script>
	</body>
</html>