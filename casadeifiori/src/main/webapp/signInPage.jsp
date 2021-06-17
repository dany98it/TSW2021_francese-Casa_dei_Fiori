<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="it">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta charset="utf-81">
		<title>Sign in</title>
		<%@ include file="main/style.jsp" %>
	</head>
	<body>
		<%@ include file="main/menuMobile.jsp" %>
		<div id="main">
			<header>
				<%@ include file="main/header.jsp"%>
			</header>
			<nav>
				<%@ include file="main/navigationBar.jsp"%>
			</nav>
			<script src="https://kit.fontawesome.com/46a2d5ed1b.js" ></script>
			<script src="code.js" ></script>
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		
			<h1>Sign in</h1>
			
			<form action="RegistraUtente" method="post" onsubmit="event.preventDefault(); return validateSignIn(this);">
			 <!--Previene che il form venga sottomesso senza verifica -->
				<fieldset>
					<legend>Dati Anagrafici</legend>
					<label for="nome" class="signInLbl">Nome</label> <br>
					<input type="text" name="nome" id="nomeInput" class="signInInput" placeholder="Inserisci nome" required="required"/> <br>
					<label for="cognome" class="signInLbl">Cognome</label> <br>
					<input type="text" name="cognome" id="cognomeInput" class="signInInput" placeholder="Inserisci cognome" required="required"/> <br>
					<label for="dataNascita" class="signInLbl">Data Di Nascita</label> <br>
					<input type="date" name="dataNascita" id="dataNascitaInput" class="signInInput" required="required"/> <br>
				</fieldset>
				<fieldset>
					<legend>Dati Di Contatto</legend>
					<label for="telefono" class="signInLbl">Numero di cellulare</label> <br>
					<input type="tel" name="telefono" id="telefonoInput" class="signInInput" placeholder="Inserisci numero di telefono" required="required"/> <br>
					<label for="email" class="signInLbl">E-mail</label> <br>
					<input type="email" name="email" id="emailInput" class="signInInput" placeholder="Inserisci email" required="required"/> <br>
				</fieldset>
				<fieldset>
					<legend>Sicurezza</legend>
					<label for="password" class="signInLbl">Password</label> <br>
					<input id="passwordInput" type="password" name="password" class="signInInput" placeholder="Inserisci password" required="required"/>
					<i id="closedEyePassword" class="fas fa-eye-slash" onclick="showPassword('passwordInput','closedEyePassword','openEyePassword')"> </i> 
					<i id="openEyePassword" class="far fa-eye" onclick="hidePassword('passwordInput','openEyePassword','closedEyePassword')"></i> <br>
					<label for="confermaPassword" class="signInLbl">Conferma Password</label> <br>
					<input id="confermaPasswordInput" type="password" name="confermaPassword" class="signInInput" placeholder="Conferma password"/>
					<i id="closedEyePassword2" class="fas fa-eye-slash" onclick="showPassword('confermaPasswordInput','closedEyePassword2','openEyePassword2')"> </i> 
					<i id="openEyePassword2" class="far fa-eye" onclick="hidePassword('confermaPasswordInput','openEyePassword2','closedEyePassword2')"></i> <br>
				</fieldset>
				<input type="submit" name="signIn" class="signInInput" /> <br>
			</form>
			<footer>
				<%@ include file="main/footer.jsp" %>
			</footer>
		</div>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script type="text/javascript"> cerca();</script>
	</body>
</html>