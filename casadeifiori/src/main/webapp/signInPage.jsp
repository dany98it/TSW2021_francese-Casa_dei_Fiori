<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign in</title>
</head>
<header>
		<%@ include file="main/header.jsp"%>
	</header>
	<nav>
		<%@ include file="main/navigationBar.jsp"%>
	</nav>
<body>
	<h1>Sign in</h1>
	<form action="RegistaUtente" method="post">
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
			<input type="password" name="password" class="signInInput" placeholder="Inserisci password" required="required"/> <br>
			
			<label for="confermaPassword" class="signInLbl">Conferma Password</label> <br>
			<input type="password" name="confermaPassword" class="signInInput" placeholder="Conferma password" disabled="disabled"/> <br>
			
		</fieldset>
		
		<input type="submit" name="signIn" class="signInInput" /> <br>
	</form>
</body>
	<footer>
		<%@ include file="main/footer.jsp" %>
	</footer>
</html>