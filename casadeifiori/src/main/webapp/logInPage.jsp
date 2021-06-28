<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<div id="divLogIn" class="modal1">
	<div onclick="closeLogIn()" class="close1" title="Close Modal">&times;</div>

	<div class="modal-content1 aniamte logInForm">
		<div class="logInTitle">
			<button class="formLogInBtn" id="contentFormLogInBtn"
				onclick="switchLogInContent('contentFormLogIn','contentFormSignIn')">Log-in</button>
			<button class="formLogInBtn" id="contentFormSignInBtn"
				onclick="switchLogInContent('contentFormSignIn','contentFormLogIn')">Sign-in</button>
		</div>

		<form action="logIn" method="post" id="contentFormLogIn"
			onsubmit="event.preventDefault(); return logInCheck(this);">


			<div class="txt_fieldLogIn">
				<input type="text" name="username" class="logInInput"
					required="required" id="logInUsername" /> <span class="spanLogIn"></span>
				<label for="username" class="logInLbl">Email o numero di
					telefono</label>
			</div>

			<div class="txt_fieldLogIn">
				<div class="showPswLogIn">
					<i id="closedEyePassword" class="fas fa-eye-slash"
						onclick="showPassword('logInPassword','closedEyePassword','openEyePassword')">
					</i> <i id="openEyePassword" class="far fa-eye"
						onclick="hidePassword('logInPassword','openEyePassword','closedEyePassword')"></i>
				</div>
				<input type="password" name="password" class="logInInput"
					id="logInPassword" required="required" /> <span class="spanLogIn"></span>
				<label for="password" class="logInLbl">Password </label>
			</div>
			<div class="signup_link">
				<a href="">Password dimenticata?</a>
			</div>

			<div class="wrap-LogInBtn">
				<input type="submit" value="log In">
			</div>
			<div class="signup_link">
				Non sei iscritto? <a
					onclick="switchLogInContent('contentFormSignIn','contentFormLogIn')">Sing-in</a>
			</div>
		</form>


		<form action="RegistraUtente"
			onsubmit="event.preventDefault(); return validateSignIn(this);"
			method="post" id="contentFormSignIn">
			<!--Previene che il form venga sottomesso senza verifica -->
			<div class="txt_fieldLogIn">
				<input type="text" name="nome" id="nomeInput" class="logInInput"
					required="required" /> <span class="spanLogIn"></span> <label
					for="nome" class="logInLbl">Nome</label>
			</div>
			<div class="txt_fieldLogIn">
				<input type="text" name="cognome" id="cognomeInput"
					class="logInInput" required="required" /> <span class="spanLogIn"></span>
				<label for="cognome" class="logInLbl">Cognome</label>
			</div>
			<div class="txt_fieldLogIn">
				<input type="text" name="dataNascita" id="dataNascitaInput"
					class="logInInput" required="required" /> <span class="spanLogIn"></span>
				<label for="dataNascita" class="logInLbl">Data Di Nascita</label> <br>

			</div>

			<div class="txt_fieldLogIn">
				<input type="tel" name="telefono" id="telefonoInput"
					class="logInInput" required="required" /> <span class="spanLogIn"></span>
				<label for="telefono" class="logInLbl">Numero di cellulare</label>
			</div>
			<div class="txt_fieldLogIn">
				<input type="email" name="email" id="emailInput" class="logInInput"
					required="required" /> <span class="spanLogIn"></span> <label
					for="email" class="logInLbl">E-mail</label>

			</div>

			<div class="txt_fieldLogIn">
				<div class="showPswLogIn">
					<i id="closedEyePassword1" class="fas fa-eye-slash"
						onclick="showPassword('passwordInput','closedEyePassword1','openEyePassword1')">
					</i> <i id="openEyePassword1" class="far fa-eye"
						onclick="hidePassword('passwordInput','openEyePassword1','closedEyePassword1')"></i>
				</div>
				<input id="passwordInput" type="password" name="password"
					class="logInInput" required="required" onfocus="showPswInfo()"
					onblur="hidePswInfo()" onkeyup="pswReqCheck()" /> <span
					class="spanLogIn"></span> <label for="password" class="logInLbl">Password</label>
			</div>

			<div id="pswRequisiti" class="txt_fieldLogIn">
				<h3>La Password deve contenere:</h3>
				<p id="letter" class="invalid">
					Un <b>carattere minuscolo</b>
				</p>
				<p id="capital" class="invalid">
					Un <b>carattere maiuscolo</b>
				</p>
				<p id="number" class="invalid">
					Un <b>numero</b>
				</p>
				<p id="specialChar" class="invalid">
					Un <b>carattere speciale</b>
				</p>
				<p id="length" class="invalid">
					minimo <b>8 caratteri</b>
				</p>
			</div>

			<div class="txt_fieldLogIn">
				<div class="showPswLogIn">
					<i id="closedEyePassword2" class="fas fa-eye-slash"
						onclick="showPassword('confermaPasswordInput','closedEyePassword2','openEyePassword2')">
					</i> <i id="openEyePassword2" class="far fa-eye"
						onclick="hidePassword('confermaPasswordInput','openEyePassword2','closedEyePassword2')"></i>
				</div>
				<input id="confermaPasswordInput" type="password"
					name="confermaPassword" class="logInInput" required="required" />
				<span class="spanLogIn"></span> <label for="confermaPassword"
					class="logInLbl">Conferma Password</label>

			</div>

			<div class="wrap-LogInBtn">
				<input type="submit" name="signIn" class="signInInput"
					value="Iscriviti" />
			</div>

		</form>
	</div>


</div>