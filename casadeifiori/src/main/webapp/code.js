tinymce.init({
	selector: '#editortesto',
	plugins: 'autolink autosave charmap emoticons hr link lists advlist paste table searchreplace wordcount',
	paste_data_images: false,
});

function closeNav() {
	var menubar=document.getElementById("menuDropBar");
	menubar.style.width = "0%"
	menubar.className ="menuDrop";
	document.getElementById("main").style.marginLeft = "0%";
}

function openNav() {
	var menubar=document.getElementById("menuDropBar");
	menubar.style.width = "50%"
	menubar.className ="menuDrop border";
	document.getElementById("main").style.marginLeft = "50%";
}

function redirect(dove) {
	window.location.href = dove;
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


function showPassword(inpsw,none,inline){
	var bar = document.getElementById(inpsw);
	bar.setAttribute("type","text");
	var icon1 = document.getElementById(inline);
	var icon2 = document.getElementById(none);
	icon1.style.display="inline";
	icon2.style.display="none";
}

function hidePassword(inpsw,none,inline){
	var bar = document.getElementById(inpsw);
	bar.setAttribute("type","password");
	document.getElementById(none).style.display="none";
	document.getElementById(inline).style.display="inline";
}

var slideIndex;
function plusSlides(n) {
	showSlides(slideIndex += n);
}

function currentSlide(n) {
	showSlides(slideIndex = n);
}

function showSlides(n) {
  	var i;
  	var slides = document.getElementsByClassName("slide");
  	var dots = document.getElementsByClassName("dot");
  	if (n > slides.length) {slideIndex = 1}
  	if (n < 1) {slideIndex = slides.length}
  	for (i = 0; i < slides.length; i++) {
    	slides[i].style.display = "none";
  	}
  	for (i = 0; i < dots.length; i++) {
    	dots[i].className = dots[i].className.replace(" active", "");
 	}
	var x=slideIndex-1;
  	slides[x].style.display = "block";
  	dots[x].className += " active";
}

function startShowSlides() {
	var slides = document.getElementsByClassName("slide");
  	var dots = document.getElementsByClassName("dot");
	slides[0].style.display = "block";
  	dots[0].className += " active";
	slideIndex=1;
}

function validateNomeCognome(input){
	var name = /^[A-Za-z]+$/;
	if(input.match(name)){
		return true
	}
	return false
}

function validateEmail(input){
	var email = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	if(input.match(email)){
		return true
	}
	return false
}

function validateNumeroTelefono(input){
	var tel = /^\d{10}$/;
	if(input.match(tel)){
		return true
	}
	return false
}

function validateSignIn(form){
	var valid=true;
	
	var nome = $("#nomeInput").val();
	if(!validateNomeCognome(nome)){
		console.log(nome);
		valid=false;
		 $("#nomeInput").append("errore");
	}
	else{
		consol.log(nome);
		valid=false;
		 $("#nomeInput").append("errore");
	}
	
	
	var cognome = $("#cognomeInput").text();
	if(!validateNomeCognome(cognome)){
		valid=false;
	}
	else{
	}
	
	var email = $("#emailInput").text();
	if(!validateEmail(email)){
		valid=false;
	}
	else{
	}
	
	var numero = $("#nomeInput").text();
	if(!validateNumeroTelefono(numero)){
		valid=false;
	}
	else{
	}
	
	if(valid){
		form.submit();
	}
}
