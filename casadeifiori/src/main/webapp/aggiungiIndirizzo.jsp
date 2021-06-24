<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="main/style.jsp"%>
	<%@ include file="main/script.jsp"%>
	<%@ include file="main/menuMobile.jsp"%>
	<header>
		<%@ include file="main/header.jsp"%>
	</header>
	<nav>
		<%@ include file="main/navigationBar.jsp"%>
	</nav>
		<div id="main">
			<h1>Indirizzo di Spedizione</h1>
 		 	<p>Inserisci dettagli spedizione.</p>
			<div class="AddShippngAddress">
				<form action="AggiungiIndirizzo" method="post" >
					<div class="txtFieldAddAddress">
						<label class="AddressLabel" for="nome">
							<span class="AddressLabelSpan" >Nome</span>
							<input class="AddressInput" type="text" id="nomeIndirizzo" name="nome"/>
						</label>
					</div>
					<div class="txtFieldAddAddress">
						<label class="AddressLabel" for="Cognome">
							<span class="AddressLabelSpan" >Cognome</span>
							<input class="AddressInput" type="text" id="cognomeIndirizzo" name="Cognome"/>
						</label>
					</div>
					<div class="txtFieldAddAddress">
						<label class="AddressLabel" for="citta">
							<span class="AddressLabelSpan" >Citt&#225; </span>
							<input class="AddressInput" type="text" id="cittaIndirizzo" name="citta"/>
						</label>
					</div>
					<div class="txtFieldAddAddress">
						<label class="AddressLabel" for="CAP">
							<span class="AddressLabelSpan" >CAP</span>
							<input class="AddressInput" type="text" id="CAPIndirizzo" name="CAP"/>
						</label>
					</div>
					<div class="txtFieldAddAddress">
						<label class="AddressLabel" for="via">
							<span class="AddressLabelSpan" >Via</span>
							<input class="AddressInput" type="text" id="viaIndirizzo" name="via"/>
						</label>
					</div>
					<div class="txtFieldAddAddress">
						<label class="AddressLabel" for="interno">
							<span class="AddressLabelSpan" >Interno</span>
							<input class="AddressInput" type="text" id="internoIndirizzo" name="interno"/>
						</label>
					</div>
					<div class="txtFieldAddAddress">
						<label class="AddressLabel" for="numeroCivico">
							<span class="AddressLabelSpan" >Numero Civico</span>
							<input class="AddressInput" type="text" id="numeroCivicoIndirizzo" name="numeroCivico"/>
						</label>
					</div>
					<div class="txtFieldAddAddress">
						<label class="AddressLabel" for="provincia">
							<span class="AddressLabelSpan" >Provincia</span>
							<input class="AddressInput" type="text" id="provinciaIndirizzo" name="provincia"/>
						</label>
					</div>
					
					<div class="buttonAddAddress">
						<input type="submit" value="Aggiungi" >
					</div>
				</form>
			</div>
		</div>
	<footer>
		<%@ include file="main/footer.jsp"%>
	</footer>
</body>
</html>