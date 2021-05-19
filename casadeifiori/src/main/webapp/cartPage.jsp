<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Carrello</title>
		<script src="https://kit.fontawesome.com/46a2d5ed1b.js" ></script>
		<link rel=StyleSheet href="style.css" type="text/css">
	</head>
	<body>
		<header>
			<%@ include file="main/header.jsp"%>
		</header>	
		<nav>
			<%@ include file="main/navigationBar.jsp"%>
		</nav>
		<input type="text" class="notShow" id="page" value="cartPage.jsp">
		<jsp:include page="main/showCart.jsp"/>
		<footer>
		<%@ include file="main/footer.jsp" %>
		</footer>
		<script src="code.js" ></script>
	</body>	
</html>