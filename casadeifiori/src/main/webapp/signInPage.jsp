<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Sign in</title>
		<script src="https://kit.fontawesome.com/46a2d5ed1b.js" ></script>
		<link rel=StyleSheet href="style.css" type="text/css">
	</head>
	<body>
		<header>
			<%@ include file="main/header.jsp"%>
		</header>
		<nav>
			<%@ include file="main/navigationBar.jsp"%>
		</nav>
		<h1>Sign in</h1>
		<form action="RegistraUtente" method="post">
			<fieldset>
				<legend>Dati Anagrafici</legend>
				<label for="nome" class="signInLbl">Nome</label> <br>
				<input type="text" name="nome" class="signInInput" placeholder="Inserisci nome" required="required"/> <br>
				<label for="cognome" class="signInLbl">Cognome</label> <br>
				<input type="text" name="cognome" class="signInInput" placeholder="Inserisci cognome" required="required"/> <br>
				<label for="dataNascita" class="signInLbl">Data Di Nascita</label> <br>
				<input type="date" name="dataNascita" class="signInInput" required="required"/> <br>
			</fieldset>
			<fieldset>
				<legend>Dati Di Contatto</legend>
				<label for="telefono" class="signInLbl">Numero di cellulare</label> <br>
				<input type="tel" name="telefono" class="signInInput" placeholder="Inserisci numero di telefono" required="required"/> <br>
				<label for="email" class="signInLbl">E-mail</label> <br>
				<input type="email" name="email" class="signInInput" placeholder="Inserisci email" required="required"/> <br>
			</fieldset>
			<fieldset>
				<legend>Sicurezza</legend>
				<label for="password" class="signInLbl">Password</label> <br>
				<input id="psw" type="password" name="password" class="signInInput" placeholder="Inserisci password" required="required"/>
				<i id="closedEyePassword" class="fas fa-eye-slash" onclick="showPassword('psw','closedEyePassword','openEyePassword')"> </i> <i id="openEyePassword" class="far fa-eye" onclick="hidePassword('psw','openEyePassword','closedEyePassword')"></i> <br>
				<label for="confermaPassword" class="signInLbl">Conferma Password</label> <br>
				<input id="cpsw" type="password" name="confermaPassword" class="signInInput" placeholder="Conferma password" disabled="disabled"/>
				<i id="closedEyePassword2" class="fas fa-eye-slash" onclick="showPassword('cpsw','closedEyePassword2','openEyePassword2')"> </i> <i id="openEyePassword2" class="far fa-eye" onclick="hidePassword('cpsw','openEyePassword2','closedEyePassword2')"></i> <br>
			</fieldset>
			<input type="submit" name="signIn" class="signInInput" /> <br>
		</form>
		<footer>
			<%@ include file="main/footer.jsp" %>
		</footer>
		<script src="code.js" ></script>
	</body>
</html>