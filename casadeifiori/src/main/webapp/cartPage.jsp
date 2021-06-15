<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="it">
	<head>
		<meta charset="utf-8">
		<title>Carrello</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel=StyleSheet href="style.css" type="text/css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	</head>
	<body>
		<%@ include file="main/menuMobile.jsp" %>
			<header>
				<%@ include file="main/header.jsp"%>
			</header>	
			<nav>
				<%@ include file="main/navigationBar.jsp"%>
			</nav>
		
<div id="main" class="mainCart">
			
			<%

  	Carrello cart;
  	if(sessione.isNew()){
  		cart = new Carrello();
     	request.getSession().setAttribute("carrello", cart);
  	}
  	else{
  		cart = (Carrello) request.getSession(true).getAttribute("carrello");
  		if(cart==null){
  			cart=new Carrello();
  		}
  	}
  	Collection<?> products;
  	try{
  		products = (Collection<?>) cart.getItemsOrdinati();
  	}catch(Exception e){
  		products= (Collection<?>) cart.getItemsOrdinati();
  	} %>
  	
 <div class="basket">
      <div class="basket-labels">
        <ul>
          <li class="item item-heading">Item</li>
          <li class="price">Prezzo</li>
          <li class="quantity">Quantità</li>
          <li class="subtotal">Subtotale</li>
        </ul>
      </div>
      
      	<%
			if (products != null && products.size() != 0) {
			Iterator<?> it = products.iterator();
			while (it.hasNext()) {
				ItemCarrello bean = (ItemCarrello) it.next(); %>
		<div class="basket-product">
        <div class="item">
          <div class="product-image">
            <img src="img/fiori2.jpg" alt="Immagine prodotto non disponibile" class="product-frame">
          </div>
          <div class="product-details">
            <h1><strong><span class="item-quantity"><%= bean.getQuantita() %> x</span></strong> <%= bean.getItem().getNome() %></h1>
            <p><strong></strong></p>
            <p>Codice prodotto - <%= bean.getItem().getId() %></p>
          </div>
        </div>
        <div class="price"><%=bean.getItem().calcolaPrezzo()%></div>
        <div class="quantity">
        	<select  onchange="addShop(<%=bean.getItem().getId() %>,<%= bean.getItem().getQuantita() %>);" class="quantity" name="quantity" id="<%="quantity"+bean.getItem().getId() %>">
						<% for(int x=0;x<=bean.getItem().getQuantita();x++){ %>
							<option value="<%= x %>" 
								<%if(x==bean.getQuantita()||(x==bean.getItem().getQuantita()&&x<bean.getQuantita())){%>
									selected="selected"
								<%}%>
							> <%= x %> </option>
						<%} %>
			</select>
        </div>
        <div class="subtotal"><%= bean.getCostoTotale()%></div>
        <div class="remove">
          <button>Remove</button>
        </div>
      </div>
      <% }}else{} %>
    </div>
    <aside>
      <div class="summary">
        <div class="summary-total-items"><span class="total-items"></span> Oggetti nel carrello </div>
        <div class="summary-subtotal">
          <div class="subtotal-title">Subtotale</div>
          <div class="subtotal-value final-value" id="basket-subtotal"><%= cart.getCostoTotale() %></div>
          <div class="summary-promo hide">
            <div class="promo-title">Promozione</div>
            <div class="promo-value final-value" id="basket-promo"></div>
          </div>
        </div>
        <div class="summary-delivery">
          <select name="delivery-collection" class="summary-delivery-selection">
              <option value="0" selected="selected">Seleziona tipo di spedizione</option>
             <option value="collection">Collection</option>
             <option value="first-class">Royal Mail 1st Class</option>
             <option value="second-class">Royal Mail 2nd Class</option>
             <option value="signed-for">Royal Mail Special Delivery</option>
          </select>
        </div>
        <div class="summary-total">
          <div class="total-title">Totale</div>
          <div class="total-value final-value" id="basket-total"><%= cart.getCostoTotale()%></div>
        </div>
        <div class="basket-module">
        <label for="promo-code">Codice Promozionale</label>
        <input id="promo-code" type="text" name="promo-code" maxlength="5" class="promo-code-field">
        <button class="promo-code-cta">Apply</button>
      </div>
        <div class="summary-checkout">
          <button class="checkout-cta">Checkout</button>
        </div>
      </div>
 	</aside>
</div>
		<footer>
			<%@ include file="main/footer.jsp" %>
		</footer>
		<script src="https://kit.fontawesome.com/46a2d5ed1b.js" ></script>
		<script src="code.js" ></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script type="text/javascript"> cerca();</script>
	</body>	
</html>