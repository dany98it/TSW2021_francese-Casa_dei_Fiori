<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="it">
	<head>
		<meta charset="utf-8">
		<title>Casa dei fiori</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel=StyleSheet href="style.css" type="text/css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha256-aAr2Zpq8MZ+YA/D6JtRD3xtrwpEz2IqOS+pWD/7XKIw=" crossorigin="anonymous" />
    	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-tagsinput/0.8.0/bootstrap-tagsinput.css" integrity="sha512-xmGTNt20S0t62wHLmQec2DauG9T+owP9e6VU8GigI0anN7OXLip9i7IwEhelasml2osdxX71XcYm6BQunTQeQg==" crossorigin="anonymous" />
    	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-typeahead/2.11.0/jquery.typeahead.css" integrity="sha512-AQG3JVpy/h0TsLsFs/HDLjnkq1ih9uUliGGXdQ7LQcGQt7GD+1b7HWOQ2oeCH7tKdtrfRg75CGApafi+//9Dbw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
			<script src="https://cdn.tiny.cloud/1/g2c80f7e3j2a84roh0japxama71ob4iv5qwvfyc01h1zyx7f/tinymce/5/tinymce.min.js"></script>
				<%	boolean isAdmin;
					if(sessione.getAttribute("isAdmin")!=null){
						isAdmin=(boolean) sessione.getAttribute("isAdmin"); 
					} else{
						isAdmin=false;
					}
					if(isAdmin){ %>
						<div class="insertItem">
						<div>
							<form method="post" action="AggiungiItem"> 
								<label for="name">Nome:</label><br> 
								<input id="name" name="name" type="text" maxlength="20" required placeholder="inserire nome" onchange="prewiev('name','titoloItem')"><br> 
								<label for="img">immagini:</label><br>
								<input type="file" id="img" name="img" accept="image/*" multiple="multiple" required="required"> <br>
								<div id="selectedFiles"></div> 
								<label for="description">Descrizione:</label><br>
								<textarea id="editortesto" name="description" placeholder="inserire descrizione"></textarea><br>
								<label for="tag">tag:</label><input type="button" value="Crea tag" class="float-right"><br> 
								<input id="tag" name="tag" type="text" data-role="tagsinput"placeholder="tag,..." onchange="prewievTag('tag','tagItem')">
								<label for="caratterisiche">caratterisiche:</label><input type="button" value="Crea caratterisica" class="float-right"><br> 
								<input id="caratterisiche" name="caratterisiche" type="text" data-role="tagsinput" placeholder="caratterisica:valore,..." onchange="prewievTag('caratterisiche','caratterisicheItem')">
								<label for="price">Prezzo:</label><br> 
								<input id="price" name="price" type="text" pattern="[0-9]{1,}.[0-9]{2}" required onchange="prewievPrezzo('prezzoItem')"><br>	
								<label for="iva">Iva:</label><br> 
								<input id="iva" name="iva" type="number" min="0" value="22" required onchange="prewievPrezzo('prezzoItem')"><br>
								<label for="sconto">Sconto:</label><br> 
								<input id="sconto" name="sconto" type="number" min="0" value="0" required onchange="prewievPrezzo('prezzoItem')"><br>
								<label for="tipo">Tipo:</label><br> 
								<select name="tipo" id="tipo">
									<option value="piante"> piante </option>
									<option value="fioriVeri"> fiori veri </option>
									<option value="fioriFinti"> fiori finti </option>
									<option value="oggettistica"> oggettistica </option>
								</select><br>
								<label for="quantity">Quantità:</label><br> 
								<input id="quantity" name="quantity" type="number" min="1" value="1" required onchange="addQuantita('quantity','quantityItem')"><br>
								<input type="submit" value="Add"><input type="reset" value="Reset">
							</form>
						</div>
						<div>
							<h1 id="titoloItem" class="titoloItem"></h1>
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
									<div id="descrizioneItem" class="descrizione"></div>
								</div>
								<div>
									<div class="infoItem">
										<h6>prezzo</h6>
										<div id="prezzoItem" class="prezzo">0 &euro;</div>
										<label for="quantity">Quantit&agrave; </label>
										<select class="quantity" name="quantity" id="quantityItem">
											<option value="1"> 1 </option>
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
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script type="text/javascript"> initFileSelect(); cerca();</script>
	</body>
</html>