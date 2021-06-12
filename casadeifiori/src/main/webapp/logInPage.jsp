<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	<div id="divLogIn" class="modal1">
		<div onclick="closeLogIn()" class="close" title="Close Modal">&times;</div>
			
			<form action="logIn" id="logInForm" class="modal-content1 aniamte" method="post">
				<div class="logInTitle">Login</div>
			
				<div class="txt_fieldLogIn">
					<input type="text" name="username" class="logInInput" required="required"/>
					<span class="spanLogIn"></span>
					<label for="username" class="logInLbl">Email o nuemro di telefono</label>
				</div>
				
				<div class="txt_fieldLogIn">
					<div class="showPswLogIn">
						<i id="closedEyePassword" class="fas fa-eye-slash" onclick="showPassword('logInPassword','closedEyePassword','openEyePassword')"> </i>
						<i id="openEyePassword" class="far fa-eye" onclick="hidePassword('logInPassword','openEyePassword','closedEyePassword')"></i> 	
					</div>
					<input type="password" name="password" id="logInPassword" required="required" />
					<span class="spanLogIn"></span>
					<label for="password" class="logInLbl">Password </label> 
				</div>
				<div class="signup_link">
					<a href="">Password dimenticata?</a>
				</div>
			
				<div class="wrap-LogInBtn">
					<input type="submit" value="log In">
				</div>
				<div class="signup_link">
					Non sei iscritto? <a href="signInPage.jsp">Sing-in</a>
				</div>
				
			</form>
		</div>