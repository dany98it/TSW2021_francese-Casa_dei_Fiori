<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Casa dei fiori</title>
		<script src="https://kit.fontawesome.com/46a2d5ed1b.js" ></script>
		<link rel=StyleSheet href="style.css?ts=<?=time()?>&quot" type="text/css">
		<script src="https://cdn.tiny.cloud/1/g2c80f7e3j2a84roh0japxama71ob4iv5qwvfyc01h1zyx7f/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
		<script>
    		tinymce.init({
     			selector: '#editortesto'
    		});
  		</script>
	</head>
	<body>
		<header>
			<%@ include file="main/header.jsp" %>
		</header>
		<nav>
			<%@ include file="main/navigationBar.jsp" %>
		</nav>
			<% 
				User user=(User) sessione.getAttribute("loggedUser");
				if(user==null||user.getPermessi()!=Permessi.admin){ %>
					<%@ include file="main/nonPermessi.jsp" %>
			<% } else { %>
				<%@ include file="main/addItem.jsp" %>
			<% } %>
		<footer>
			<%@ include file="main/footer.jsp" %>
		</footer>
		<script src="code.js" ></script>
	</body>
</html>