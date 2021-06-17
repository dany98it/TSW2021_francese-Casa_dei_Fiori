<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="model.*"%>
<%
	Item i = (Item) request.getAttribute("item");
    if(i==null){
    	response.sendRedirect("./MostraItem");	
    	return;
    }%>
<!DOCTYPE html>
<html lang="it">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Casa dei fiori</title>
		<%@ include file="main/style.jsp" %>
	</head>
	<body>
		<%@ include file="main/menuMobile.jsp" %>
		<div id="main">
			<header>
				<%@ include file="main/header.jsp" %>
			</header>
			<nav>
				<%@ include file="main/navigationBar.jsp" %>
			</nav>
				<script src="https://cdn.tiny.cloud/1/g2c80f7e3j2a84roh0japxama71ob4iv5qwvfyc01h1zyx7f/tinymce/5/tinymce.min.js" ></script>
				<%	boolean isAdmin;
					if(sessione.getAttribute("isAdmin")!=null){
						isAdmin=(boolean) sessione.getAttribute("isAdmin"); 
					} else{
						isAdmin=false;
					}
					if(isAdmin){ %>
					<div class="insertItem">
						<div>
							<form action="saveImg" method="post" enctype="multipart/form-data">
								<label for="img">immagini:</label><br>
								<input type="file" id="img" name="img" accept="image/*" multiple="multiple" required="required" maxlength="4294967296"> <br>
								<div id="selectedFiles"></div>
								<input type="submit" value="Add"><input type="reset" value="Reset">
							</form>
						</div>
						<div>
							<h1 id="titoloItem" class="titoloItem"><%= i.getNome() %></h1>
							<div class="contenerSuperiore">
								<div>
									<div id="galleriaItem" class="galleria">
										<div id="imgXL"class="w3-content" style="max-width:1200px">
    										<div id="listimg" class="w3-row-padding w3-section">
											</div>
										</div>
									</div>
									<h6>caratterisiche</h6>
									<div id="caratterisicheItem" class="caratterisiche"></div>
									<h6>tag</h6>
									<div id="tagItem" class="tag"></div>
									<h6>descrizione</h6>
									<div id="descrizioneItem" class="descrizione"><%= i.getDescrizione() %></div>
								</div>
								<div>
									<div class="infoItem">
										<h6>prezzo</h6>
										<div id="prezzoItem" class="prezzo"><%= i.calcolaPrezzo() %> &euro;</div>
										<label for="quantity">Quantit&agrave; </label>
										<select class="quantity" name="quantity" id="quantityItem">
											<% for(int x=1;x<=i.getQuantita();x++){ %>
												<option value="<%= x %>"> <%= x %> </option>
											<%} %>
										</select> <br>
										<button>Aggiungi al carrello</button>		
									</div>
								</div>
							</div>
						</div>
					</div>
				<% } else { %>
					<%@ include file="main/nonPermessi.jsp" %>
				<% } %>
			<footer>
				<%@ include file="main/footer.jsp" %>
			</footer>
		</div>
		<script src="https://kit.fontawesome.com/46a2d5ed1b.js" ></script>
		<script src="code.js" ></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha256-OFRAJNoaD8L3Br5lglV7VyLRf0itmoBzWUoM+Sji4/8=" crossorigin="anonymous"></script>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-tagsinput/0.8.0/bootstrap-tagsinput.js" integrity="sha512-VvWznBcyBJK71YKEKDMpZ0pCVxjNuKwApp4zLF3ul+CiflQi6aIJR+aZCP/qWsoFBA28avL5T5HA+RE+zrGQYg==" crossorigin="anonymous"></script>
		<script src="https://twitter.github.io/typeahead.js/releases/latest/typeahead.bundle.js"></script>
		<script src="code.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script type="text/javascript">
			initFileSelect();
			cerca();
		</script>	
	</body>
</html>