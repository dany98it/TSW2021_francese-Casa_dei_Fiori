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
	<div class="main">
		<header>
			<%@ include file="main/header.jsp"%>
		</header>
		<nav>
			<%@ include file="main/navigationBar.jsp"%>
		</nav>
		<div class="slideShowConteiner">
			<div class="slide fade1">
				<img src="img/sfondo2.jpg" style="width: 100%">
				<p class="slideText">Essere vinti dal profumo dei fiori &egrave; una forma deliziosa di sconfitta. <a href="MostraItem?tag=12">#FioriVeri</a></p>
			</div>
			<div class="slide fade1">
				<img src="img/logosenzascritta.png" style="width: 100%">
			</div>
			<div class="slide fade1">
				<img src="img/logonew.png" style="width: 100%">
			</div>
			<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a class="next"
				onclick="plusSlides(1)">&#10095;</a>
			<div class="slideShowDot">
				<span class="dot" onclick="currentSlide(1)"></span> <span
					class="dot" onclick="currentSlide(2)"></span> <span class="dot"
					onclick="currentSlide(3)"></span>
			</div>
		</div>
		<div class="info">
			<div class="infodiv">
				<img alt="" src="">
				<div>
					<strong class="center">UNO STILE UNICO</strong>
				</div>
				<div>
					<strong> Da oltre 100 anni ci impegniamo a realizzare
						creazioni floreali all'avanguardia, riconosciuti in tutto il mondo
						per stile e unicità </strong>
				</div>
			</div>
			<div class="infodiv">
				<img alt="" src="">
				<div>
					<strong class="center">QUALITÀ GARANTITA</strong>
				</div>
				<div>
					<strong> Consegniamo sempre fiori freschi di premissima
						qualità che vengono lavorati dal fiorista più vicino al luogo di
						destinazione poco prima della consegna </strong>
				</div>
			</div>
			<div class="infodiv">
				<img alt="" src="">
				<div>
					<strong class="center">CONSEGNA IN GIORNATA</strong>
				</div>
				<div>
					<strong> Per tutti i nostri prodotti floreali è
						disponibile la consegna in giornata. Il tuo regalo floreale
						arriverà a poche ore dall'ordine effettuato </strong>
				</div>
			</div>
		</div>
		<div class="itemIndexConteiner">
			<%Collection<Tag> tagsIndex= new TagDAO().doRetrieveByDescrizione("home");
				for(Tag tagIndex:tagsIndex){%>
				<div class="itemIndexRow">
				<h3><%=tagIndex.getNome() %></h3>
					<div class="itemIndexMultiCarousel" data-items="1,3,5,6" data-slide="1" id="MultiCarousel"  data-interval="1000">
						<div class="itemIndexMultiCarousel-inner">
							<%Collection<Item> itemsIndex=new ItemDAO().doRetrieveByTag(tagIndex.getId());
								for(Item itemIndex:itemsIndex){%>
									<div class="itemIndex">
										<div class="pad15">
											<a href="MostraDettagliItem?itemID=<%=itemIndex.getId()%>">
												<%Mostra mostraIndex =new MostraDAO().doRetrieveByItem(itemIndex.getId());%>
												<img class="padImg" alt="<%=itemIndex.getNome() %>" src="mostraImg?imgID=<%=mostraIndex.getImmagine()%>" height="200px">
											</a>
										</div>
									</div>
								<%} %>

						</div>
						<button class="leftLstIndex">&#10094;</button>
            			<button class="rightLstIndex">&#10095;</button>
					</div>
				</div>
			<%} %>
		</div>
		<div id="instagram-feed1" class="instagram_feed"></div>

		<div class="elfsight-app-2eb02534-3e98-4e11-bbdd-c5f7ffcb5941"></div>

		<footer>
			<%@ include file="main/footer.jsp"%>
		</footer>
	</div>
	<script> startShowSlides(); cerca(); </script>
</body>
</html>