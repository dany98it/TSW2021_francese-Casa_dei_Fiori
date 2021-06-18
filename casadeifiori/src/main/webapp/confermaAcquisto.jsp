<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="it">
	<head>
		<meta charset="utf-8">
		<title>Conferma Acquisto</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<%@ include file="main/style.jsp" %>
	</head>
	<body>
		<%@ include file="main/script.jsp" %>
		<%@ include file="main/menuMobile.jsp" %>
		<div id="main">
			<header>
				<%@ include file="main/header.jsp"%>
			</header>
			<nav>
				<%@ include file="main/navigationBar.jsp"%>
			</nav>
			<h1>Acquisto avvenuto con successo</h1>
			<footer>
				<%@ include file="main/footer.jsp" %>
			</footer>
		</div>
		<script type="text/javascript"> cerca();</script>	
	</body>
</html>