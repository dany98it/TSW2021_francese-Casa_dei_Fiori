<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<div class="modal fade" id="tagModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header d-flex justify-content-center">
        <h5 class="modal-title" id="exampleModalLabel">Crea Tag</h5>
      </div>
      <form action="">
      	<div class="modal-body text-center">
      		<label for="name">Nome:</label><br> 
			<input id="name" name="name" type="text" maxlength="20" required placeholder="inserire nome"><br>
			<label for="Suggerimento">Suggerimento:</label><br> 
			<input id="Suggerimento" name="Suggerimento" type="text" maxlength="20" required placeholder="inserire suggerimento"><br>  
      	</div>
      	<div class="modal-footer d-flex justify-content-center">
        	<button type="reset" class="btn btn-secondary" data-dismiss="modal">chiudi</button>
        	<button type="submit" class="btn btn-primary">Crea</button>
      	</div>
      </form>
    </div>
  </div>
</div>