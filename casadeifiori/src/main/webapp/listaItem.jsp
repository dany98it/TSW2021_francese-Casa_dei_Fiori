<%@page import="java.util.*,model.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; utf-8">
<title>Casa dei Fiori</title>
<%@ include file="main/style.jsp"%>
</head>
<body>
	<%@ include file="main/script.jsp"%>
	<%@ include file="main/menuMobile.jsp"%>
	<div id="main">
		<header>
			<%@include file="main/header.jsp"%>
		</header>
		<nav>
			<%@ include file="main/navigationBar.jsp"%>
		</nav>
		<%
			Collection<?> products = (Collection<?>) request.getAttribute("itemsCollection");
				if(products == null) {
				response.sendRedirect("./MostraItem");	
				return;
			}
			boolean isAdmin;
			if(sessione.getAttribute("isAdmin")!=null){
				isAdmin=(boolean) sessione.getAttribute("isAdmin"); 
			} else{
				isAdmin=false;
			}
		%>
		<h2>Products</h2>
		<div id="itemListFilter">

			<button id="submitItemFitler" value="filtra">filtra</button>

		</div>

		<div class="itemListing">
			<%
					if (products != null && products.size() != 0) {
					Iterator<?> it = products.iterator();
					while (it.hasNext()) {
						Item bean = (Item) it.next();
			%>
			<div class="itemCard">

				<div class="box-up">
					<a href="MostraDettagliItem?itemID=<%=bean.getId()%>"> <img
						alt="itemCarrello" class="itemCardImg" src="img/fiori2.jpg"
						height="200px"></a>
					<div class="itemCardImgInfo">
						<div class="itemCardImgInfoInner">
							<a class="itemCardImgInfoInnerLink"
								href="MostraDettagliItem?itemID=<%=bean.getId()%>"><span
								class="itemCardProductName"><%= bean.getNome()%></span></a>
						</div>
					</div>
				</div>


				<% if(bean.getQuantita()>0) { %>
				<div class="box-down">
					<div class="h-bg">
						<div class="h-bg-inner"></div>
					</div>
					<a class="itemCardCart"
						href="javascript:addCart(<%=bean.getId()%>,1)"> <span
						class="itemCardPrice"><%= bean.calcolaPrezzo() %> <i
							class="fas fa-cart-plus iconCart"></i></span> 
							<span class="itemCardAddCart"> <span class="itemCardAddCartText">Aggiungi</span>
					</span>
					</a>
				</div>
				<% } else{%>
				<div class="box-down">
					<div class="h-bg">
						<div class="h-bg-inner"></div>
					</div>
					<div class="itemCardCart" href="">
						<span class="itemCardPrice">Esaurito</span> <span
							class="itemCardAddCart"> 
							<span class="itemCardAddCartText">Non dispoibile</span>
						</span>
					</div>
				</div>
				<% }if(isAdmin){%>
				<div class="box-down">
					<div class="h-bg2">
						<div class="h-bg-inner2"></div>
					</div>
					<div class="itemCardCart2" href="">
						<span class="itemCardPrice2">Elimina</span> 
							<span class="itemCardAddCart2"> <span class="itemCardAddCartText2">Definitivamente</span>
						</span>
					</div>
				</div>
			<% } %>
			</div>
			<%}} %>
		</div>
		<footer>
			<%@ include file="main/footer.jsp"%>
		</footer>
		<script type="text/javascript"> cerca();</script>
</body>
</html>