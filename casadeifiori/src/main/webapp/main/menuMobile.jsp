<%@ page import="model.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<% HttpSession sessione2 = request.getSession(true); %>
<div id="menuDropBar" class="menuDrop sidenav">
	<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	<button class="dropdown-btn">Il mio profilo
   	 <i class="fa fa-caret-down"></i>
  	</button>
  	<% 
  	boolean isAdmin2;
  	if(sessione2.getAttribute("isAdmin")!=null){
				isAdmin2=(boolean) sessione2.getAttribute("isAdmin"); 
			} else{
				isAdmin2=false;
			}
  	if(sessione2.getAttribute("loggedUser")!=null){ %>
	<div class="dropdown-container">
  		<a href="user.jsp">Il mio account</a>
  		<a href="cartPage.jsp">carrello</a>
    	<a href="MostraOrdiniEffettuati">I miei Ordini</a>
    	<a href="EffettuaLogOut">Log-out</a>
 	</div>
 	<% }else{%>
 	<div class="dropdown-container">
 		<a onclick="openLogIn()">Accedi</a>
 		<a onclick="openSignIn()">Iscriviti</a>
  		<a href="cartPage.jsp">carrello</a>
 	</div>
		<% }if(isAdmin2){%>
 	<button class="dropdown-btn">Amministrazione
   	 <i class="fa fa-caret-down"></i>
  	</button>
	<div class="dropdown-container">
  		<a href="adminMostraOrdini">Amministrazione Ordini</a>
    	<a href="addItemPage.jsp">Aggiungi prodotto</a>
 	</div>
 	<% } %>
 	<button class="dropdown-btn">
		Fiori <i class="fa fa-caret-down"></i>
	</button>
 	<div class="dropdown-container">
			<% 
				TagDAO tDAO2 = new TagDAO();
				Collection<Tag> tags11=tDAO2.doRetrieveByDescrizione("fiori");
				for(Tag tag110:tags11){%>
				<a href="MostraItem?tag=<%=tag110.getId()%>"><%=tag110.getNome()%></a>
			<%}%>
	</div>
	<button class="dropdown-btn">
		Piante <i class="fa fa-caret-down"></i>
	</button>
	<div class="dropdown-container">
			<%  Collection<Tag> tags22=tDAO2.doRetrieveByDescrizione("piante");
				for(Tag tag220:tags22){%>
				<a href="MostraItem?tag=<%=tag220.getId()%>"><%=tag220.getNome()%></a>
			<%}%>
	</div>
	<button class="dropdown-btn">
		Eventi <i class="fa fa-caret-down"></i>
	</button>
	<div class="dropdown-container">
			<%  Collection<Tag> tags33=tDAO2.doRetrieveByDescrizione("eventi");
						for(Tag tag330:tags33){%>
							<a href="MostraItem?tag=<%=tag330.getId()%>"><%=tag330.getNome()%></a>
						<%}%>
	</div>
	<button class="dropdown-btn">
		Oggettistica <i class="fa fa-caret-down"></i>
	</button>
	<div class="dropdown-container">
			<%  Collection<Tag> tags44=tDAO2.doRetrieveByDescrizione("oggettistica");
						for(Tag tag440:tags44){%>
						<a href="MostraItem?tag=<%=tag440.getId()%>"><%=tag440.getNome()%></a>
			<%}%>
	</div>
</div>
