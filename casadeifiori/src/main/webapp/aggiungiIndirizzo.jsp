<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Aggiungi Indirizzo</title>
<%@ include file="main/style.jsp"%>
</head>
<body>
	<%@ include file="main/script.jsp"%>
	<%@ include file="main/menuMobile.jsp"%>
	<header>
		<%@ include file="main/header.jsp"%>
	</header>
	<nav>
		<%@ include file="main/navigationBar.jsp"%>
	</nav>
	<div id="main" class="mainAddShippingCart">
		<div class="titleAddShippingCart">
			<h3>Indirizzo di Spedizione</h3>
		</div>
		<div class="titleAddShippingCart">
			<p>Inserisci dettagli spedizione.</p>
		</div>

		<div class="AddShippngAddress">
			<form action="AggiungiIndirizzo" method="post">
				<div class="txtFieldAddAddress txtFieldAddAddress--2">
					<label class="AddressLabel" for="nome"> <span
						class="AddressLabelSpan">Nome</span> <input class="AddressInput"
						type="text" id="nomeIndirizzo" name="nome" required="required"
						placeholder="MARIO" />
					</label> <label class="AddressLabel" for="Cognome"> <span
						class="AddressLabelSpan">Cognome</span> <input
						class="AddressInput" type="text" id="cognomeIndirizzo"
						name="Cognome" required="required" placeholder="ROSSI" />
					</label>
				</div>

				<div class="txtFieldAddAddress">
					<label class="AddressLabel" for="provincia"> <span
						class="AddressLabelSpan">Provincia</span> <select
						class="AddressInput" id="provinciaIndirizzo" name="provincia"
						required="required" onchange="selectComuni()">
					</select>
					</label>
				</div>

				<div class="txtFieldAddAddress">
					<label class="AddressLabel" for="citta"> <span
						class="AddressLabelSpan">Citt&#225; </span> <select
						class="AddressInput" id="cittaIndirizzo" name="citta"
						required="required">
					</select>
					</label>
				</div>
				<div class="txtFieldAddAddress">
					<label class="AddressLabel" for="via"> <span
						class="AddressLabelSpan">Via</span> <input class="AddressInput"
						type="text" id="viaIndirizzo" name="via" required="required"
						placeholder="via/corso/viale Roma" />
					</label>
				</div>
				<div class="txtFieldAddAddress txtFieldAddAddress--3">
					<label class="AddressLabel" for="CAP"> <span
						class="AddressLabelSpan">CAP</span> <input class="AddressInput"
						type="text" id="CAPIndirizzo" name="CAP" required="required"
						placeholder="80000" />
					</label> <label class="AddressLabel" for="interno"> <span
						class="AddressLabelSpan">Interno</span> <input
						class="AddressInput" type="text" id="internoIndirizzo"
						name="interno" value="0" placeholder="3" />
					</label> <label class="AddressLabel" for="numeroCivico"> <span
						class="AddressLabelSpan">Numero Civico</span> <input
						class="AddressInput" type="text" id="numeroCivicoIndirizzo"
						name="numeroCivico" required="required" placeholder="189" />
					</label>
				</div>

				<div class="buttonAddAddressDiv">
					<input type="submit" value="Aggiungi" class="buttonAddAddress">
				</div>
			</form>
		</div>
	</div>
	<footer>
		<%@ include file="main/footer.jsp"%>
	</footer>
	<script type="text/javascript">selectProvincia()</script>
</body>
</html>