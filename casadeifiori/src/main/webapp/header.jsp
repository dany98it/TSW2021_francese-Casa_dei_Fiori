<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Casa dei fiori</title>
		
		<link rel=StyleSheet HREF="style.css" TYPE="text/css">
	</head>
	
	<nav>
		<div class="navBar">
			<div class="dropDown">
				<button type="button" class="menuMobile headerBtn" onclick="menuMobile()"><i class="fas fa-bars" id="barMenu"></i><i class="fas fa-times" id="barMenuOpen"></i> </button>
				<div class="menuDrop" id="menuDropBar">
					<ul class="ulMenu">
						<li> <a href="index.jsp"><button type="button" id="homeButton">Home </button></a></li>
						<li> <a href="listaItem.jsp" id="afterHomeBtn"><button type="button" class="headerBtn" >lista prodotti </button></a></li> 
						<li> <a href="cartPage.jsp"><button type="button" class="headerBtn">carrello </button></a> </li> 
						<li> <a href="addItem.jsp"><button type="button" class="headerBtn">aggiungi prodotto </button></a> </li>
					</ul>
				</div>
			</div>
			<div class="logo">
				<img alt="logo" src="img/logosenzascritta.png"  alt="Image" height="95" width="152">
			</div>
			<div class="user">
				<p class="searchTab">barra di ricerca</p>
				<button type="button" class="searchBtn headerBtn"><i class="fas fa-search"></i></button>
				<button type="button" class="headerBtn"><i class="fas fa-user"></i></button>
			</div>
		</div>
		<div class="menuBar">
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
	</script>
</html>