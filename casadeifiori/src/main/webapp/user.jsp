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
				<h1>Profilo <%=user.getPermessi()%> numero <%=user.getId()%></h1>
				<h2>Nominativo:</h2>
				<p><%=user.getNome()+" "+user.getCognome()%></p>
				<h2>Data di nascità:</h2>
				<p><%=user.getdataNascita()%></p>
				<h2>Email:</h2>
				<p><%=user.getEmail() %></p>
				<h2>Telefono:</h2>
				<p><%=user.getTelefono() %></p>
				<h2>Indirizzi:</h2>
				<%Collection<Indirizzo> indirizziUser=new IndirizzoDAO().doRetrieveAllByUser(user.getId());
					for(Indirizzo indirizzoUser:indirizziUser){%>
						<p><%=indirizzoUser.getVia()+" "+indirizzoUser.getNumeroCivico()+","+indirizzoUser.getCittà()+"("+
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