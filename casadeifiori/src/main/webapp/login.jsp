<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<div class="modal fade modelcontentC" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
    <div class="modal-content modelcontentA">
      <div class="modal-header d-flex justify-content-center colorHeader modelcontentB">
        <h5 class="modal-title" id="exampleModalLabel">Login</h5>
      </div>
      	<div class="modal-body text-center">
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
      	</div>
      	<div class="modal-footer d-flex justify-content-center colorFooter modelcontentC">
        	<div class="forgotPswLogIn">
				<a href="">Password dimenticata?</a>
			</div>
			<div class="wrap-LogInBtn">
				<input type="submit" value="log In" class="logInBtn">
			</div>
			Altrimenti Iscriviti<a href="signInPage.jsp">Sing-in</a>
      	</div>
    </div>
  </div>
</div>