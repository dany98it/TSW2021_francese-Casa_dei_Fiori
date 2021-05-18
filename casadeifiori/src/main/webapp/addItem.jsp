<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Casa dei fiori</title>
		<script src="https://kit.fontawesome.com/46a2d5ed1b.js" ></script>
		<link rel=StyleSheet href="style.css?ts=<?=time()?>&quot" type="text/css">
		<script src="https://cdn.tiny.cloud/1/g2c80f7e3j2a84roh0japxama71ob4iv5qwvfyc01h1zyx7f/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
		<script>
    		tinymce.init({
     			selector: '#editortesto'
    		});
  		</script>
	</head>
	<body>
		<header>
			<%@ include file="main/header.jsp" %>
		</header>
		<nav>
			<%@ include file="main/navigationBar.jsp" %>
		</nav>
		<form action="AggiungiItem"> 
			<label for="name">Nome:</label><br> 
			<input name="name" type="text" maxlength="20" required placeholder="inserire nome"><br> 
			<label for="description">Descrizione:</label><br>
			<textarea id="editortesto" name="description" maxlength="100" rows="3" placeholder="inserire descrizione"></textarea><br>
			<label for="price">Prezzo:</label><br> 
			<input name="price" type="text" pattern="[0-9]{1,}.[0-9]{2}" required><br>	
			<label for="iva">Iva:</label><br> 
			<input name="iva" type="number" min="0" value="22" required><br>
			<label for="sconto">Sconto:</label><br> 
			<input name="sconto" type="number" min="0" value="0" required><br>
			<label for="tipo">Tipo:</label><br> 
			<select name="tipo" id="tipo">
				<option value="piante"> piante </option>
				<option value="fioriVeri"> fiori veri </option>
				<option value="fioriFinti"> fiori finti </option>
				<option value="oggettistica"> oggettistica </option>
			</select>
			<br>
			<label for="quantity">Quantità:</label><br> 
			<input name="quantity" type="number" min="1" value="1" required><br>
			<input type="submit" value="Add"><input type="reset" value="Reset">
		</form>
		<footer>
			<%@ include file="main/footer.jsp" %>
		</footer>
		<script src="code.js" ></script>
	</body>
</html>