<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta charset="ISO-8859-1">
		<title>Home</title>
		<link rel=StyleSheet href="style.css" type="text/css">
		<script src="https://kit.fontawesome.com/46a2d5ed1b.js" ></script>
	</head>
	<body onload="startShowSlides()">
		<%@ include file="main/menuMobile.jsp" %>
		<div id="main">
			<header>
				<%@ include file="main/header.jsp"%>
			</header>
			<nav>
				<%@ include file="main/navigationBar.jsp"%>
			</nav>
			<div class="slideShowConteiner">
				<div class="slide fade">
					 <img src="img/Logo.png" style="width:100%">
				</div>
				<div class="slide fade">
					 <img src="img/logosenzascritta.png" style="width:100%">
				</div>
				<div class="slide fade">
					 <img src="img/logonew.png" style="width:100%">
				</div>	
				<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  				<a class="next" onclick="plusSlides(1)">&#10095;</a>
  				<div style="text-align:center">
  					<span class="dot" onclick="currentSlide(1)"></span>
  					<span class="dot" onclick="currentSlide(2)"></span>
  					<span class="dot" onclick="currentSlide(3)"></span>
				</div>
			</div>
			
			<footer>
				<%@ include file="main/footer.jsp" %>
			</footer>
		</div>
		<script src="code.js" ></script>
	</body>
</html>