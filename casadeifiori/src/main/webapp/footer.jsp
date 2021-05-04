<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<% int year = Calendar.getInstance().get(Calendar.YEAR); %>
<html>
<head>
	<link rel="stylesheet" href="style.css">
	<meta charset="ISO-8859-1">
	<script src="https://kit.fontawesome.com/46a2d5ed1b.js" ></script>
</head>

<footer>

</footer>
<body>
	<div class="navFooter">
		<aside class="navFooterBlock">
			<h4 class="navFooterTitleList">Informazioni legali</h4>
			<ul class="navFooterList">
				<li>Termini e condizioni</li>
				<li>Politica sulla privacy</li>
				<li>Politica sui coockie</li>
				<li>Avviso legale</li>	
			</ul>
		</aside>
		<aside class="navFooterBlock">
			<h4 class="navFooterTitleList">Contatti</h4>
			<ul class="navFooterList">
				<li>Corso Vittorio Veneto, 148 <br>
				Grottaminarda (AV) 83035</li>
				<li><a href="mailto:casadeifiorigrotta@libero.it">casadeifiorigrotta@libero.it</a></li>
				<li><a href="tel:+393402294222">+393402294222</a></li>
				<li><a href="tel:0825441420">0825441420</a></li>
			</ul>
		</aside>
		<aside class="navFooterBlock">
			<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12032.035692056526!2d15.0576405!3d41.0687976!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xe86a46e6ad4bfd19!2sCasa%20Dei%20Fiori%20Di%20Terrazzano%20Celeste!5e0!3m2!1sit!2sit!4v1620127805341!5m2!1sit!2sit" width="400" height="225" style="border:0;"></iframe>
		</aside>
		<aside id="socialIcons">
			<ul id="socialIconsList">
				<li><a href="https://www.facebook.com/profile.php?id=100008184453570" target="_blank"><i class="fab fa-facebook" id="facebookIcon"></i></a></li>
				<li><a href="https://www.instagram.com/casadeifiori.ideecreazioni/" target="_blank"><i class="fab fa-instagram" id="instagramIcon"></i></a></li>
			</ul>
		</aside>
		<aside class="belowNavFooter">
			<hr size="1" width="100%" align="left" color="white">
			<p>Copyright &#169; <%=year %>| CasadeiFioridiTerrazzanoCeleste.</p>
		</aside>
	</div>
</body>
</html>