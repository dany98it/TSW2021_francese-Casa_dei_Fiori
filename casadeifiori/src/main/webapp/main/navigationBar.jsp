<%@ page import="model.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<div class="menuBar" id="mainMenuBar")>
	<ul class="ulMenu">
		<li><a href="listaItem.jsp"><button type="button"
					class="headerBtn">Lista prodotti</button></a></li>
		<li><a href="addItemPage.jsp"><button type="button"
					class="headerBtn">Aggiungi prodotto</button></a></li>
		<li>
			<div class="dropDownNav">
				<button class="headerBtn">
					FIORI <i class="fa fa-caret-down"></i>
				</button>
				<div class="dropDownNavContent">
					<ul>
						<%  
						TagDAO tDAO = new TagDAO();
						Collection<Tag> tags1=tDAO.doRetrieveByDescrizione("fiori");
						for(Tag tag10:tags1){%>
							<li><a href="MostraItem?tag=<%=tag10.getId()%>"><%=tag10.getNome()%></a></li>
						<%}%>
					</ul>
				</div>
			</div>
		</li>
		<li>
			<div class="dropDownNav">
				<button class="headerBtn">
					PIANTE <i class="fa fa-caret-down"></i>
				</button>
				<div class="dropDownNavContent">
					<ul>
						<%  Collection<Tag> tags2=tDAO.doRetrieveByDescrizione("piante");
						for(Tag tag20:tags2){%>
							<li><a href="MostraItem?tag=<%=tag20.getId()%>"><%=tag20.getNome()%></a></li>
						<%}%>
					</ul>
				</div>
			</div>
		</li>
		<li>
			<div class="dropDownNav">
				<button class="headerBtn">
					EVENTI <i class="fa fa-caret-down"></i>
				</button>
				<div class="dropDownNavContent">
					<ul>
						<%  Collection<Tag> tags3=tDAO.doRetrieveByDescrizione("eventi");
						for(Tag tag30:tags3){%>
							<li><a href="MostraItem?tag=<%=tag30.getId()%>"><%=tag30.getNome()%></a></li>
						<%}%>
					</ul>
				</div>
			</div>
		</li>
		<li>
			<div class="dropDownNav">
				<button class="headerBtn">
					OGGETTISTICA <i class="fa fa-caret-down"></i>
				</button>
				<div class="dropDownNavContent">
					<ul>
						<%  Collection<Tag> tags4=tDAO.doRetrieveByDescrizione("oggettistica");
						for(Tag tag40:tags4){%>
							<li><a href="MostraItem?tag=<%=tag40.getId()%>"><%=tag40.getNome()%></a></li>
						<%}%>
					</ul>
				</div>
			</div>
		</li>
	</ul>
</div>