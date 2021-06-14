<%@ page import="model.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<% HttpSession sessione = request.getSession(true); %>
<%@ include file="../logInPage.jsp" %>
<%@ include file="../signInPageModel.jsp" %>
<div class="main" >
	<script src="code.js" ></script>
	<script src="/dist/mc-calendar.min.js"></script>

	<div id="headerContainer">
		<div class="logo">
			<img alt="logo" src="img/CasalogoSVGmodificato1.png" height="80" onclick="redirect('index.jsp')">
		</div>
		<div class="dropDown" id="headerMenuIconDiv">
			<span onclick="openNav()" class="menu">&#9776;</span>
		</div>
		<div class="user">
			<div id="cartIconDiv" >
				<a href="cartPage.jsp"><button type="button" class="headerBtn"><img src="img/CarrelloSito.svg" alt="carrello" height="35px" width="35px" id="cartIcon"></button></a>
			</div>
			<div class="dropDown">
				<button type="button" class="headerBtn" onmouseenter="menuMobile2()" onmouseleave="closeMenuMobile2()"><i class="fas fa-user" id="userIcon"></i></button>
				<div class="menuDrop2" id="menuDropBar2" onmouseenter="menuMobile2()" onmouseleave="closeMenuMobile2()">
					<ul class="ulMenu2">
						<% if(sessione.getAttribute("loggedUser")!=null){ %>
							<li> <a href="#" id="afterHomeBtn"><button type="button" class="headerBtn" >Il mio profilo</button></a></li> 
							<li> <a href="MostraOrdiniEffettuati"><button type="button" class="headerBtn">I miei ordini</button></a> </li> 
							<li> <a href="adminMostraOrdini"><button type="button" class="headerBtn">Amministrazione Ordini</button></a> </li> 
							<li> <a href="EffettuaLogOut"><button type="button" class="headerBtn">Log-out</button></a> </li>
						<% }else{%>
							<li> <button type="button" class="headerBtn" onclick="openLogIn()">Log-in</button></li>
							<li> <button type="button" class="headerBtn" onclick="openSignIn()">Sign-in</button></li> 
						<% } %>		
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>