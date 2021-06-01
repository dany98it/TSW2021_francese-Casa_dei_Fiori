<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<div id="divLogIn" class="modal1">
		<div onclick="closeLogIn()" class="close" title="Close Modal">&times;</div>

			<form action="logIn" class="modal-content1 animate" method="post">
				<span class="logInTitle">Login</span>
			
				<div class="wrap-inputLogIn">
					<label for="username" class="logInLbl">Email o nuemro di telefono</label> <br>
					<input type="text" name="username" class="logInInput" placeholder="Inserisci Email o numero di telefono" required="required"/> <br>
				</div>
				
				<div class="wrap-inputLogIn">
					<label for="password" class="logInLbl">Password </label> <br>
					<input type="password" name="password" class="logInInput" id="logInPassword" placeholder="Inserisci password" required="required" />
					<i id="closedEyePassword" class="fas fa-eye-slash" onclick="showPassword('logInPassword','closedEyePassword','openEyePassword')"> </i>
					<i id="openEyePassword" class="far fa-eye" onclick="hidePassword('logInPassword','openEyePassword','closedEyePassword')"></i> <br>	
				</div>
				<div class="forgotPswLogIn">
					<a href="">Password dimenticata?</a>
				</div>
			
				<div class="wrap-LogInBtn">
					<input type="submit" value="log In" class="logInBtn">
				</div>
				Altrimenti Iscriviti<a href="signInPage.jsp">Sing-in</a>
			</form>
		</div>