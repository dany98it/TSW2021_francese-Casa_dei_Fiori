<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="model.*"%>
<%
	Item i = (Item) request.getAttribute("item");
    if(i==null){
    	response.sendRedirect("./MostraItem");	
    	return;
    }%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Casa dei fiori</title>
		<script src="https://kit.fontawesome.com/46a2d5ed1b.js" ></script>
		<link rel=StyleSheet href="style.css" type="text/css">
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
			<%	boolean isAdmin;
				if(sessione.getAttribute("isAdmin")!=null){
					isAdmin=(boolean) sessione.getAttribute("isAdmin"); 
				} else{
					isAdmin=false;
				}
				if(isAdmin){ %>
					<%@ include file="main/addItem.jsp" %>
			<% } else { %>
				<%@ include file="main/nonPermessi.jsp" %>
			<% } %>
		<footer>
			<%@ include file="main/footer.jsp" %>
		</footer>
		<script src="code.js"></script>
		<script type="text/javascript">
			document.getElementById("name").value=" <%= i.getNome() %>";
			document.getElementById("editortesto").value="<%= i.getDescrizione() %>";
			document.getElementById("price").value="<%= i.getPrezzo() %>";
			document.getElementById("iva").value="<%= i.getIva() %>";
			document.getElementById("sconto").value="<%= i.getSconto() %>";
			document.getElementById("tipo").value="<%= i.getTipo() %>";
			document.getElementById("quantity").value="<%= i.getQuantita() %>";
		</script>
	</body>
</html>