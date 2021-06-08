<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<div class="modal fade modelcontentC" id="tagModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
    <div class="modal-content modelcontentA">
      <div class="modal-header d-flex justify-content-center colorHeader modelcontentB">
        <h5 class="modal-title" id="exampleModalLabel">Crea Tag</h5>
      </div>
      	<div class="modal-body text-center">
      		<label for="nametag">Nome:</label><br> 
			<input id="nametag" name="nametag" type="text" maxlength="20" required placeholder="inserire nome"><br>
			<label for="Suggerimentotag">Suggerimento:</label><br> 
			<input id="Suggerimentotag" name="Suggerimentotag" type="text" maxlength="20" required placeholder="inserire suggerimento"><br>  
      	</div>
      	<div class="modal-footer d-flex justify-content-center colorFooter modelcontentC">
        	<button type="reset" class="btn btn-secondary" data-dismiss="modal">chiudi</button>
        	<button type="submit" class="btn colorArangio" onClick="creaTag()">Crea</button>
      	</div>
    </div>
  </div>
</div>