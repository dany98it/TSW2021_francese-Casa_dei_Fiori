<%@page import="model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<% HttpSession sessioneUser = request.getSession(true); 
    	User user=(User)sessioneUser.getAttribute("loggedUser");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Profilo</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ include file="main/style.jsp"%>
</head>
<body>
	<%@ include file="main/script.jsp"%>
	<%@ include file="main/menuMobile.jsp"%>
	<div id="main">
		<header>
			<%@ include file="main/header.jsp"%>
		</header>
		<nav>
			<%@ include file="main/navigationBar.jsp"%>
		</nav>
		<div class="userDiv">
			<%if(user!=null){%>
			<div class="HeaderInfoBox">
			<h1>
				Profilo
				<%=user.getPermessi()%>
				ID 
				<%=user.getId()%></h1>
			</div>
			<div class="HeaderInfoBox">
			<h2>Nominativo</h2>
			</div>
			<p class="paragraphInfoBox"><%=user.getNome()+" "+user.getCognome()%></p>
			<div class="HeaderInfoBox">
			<h2>Data di nascità</h2>
			</div>
			<p class="paragraphInfoBox"><%=user.getdataNascita()%></p>
			<div class="HeaderInfoBox">
			<h2>Email</h2>
			</div>
			<p class="paragraphInfoBox"><%=user.getEmail() %></p>
			<div class="HeaderInfoBox">
			<h2>Telefono</h2>
			</div>
			<p class="paragraphInfoBox"><%=user.getTelefono() %></p>
			<div class="HeaderInfoBox">
			<h2>Indirizzi</h2>
			</div>
			<%Collection<Indirizzo> indirizziUser=new IndirizzoDAO().doRetrieveAllByUser(user.getId());
					for(Indirizzo indirizzoUser:indirizziUser){%>
			<p class="paragraphInfoBox"><%=indirizzoUser.getVia()+" "+indirizzoUser.getNumeroCivico()+","+indirizzoUser.getCittà()+"("+
							indirizzoUser.getProvincia()+") "+indirizzoUser.getCap()%></p>
			<%}%>
			<%}%>
		</div>
		<footer>
			<%@ include file="main/footer.jsp"%>
		</footer>
	</div>
</body>
</html>