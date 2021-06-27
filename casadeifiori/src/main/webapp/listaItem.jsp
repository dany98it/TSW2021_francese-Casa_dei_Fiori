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

		<header>
			<%@include file="main/header.jsp"%>
		</header>
		<nav>
			<%@ include file="main/navigationBar.jsp"%>
		</nav>
	<div id="mainListItem" class="main">	
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
		<div class="imgListItem">
			<img alt="Prodotti" src="img/listaItemImg.png" style="width: 100%">
			<div class="imgListItemText">
				<h1>Essere vinti dal profumo dei fiori è una forma deliziosa di sconfitta</h1>
				<p>Prdototti di qualità dal 1970</p>
			</div>
		</div>
		<!--<div id="itemListFilter">

			<button id="submitItemFitler" value="filtra">filtra</button>

		</div>-->
		
		<div class="itemListing">
			<%
					if (products != null && products.size() != 0) {
					Iterator<?> it = products.iterator();
					while (it.hasNext()) {
						Item bean = (Item) it.next();
			%>
			<div class="itemCard">

				<div class="box-up">
					<a href="MostraDettagliItem?itemID=<%=bean.getId()%>">
					<%Mostra mostraIndex =new MostraDAO().doRetrieveByItem(bean.getId());%>
								<img class="itemCardImg" alt=" <%= bean.getNome() %> " src="mostraImg?imgID=<%=mostraIndex.getImmagine()%>" height="200px"></a>
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
						class="itemCardPrice"><%=String.format(Locale.ENGLISH,"%.2f", bean.calcolaPrezzo()) %> <i
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
					<div class="itemCardCart" >
						<span class="itemCardPrice">Esaurito</span> <span
							class="itemCardAddCart"> 
							<span class="itemCardAddCartText">Non dispoibile</span>
						</span>
					</div>
				</div>
				<% }if(isAdmin){%>
				<div class="box-down">
					<div class="h-bg3">
						<div class="h-bg-inner3"></div>
					</div>
					<div class="itemCardCart2">
					<a class="itemCardCart"
						href="modifica?itemID=<%=bean.getId()%>"> <span class="itemCardPrice2">Modifica</span> 
						<span class="itemCardAddCart2"> <span class="itemCardAddCartText2">Modifica</span>
						</span>
					</a>
					</div>
				</div>
				<div class="box-down">
					<div class="h-bg2">
						<div class="h-bg-inner2"></div>
					</div>
					<div class="itemCardCart2">
					<a class="itemCardCart"
						href="delete?itemID=<%=bean.getId()%>"> <span class="itemCardPrice2">Elimina</span> 
						<span class="itemCardAddCart2"> <span class="itemCardAddCartText2">Definitivamente</span>
						</span>
					</a>
						
					</div>
				</div>
			<% } %>
			</div>
			<%}} %>
		</div>
		</div>
		<footer>
			<%@ include file="main/footer.jsp"%>
		</footer>
		<script type="text/javascript"> cerca();</script>
</body>
</html>