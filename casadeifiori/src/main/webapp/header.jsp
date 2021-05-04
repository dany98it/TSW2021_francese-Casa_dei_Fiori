<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Casa dei fiori</title>
		
		<link rel=StyleSheet HREF="style.css" TYPE="text/css">
	</head>
	
	<nav>
		<div class="navBar">
			<div >
				<button type="button" class="menuMobile headerBtn" onclick="menuMobile()"><i class="fas fa-bars" id="barMenu"></i> </button>
			</div>
			<div class="logo">
				<img alt="logo" src="">
			</div>
			<div class="user">
				<p class="searchTab">barra di ricerca</p>
				<button type="button" class="searchBtn headerBtn"><i class="fas fa-search"></i></button>
				<button type="button" class="headerBtn"><i class="fas fa-user"></i></button>
			</div>
		</div>
		<div class="menuBar" id="menuBarId">
			<ul class="ulMenu">
				<li> <a href="index.jsp"><button type="button" id="homeButton">Home </button></a></li>
				<li> <a href="listaItem.jsp" id="afterHomeBtn"><button type="button" class="headerBtn" >lista prodotti </button></a></li> 
				<li> <a href="cartPage.jsp"><button type="button" class="headerBtn">carrello </button></a> </li> 
				<li> <a href="addItem.jsp"><button type="button" class="headerBtn">aggiungi prodotto </button></a> </li>
			</ul>
		</div>
	</nav>
	<script type="text/javascript">
		function menuMobile() {
			var bar = document.getElementById("menubarid");
			if (bar.style.display == "none") {
				bar.style.display = "block";
			}else{
				bar.style.display = "none";
			}
		}
	</script>
</html>