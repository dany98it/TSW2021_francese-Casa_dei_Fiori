<%@ page import="model.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<div class="menuBar" id="mainMenuBar">
	<ul class="ulMenu">
		<li>
			<div class="dropDownNav">
				<button class="headerBtn">
					FIORI    <i class="fa fa-caret-down" id="frecciaDropDown"></i>
				</button>
				<div class="dropDownNavContent">
				<div class="headerNavContent">
       				<h2>FIORI</h2>
      			</div>
						<%  
						TagDAO tDAO = new TagDAO();
						Collection<Tag> tags1=tDAO.doRetrieveByDescrizione("fiori");
						for(Tag tag10:tags1){%>
							<div class="rowNavBar"><a href="MostraItem?tag=<%=tag10.getId()%>"><%=tag10.getNome()%></a></div>
						<%}%>
				</div>
			</div>
		</li>
		<li>
			<div class="dropDownNav">
				<button class="headerBtn">
					PIANTE <i class="fa fa-caret-down" id="frecciaDropDown"></i>
				</button>
				<div class="dropDownNavContent">
				<div class="headerNavContent">
       				<h2>PIANTE</h2>
      			</div>
						<%  Collection<Tag> tags2=tDAO.doRetrieveByDescrizione("piante");
						for(Tag tag20:tags2){%>
							<div class="rowNavBar"><a href="MostraItem?tag=<%=tag20.getId()%>"><%=tag20.getNome()%></a></div>
						<%}%>
				</div>
			</div>
		</li>
		<li>
			<div class="dropDownNav">
				<button class="headerBtn">
					EVENTI <i class="fa fa-caret-down" id="frecciaDropDown"></i>
				</button>
				<div class="dropDownNavContent">
				<div class="headerNavContent">
       				<h2>EVENTI</h2>
      			</div>
						<%  Collection<Tag> tags3=tDAO.doRetrieveByDescrizione("eventi");
						for(Tag tag30:tags3){%>
							<div class="rowNavBar"><a href="MostraItem?tag=<%=tag30.getId()%>"><%=tag30.getNome()%></a></div>
						<%}%>
	
				</div>
			</div>
		</li>
		<li>
			<div class="dropDownNav">
				<button class="headerBtn">
					OGGETTISTICA <i class="fa fa-caret-down" id="frecciaDropDown"></i>
				</button>
				<div class="dropDownNavContent">
				<div class="headerNavContent">
       				<h2>OGGETTISTICA</h2>
      			</div>
						<%  Collection<Tag> tags4=tDAO.doRetrieveByDescrizione("oggettistica");
						for(Tag tag40:tags4){%>
							<div class="rowNavBar"><a href="MostraItem?tag=<%=tag40.getId()%>"><%=tag40.getNome()%></a></div>
						<%}%>
				</div>
			</div>
		</li>
		<%
		HttpSession sessione3 = request.getSession(true); 
  		boolean isAdmin3;
  		if(sessione3.getAttribute("isAdmin")!=null){
				isAdmin3=(boolean) sessione3.getAttribute("isAdmin"); 
			} else{
				isAdmin3=false;
			}
  		if(isAdmin3){%>
		<li>
			<div class="dropDownNav">
				<button class="headerBtn">
					AMMINSITRAZIONE <i class="fa fa-caret-down" id="frecciaDropDown"></i>
				</button>
				<div class="dropDownNavContent">
				<div class="headerNavContent">
       				<h2>AMMINSITRAZIONE</h2>
      			</div>
							<div class="rowNavBar"><a href="adminMostraOrdini">Amministrazione Ordini</a></div>
							<div class="rowNavBar"><a href="addItemPage.jsp">Aggiungi prodotto</a></div>
				</div>
			</div>
		</li>
		<% }%>
	</ul>
</div>