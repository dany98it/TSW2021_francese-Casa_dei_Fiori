<%@ page import="model.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="it">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<title>Home</title>
<%@ include file="main/style.jsp"%>
</head>
<body>
	<%@ include file="main/script.jsp"%>
	<%@ include file="main/menuMobile.jsp"%>
	<header>
		<%@ include file="main/header.jsp"%>
	</header>
	<nav>
		<%@ include file="main/navigationBar.jsp"%>
	</nav>
	<div class="main" id="mainInex">
		<div class="slideShowConteiner">
			<div class="slide fade1">
				<img src="img/sfondo2.jpg" style="width: 100%">
				<p class="slideText">
					Fiorai di eccellenza e di esperienza <br><a href="MostraItem?tag=12">#FioriVeri</a>
				</p>
			</div>
			<div class="slide fade1">
				<img src="img/indexphoto.jpg" style="width: 100%">
			</div>
			<div class="slide fade1">
				<img src="img/wedding-3222532_1920.jpg" style="width: 100%">
			</div>
			<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
				onclick="plusSlides(1)">&#10095;</a>
			<div class="slideShowDot">
				<span class="dot" onclick="currentSlide(1)"></span> <span
					class="dot" onclick="currentSlide(2)"></span> <span class="dot"
					onclick="currentSlide(3)"></span>
			</div>
		</div>
		<div class="indexInfo">
			<hr class="lineIndex" size="10" align="center">
			<h1>Garantiamo qualit&aacute; e felicit&aacute;</h1>
			<h4 class="paragraphInfoBox">Dal 1970</h4>
			<hr class="lineIndex" size="10" align="center">
		</div>
			<div>
				<h4 class="HeaderInfoBox">Cosa ti offriamo</h4>
			</div>
		<div class="info">

			<div class="infodiv">
				<img class="infodivImg" alt="" src="img/HP_MOD3_Tangibles_02.jpg">
				<div>
					<h4 class="HeaderInfoBox">UNO STILE UNICO</h4>
				</div>
				<div>
					<p class="paragraphInfoBox"> Da oltre 100 anni ci impegniamo a realizzare
						creazioni floreali all'avanguardia, riconosciuti in tutto il mondo
						per stile e unicit&agrave; </p>
				</div>
			</div>
			<div class="infodiv">
				<img class="infodivImg" alt="" src="img/HP_MOD3_Tangibles_01.gif">
				<div>
					<h4 class="HeaderInfoBox">QUALIT&Agrave; GARANTITA</h4>
				</div>
				<div>
					<p class="paragraphInfoBox"> Consegniamo sempre fiori freschi di premissima
						qualit&agrave; che vengono lavorati dal fiorista pi&ugrave; vicino
						al luogo di destinazione poco prima della consegna </p>
				</div>
			</div>
			<div class="infodiv">
				<img class="infodivImg" alt="" src="img/HP_MOD3_Tangibles_03.jpg">
				<div>
					<h4 class="HeaderInfoBox">CONSEGNA IN GIORNATA</h4>
				</div>
				<div>
					<p class="paragraphInfoBox"> Per tutti i nostri prodotti floreali &egrave;
						disponibile la consegna in giornata. Il tuo regalo floreale
						arriver&agrave; a poche ore dall'ordine effettuato </p>
				</div>
			</div>
		</div>
		<div class="ListItemText">
			<h1 class="HeaderInfoBox">Prodotti Pi&uacute; acquistati</h1>
		</div>
		<div id="paginated_gallery" class="gallery">
			<div class="gallery_scroller">
				<%Collection<Tag> tagsIndex= new TagDAO().doRetrieveByDescrizione("home");
				for(Tag tagIndex:tagsIndex){%>
				<%Collection<Item> itemsIndex=new ItemDAO().doRetrieveByTag(tagIndex.getId());
								for(Item bean:itemsIndex){%>
				<div class="itemCard colored_card">

					<div class="box-up">
						<a href="MostraDettagliItem?itemID=<%=bean.getId()%>"> <%Mostra mostraIndex =new MostraDAO().doRetrieveByItem(bean.getId());%>
							<img class="itemCardImg" alt=" <%= bean.getNome() %> "
							src="mostraImg?imgID=<%=mostraIndex.getImmagine()%>"
							height="200px"></a>
						<div class="itemCardImgInfo">
							<div class="itemCardImgInfoInner">
								<a class="itemCardImgInfoInnerLink"
									href="MostraDettagliItem?itemID=<%=bean.getId()%>"><span
									class="itemCardProductName"><%= bean.getNome()%></span></a>
							</div>
						</div>
					</div>
				</div>
				<%}}%>
			</div>
			<span class="btn_prev"></span> <span class="btn_next"></span>
		</div>
		<div id="instagram-feed1" class="instagram_feed"></div>

		<script src="https://apps.elfsight.com/p/platform.js" defer></script>
		<div class="elfsight-app-d89c3258-9692-4972-8f61-9527af6827c6"></div>
		<footer>
			<%@ include file="main/footer.jsp"%>
		</footer>
	</div>
	<script> startShowSlides(); cerca(); </script>
</body>
</html>