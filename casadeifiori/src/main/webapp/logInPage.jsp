<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Log In</title>
</head>
	<header>
		<%@ include file="main/header.jsp"%>
	</header>
	<nav>
		<%@ include file="main/navigationBar.jsp"%>
	</nav>
<body>
	<form action="logIn" method="post">
	
			<label for="username" class="signInLbl">Email o nuemro di telefono</label> <br>
			<input type="text" name="username" class="logInInput" placeholder="Inserisci Email o numero di telefono" required="required"/> <br>
			
			<label for="password" class="signInLbl">Password</label> <br>
			<input type="password" name="password" class="logInInput" placeholder="Inserisci password" required="required"/> <br>
			
			<input type="submit" value="log In" class="logInInput">
			<a href="signInPage.jsp"><button type="button" >Sing-in</button></a>
	</form>
</body>
	<footer>
		<%@ include file="main/footer.jsp" %>
	</footer>
</html>