<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<div id="divSignIn" class="modal1">
		<div onclick="closeSignIn()" class="close" title="Close Modal">&times;</div>
			
			<form action="RegistraUtente"  class="modal-content1 aniamte logInForm" method="post" onsubmit="event.preventDefault(); return validateSignIn(this);">
			 <!--Previene che il form venga sottomesso senza verifica -->
				<div class="logInTitle">SignIn</div>
			
				<div class="txt_fieldLogIn">
					<input type="text" name="nome" id="nomeInput" class="logInInput" required="required"/>
					<span class="spanLogIn"></span>
					<label for="nome" class="logInLbl">Nome</label> 
				</div>
				<div class="txt_fieldLogIn">	
					<input type="text" name="cognome" id="cognomeInput" class="logInInput" required="required"/>
					<span class="spanLogIn"></span>
					<label for="cognome" class="logInLbl">Cognome</label>
				</div>
				<div class="txt_fieldLogIn">
					<input type="text" name="dataNascita" id="dataNascitaInput" class="logInInput"  required="required"/>
					<span class="spanLogIn"></span>
					<label for="dataNascita" class="logInLbl">Data Di Nascita</label> <br>
							
				</div>
				
				<div class="txt_fieldLogIn">
					<input type="tel" name="telefono" id="telefonoInput" class="logInInput" required="required"/>
					<span class="spanLogIn"></span>
					<label for="telefono" class="logInLbl">Numero di cellulare</label> 
				</div>
				<div class="txt_fieldLogIn">	
					<input type="email" name="email" id="emailInput" class="logInInput" required="required"/>
					<span class="spanLogIn"></span>
					<label for="email"class="logInLbl">E-mail</label>
				
				</div>
				
				<div class="txt_fieldLogIn">
						<div class="showPswLogIn">
							<i id="closedEyePassword1" class="fas fa-eye-slash" onclick="showPassword('passwordInput','closedEyePassword1','openEyePassword1')"> </i>
							<i id="openEyePassword1" class="far fa-eye" onclick="hidePassword('passwordInput','openEyePassword1','closedEyePassword1')"></i> 	
						</div>
						<input id="passwordInput" type="password" name="password" class="logInInput" required="required"/>
						<span class="spanLogIn"></span>
						<label for="password" class="logInLbl">Password</label>
				</div>
				
				<div class="txt_fieldLogIn">	
						<div class="showPswLogIn">
							<i id="closedEyePassword2" class="fas fa-eye-slash" onclick="showPassword('confermaPasswordInput','closedEyePassword2','openEyePassword2')"> </i>
							<i id="openEyePassword2" class="far fa-eye" onclick="hidePassword('confermaPasswordInput','openEyePassword2','closedEyePassword2')"></i> 	
						</div>
						<input id="confermaPasswordInput" type="password" name="confermaPassword" class="logInInput" required="required"/>
						<span class="spanLogIn"></span>
						<label for="confermaPassword" class="logInLbl">Conferma Password</label>
						
				</div>
			
				<div class="wrap-LogInBtn">
					<input type="submit" name="signIn" class="signInInput" />
				</div>
				
			</form>
		</div>
		<script src="https://kit.fontawesome.com/46a2d5ed1b.js" ></script>
		<script src="code.js" ></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>