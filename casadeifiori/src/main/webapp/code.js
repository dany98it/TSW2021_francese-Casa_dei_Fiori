function closeNav() {
	var menubar=document.getElementById("menuDropBar");
	menubar.style.width = "0%"
	menubar.className ="menuDrop";
}

function openNav() {
	var menubar=document.getElementById("menuDropBar");
	menubar.style.width = "100%"
	menubar.className ="menuDrop border";
}

function menuMobile2() {
	var bar = document.getElementById("menuDropBar2");
	bar.style.display = "block";
}
function closeMenuMobile2(){
	var bar = document.getElementById("menuDropBar2");
	bar.style.display = "none";
}

function addShop(id,quantitymax) {
	var quantity=document.getElementById("quantity"+id).value
	var page=document.getElementById("page").value
	if(quantity<=quantitymax){
		window.location.href ="addCart?itemID="+id+"&numItems="+quantity+"&page="+page;
	}else{
		document.getElementById("errorQ").style.display="block";
		document.getElementById("acquista").style.display="none";
	}
}