<%@ page import="model.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<% HttpSession sessione = request.getSession(true); %>
<!DOCTYPE html>
<html>
	<div id="menuDropBar" class="menuDrop">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a href="listaItem.jsp">lista prodotti</a>
		<a href="cartPage.jsp">carrello</a>
		<a href="addItemPage.jsp">aggiungi prodotto</a>
	</div>
	<div id="headerContainer">
		<div class="dropDown">
			<span onclick="openNav()" class="menu">&#9776;</span>
		</div>
		<div class="logo">
			<img alt="logo" src="img/Logo.png" height="80em" onclick="redirect('index.jsp')">
		</div>
		<section class="user">
			<form>
  				<input type="search" name="cerca" placeholder="cerca..." class="cerca" autocomplete="off">
			</form>
			<div class="dropDown">
				<button type="button" class="headerBtn" onmouseenter="menuMobile2()" onmouseleave="closeMenuMobile2()"><i class="fas fa-user" id="userIcon"></i></button>
				<section class="menuDrop2" id="menuDropBar2" onmouseenter="menuMobile2()" onmouseleave="closeMenuMobile2()">
					<ul class="ulMenu2">
						<% if(sessione.getAttribute("loggedUser")!=null){ %>
							<li> <a href="#" id="afterHomeBtn"><button type="button" class="headerBtn" >Il mio profilo</button></a></li> 
							<li> <a href="MostraOrdiniEffettuati"><button type="button" class="headerBtn">I miei ordini</button></a> </li> 
							<li> <a href="EffettuaLogOut"><button type="button" class="headerBtn">Log-out</button></a> </li>
						<% }else{%>
							<li> <a href="logInPage.jsp" id="afterHomeBtn"><button type="button" class="headerBtn" >Log-in</button></a></li> 
							<li> <a href="signInPage.jsp"><button type="button" class="headerBtn">Sing-in</button></a> </li> 
						<% } %>		
					</ul>
				</section>
			</div>
		</section>
	</div>
</html>