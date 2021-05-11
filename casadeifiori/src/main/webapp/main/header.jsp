<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% HttpSession sessione = request.getSession(true); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Casa dei fiori</title>
		
		<link rel=StyleSheet HREF="style.css" TYPE="text/css">
	</head>
	
	<body>
		<div id="headerContainer">
			<div class="dropDown">
					<button type="button" class="menuMobile headerBtn" onclick="menuMobile()"><i class="fas fa-bars" id="barMenu"></i><i class="fas fa-times" id="barMenuOpen"></i> </button>
					<section class="menuDrop" id="menuDropBar">
						<ul class="ulMenu">
							<li> <a href="listaItem.jsp" id="afterHomeBtn"><button type="button" class="headerBtn" >lista prodotti </button></a></li> 
							<li> <a href="cartPage.jsp"><button type="button" class="headerBtn">carrello </button></a> </li> 
							<li> <a href="addItem.jsp"><button type="button" class="headerBtn">aggiungi prodotto </button></a> </li>
						</ul>
					</section>
			</div>
			<section class="logo">
					<a href="index.jsp"><img alt="logo" src="img/Logo.png"  alt="Image" height="80em" ></a>
			</section>
			<section class="user">
					<input type="search" class="searchBarItem">
					<input type="submit" class="searchBarItem" value="Cerca">
					
					<div class="dropDown">
						<button type="button" class="searchBtn headerBtn"onclick="menuMobile3()"><i class="fas fa-search" id="searchIcon"></i></button>
						<section class="menuDrop3" id="menuDropBar3">
							<input type="search" >
							<input type="submit" class="searchBarItemDown" value="Cerca">
						</section>
					</div>
					
					<div class="dropDown">
					<button type="button" class="headerBtn" onmouseenter="menuMobile2()" onmouseleave="closeMenuMobile2()"><i class="fas fa-user" id="userIcon"></i></button>
					<section class="menuDrop2" id="menuDropBar2" onmouseenter="menuMobile2()" onmouseleave="closeMenuMobile2()">
						<ul class="ulMenu2">
							<% if(sessione.getAttribute("loggedUser")!=null){ %>
								<li> <a href="#" id="afterHomeBtn"><button type="button" class="headerBtn" >Il mio profilo</button></a></li> 
								<li> <a href="MostraOrdiniEffettuati"><button type="button" class="headerBtn">I miei ordini</button></a> </li> 
								<li> <a href="#"><button type="button" class="headerBtn">log-out</button></a> </li>
							<% }else{%>
								<li> <a href="logInPage.jsp" id="afterHomeBtn"><button type="button" class="headerBtn" >Log-in</button></a></li> 
								<li> <a href="signInPage.jsp"><button type="button" class="headerBtn">Sing-in</button></a> </li> 
							<% } %>
							
						</ul>
					</section>
					
					</div>
			</section>
		</div>
	</body>
	<script type="text/javascript">
		function menuMobile() {
			var bar = document.getElementById("menuDropBar");
			var icon = document.getElementById("barMenu");
			var icon1 = document.getElementById("barMenuOpen");
			if (bar.style.display == "none") {
				bar.style.display = "block";
				icon.style.display = "none";
				icon1.style.display = "inline-block";
			}else{
				bar.style.display = "none";
				icon.style.display = "inline-block";
				icon1.style.display = "none";
			}
		}
		function menuMobile2() {
			var bar = document.getElementById("menuDropBar2");

				bar.style.display = "block";
		}
		function closeMenuMobile2(){
			var bar = document.getElementById("menuDropBar2");
			bar.style.display = "none";
		}
		
		function menuMobile3() {
			var bar = document.getElementById("menuDropBar3");
			if (bar.style.display == "none") {
				bar.style.display = "block";
			}else{
				bar.style.display = "none";
			}
		}
	</script>
</html>