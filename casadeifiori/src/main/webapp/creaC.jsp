<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<div class="modal fade modelcontentC" id="caratterisicheModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
    <div class="modal-content modelcontentA">
      <div class="modal-header d-flex justify-content-center colorHeader modelcontentB">
        <h5 class="modal-title" id="exampleModalLabel">Crea Caratterisiche</h5>
      </div>
      <form action="">
      	<div class="modal-body text-center">
      		<label for="namec">Nome:</label><br> 
			<input id="namec" name="namec" type="text" maxlength="20" required placeholder="inserire nome"><br>
			<label for="Suggerimentoc">Suggerimento:</label><br> 
			<input id="Suggerimentoc" name="Suggerimentoc" type="text" maxlength="20" required placeholder="inserire suggerimento"><br>  
      	</div>
      	<div class="modal-footer d-flex justify-content-center colorFooter modelcontentC">
        	<button type="reset" class="btn btn-secondary" data-dismiss="modal">chiudi</button>
        	<button type="submit" class="btn colorArangio" onClick="creaC()">Crea</button>
      	</div>
      </form>
    </div>
  </div>
</div>