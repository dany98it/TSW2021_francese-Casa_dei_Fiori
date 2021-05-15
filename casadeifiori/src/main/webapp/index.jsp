<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta charset="ISO-8859-1">
		<title>Home</title>
		<link rel=StyleSheet href="style.css?ts=<?=time()?>&quot" type="text/css">
		<script src="https://kit.fontawesome.com/46a2d5ed1b.js" ></script>
	</head>
	<body>
		<header>
			<%@ include file="main/header.jsp"%>
		</header>
		<nav>
			<%@ include file="main/navigationBar.jsp"%>
		</nav>
		<p>
			<a href="listaItem.jsp"><button type="button" >lista prodotti </button></a> <br>
			<a href="cartPage.jsp"><button type="button" >carrello </button></a> <br>
			<a href="addItem.jsp"><button type="button" >aggiungi prodotto </button></a> 
		</p>
		<footer>
			<%@ include file="main/footer.jsp" %>
		</footer>
		<script src="code.js" ></script>
	</body>
</html>