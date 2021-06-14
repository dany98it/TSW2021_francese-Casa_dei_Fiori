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
		
		<div id="main">
			
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
  	
 <div id="cartDiv">
	<div class="cartPage">
		<!--  <div class="basket-module">
        	<label for="promo-code">Enter a promotional code</label>
        	<input id="promo-code" type="text" name="promo-code" maxlength="5" class="promo-code-field">
        <button class="promo-code-cta">Apply</button>
      </div>
      -->
	</div>
	<div class="cartLabels">
        <ul>
          <li class="cartItem cartItemHeading">Item</li>
          <li class="cartItemPrice">Prezzo</li>
          <li class="cartItemQuantity">Quantità</li>
          <li class="cartItemSubtotal">Subtotale</li>
        </ul>
      </div>
      <%if (products != null && products.size() != 0) {
			Iterator<?> it = products.iterator();
			while (it.hasNext()) {
				ItemCarrello bean = (ItemCarrello) it.next();%>
      <div class="cartProduct">
        <div class="cartItem">
          <div class="productImage">
            <img src="" alt="Immagine prodotto non disponibile" class="productFrame">
          </div>
          <div class="productDetails">
            <h1><strong><span class="cartItemQuantity">4</span> <%= bean.getItem().getNome() %></strong> <%= bean.getItem().getDescrizione() %></h1>
            <p><strong>Navy, Size 18</strong></p>
            <p>Product Code - <%= bean.getItem().getId() %></p>
          </div>
        </div>
        <div class="cartItemPrice"><%= bean.getItem().calcolaPrezzo()%></div>
        <div class="cartItemQuantity">
          <input type="number" value="4" min="1" class="cartItemQuantityField">
        </div>
        <div class="cartItemSubtotal"><%= bean.getCostoTotale() %></div>
        <div class="cartItemRemove">
          <button>Rimuovi</button>
        </div>
      </div>
      <% }
			}
			else{ %>
      <% } %>

      <aside>
      <div class="cartSummary">
        <div class="cartSummaryTotalItems"><span class="cartTotalItems"></span> Oggetti nel carrello</div>
        <div class="cartSummarySubtotal">
          <div class="cartSummarySubtotalTitle">Subtotale</div>
          <div class="cartSummarySubtotalValue cartSummarySubtotalFinalValue" id="cartSubtotal"><%= cart.getCostoTotale()%></div>
          <!--  <div class="summary-promo hide">
            <div class="promo-title">Promotion</div>
            <div class="promo-value final-value" id="basket-promo"></div>
          </div>
          -->
        </div>
        <div class="cartSummaryDelivery">
          <select name="cartDeliveryCollection" class="cartSummaryDeliverSelection">
              <option value="0" selected="selected">Tipo di spedizione:</option>
             <option value="collection">Collection</option>
             <option value="first-class">Royal Mail 1st Class</option>
             <option value="second-class">Royal Mail 2nd Class</option>
             <option value="signed-for">Royal Mail Special Delivery</option>
          </select>
        </div>
        <div class="cartSummaryTotal">
          <div class="cartSummaryTotalTitle">Total</div>
          <div class="cartSummaryTotalValue cartSummarySubtotalFinalValue" id="cartTotal"></div>
        </div>
        <div class="cartSummaryCheckout">
          <button class="cartSummaryCheckoutCta">effettua checkout</button>
        </div>
      </div>
    </aside>
</div>
			
			
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