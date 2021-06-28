<%@ page import="model.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<title>Pagamento</title>
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
	<div id="main" class="mainCheckoutPage">
		<div class="checkoutDiv">
			<div class="creditCardDetailsChechout">
				<% IndirizzoDAO iDao= new IndirizzoDAO();
				User user =(User)sessione.getAttribute("loggedUser");
				if(user!=null){
					Collection<Indirizzo> indirizzi = iDao.doRetrieveAllByUser(user.getId());%>
				<h6>Seleziona Indirizzo di Spedizione:</h6>
				<%if(indirizzi.isEmpty()){%>
				<button>Aggiungi Nuovo Indirizzo</button>
				<%}else{%>
				<div class="creditCardDetailsChechoutField">
					<select name="indirizzoChechout" id="inputIndirizzoChechout">
						<% for(Indirizzo i: indirizzi){%>
						<option value=<%= i.getId()%>><%= i.toString() %></option>
						<%}%>
					</select>
				</div>
				<div class="buttonAddAddressDiv">
					<button class="buttonAddAddress"
						onclick="location.href='aggiungiIndirizzo.jsp'">Aggiungi
						Nuovo Indirizzo</button>
				</div>
				<%}}%>
			</div>
			<h6>Dettagli Carta di Credito</h6>
			<div class="creditCardDetailsChechout creditCardDetailsChechout--2">
				<label class="AddressLabel" for="creditCardNome"> <span
					class="AddressLabelSpan">NOME</span> <input class="AddressInput"
					type="text" name="creditCardNome" placeholder="MARIO"
					autocomplete="given-name">
				</label> <label class="AddressLabel" for="creditCardCognome"> <span
					class="AddressLabelSpan">COGNOME </span> <input
					class="AddressInput" type="text" name="creditCardCognome"
					placeholder="ROSSI" autocomplete="family-name">
				</label>
			</div>
			<i class="fas fa-credit-card" style="font-size: 30px"
				id="creditCardIcon"></i>
			<div class="creditCardDetailsChechout">
				<label class="AddressLabel" for="creditCardNumber"> <span
					class="AddressLabelSpan"> NUMERO CARTA DI CREDITO </span> <input
					id="creditCard" onchange="cambiaIcona()"
					class="AddressInput input-card" type="text" name="creditCardNumber"
					placeholder="XXXX XXXX XXXX XXXX" autocomplete="cc-number">
				</label>
			</div>
			<div class="creditCardDetailsChechout creditCardDetailsChechout--2">

				<label class="AddressLabel" for="creditCardEXPDate"> <span
					class="AddressLabelSpan">DATA SCADENZA </span> <input
					id="creditCardDate" class="AddressInput input-datacard" type="text"
					name="creditCardEXPDate" placeholder="MM/YY" autocomplete="cc-exp"
					data-date-format="mm/yy" data-start-view="year"
					data-min-view="year">
				</label> <label class="AddressLabel" for="creditCardCVV"> <span
					class="AddressLabelSpan">CVV</span> <input class="AddressInput"
					type="password" name="creditCardCVV" placeholder="XXX">
				</label>
			</div>
			<div class="buttonAddAddressDiv">
				<form action="EffettuaCheckOut" method="post">
					<input type="submit" class="buttonCheckout" value="Checkout">
				</form>
			</div>
		</div>
	</div>

	<footer>
		<%@ include file="main/footer.jsp"%>
	</footer>
	<script type="text/javascript">
			cardDatapickerInit("creditCardDate");
		</script>
</body>
</html>