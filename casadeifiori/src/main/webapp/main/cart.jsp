<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*,model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

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
<body>
	<main>
    <div class="basket">
      <div class="basket-module">
        <label for="promo-code">Codice Promozionale</label>
        <input id="promo-code" type="text" name="promo-code" maxlength="5" class="promo-code-field">
        <button class="promo-code-cta">Apply</button>
      </div>
      <div class="basket-labels">
        <ul>
          <li class="item item-heading">Item</li>
          <li class="price">Prezzo</li>
          <li class="quantity">Quantità</li>
          <li class="subtotal">Subtotale</li>
        </ul>
      </div>
      
      <div class="basket-product">
      	<%
			if (products != null && products.size() != 0) {
			Iterator<?> it = products.iterator();
			while (it.hasNext()) {
				ItemCarrello bean = (ItemCarrello) it.next(); %>
        <div class="item">
          <div class="product-image">
            <img src="http://placehold.it/120x166" alt="Immagine prodotto non disponibile" class="product-frame">
          </div>
          <div class="product-details">
            <h1><strong><span class="item-quantity"><%= bean.getItem().getQuantita() %></span> <%= bean.getItem().getNome() %></strong></h1>
            <p><strong><%= bean.getItem().getDescrizione() %></strong></p>
            <p>Codice prodotto - <%= bean.getItem().getId() %></p>
          </div>
        </div>
        <div class="price"><%=bean.getItem().calcolaPrezzo()%></div>
        <div class="quantity">
          <input type="number" value="4" min="1" class="quantity-field">
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
          <div class="subtotal-value final-value" id="basket-subtotal"><%= cart.getCostoTotale() %>/div>
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
        <div class="summary-checkout">
          <button class="checkout-cta">Checkout</button>
        </div>
      </div>
      </div>
    </aside>
  </main>
</body>
</html>
	