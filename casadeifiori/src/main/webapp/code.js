//funzione che permette di modificare il testo in stile word 
tinymce.init({
	selector: '#editortesto',
	plugins: 'autolink autosave charmap emoticons hr link lists advlist paste table searchreplace wordcount',
	paste_data_images: false,
	setup: function(ed) {
		ed.on('change', function() {
			$("#descrizioneItem").html(ed.getContent());
		});
	}
});
//Apre e chiude il menù a tendina 
function closeNav() {
	var menubar = document.getElementById("menuDropBar");
	menubar.style.width = "0%"
	menubar.className = "menuDrop";
	if (window.innerWidth > 800) {
		document.getElementById("main").style.marginLeft = "0%";
	}
}

function openNav() {
	var menubar=document.getElementById("menuDropBar");
	menubar.style.width = "80%"
	menubar.className ="menuDrop border";
	if(window.innerWidth>1000){
	}
}
//Reindirizzamento ad una pagina 
function redirect(dove) {
	window.location.href = dove;
}

function menuMobile2() {
	var bar = document.getElementById("menuDropBar2");
	bar.style.display = "block";
}
function closeMenuMobile2() {
	var bar = document.getElementById("menuDropBar2");
	bar.style.display = "none";
}
//funzione che permette di aumentare o diminuire la quantità del carrello
function addShop(id, quantitymax) {
	var quantity = document.getElementById("quantity" + id).value
	if (quantity <= quantitymax) {
		window.location.href = "addCart?itemID=" + id + "&numItems=" + quantity + "&page=cartPage.jsp";
	} else {
		document.getElementById("errorQ").style.display = "block";
		document.getElementById("acquista").style.display = "none";
	}
}

function removeFromCart(id) {
	var quantity = 0
	if (quantity <= 0) {
		window.location.href = "addCart?itemID=" + id + "&numItems=" + quantity + "&page=cartPage.jsp";
	} else {
		document.getElementById("errorQ").style.display = "block";
		document.getElementById("acquista").style.display = "none";
	}
}

//funzioni che servono a nascondere e allo stesso tempo far vedere la password
function showPassword(inpsw, none, inline) {
	var bar = document.getElementById(inpsw);
	bar.setAttribute("type", "text");
	var icon1 = document.getElementById(inline);
	var icon2 = document.getElementById(none);
	icon1.style.display = "inline";
	icon2.style.display = "none";
}

function hidePassword(inpsw, none, inline) {
	var bar = document.getElementById(inpsw);
	bar.setAttribute("type", "password");
	document.getElementById(none).style.display = "none";
	document.getElementById(inline).style.display = "inline";
}
//Funzioni che permetto di scorrere le immagini nell'index
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
	if (n > slides.length) { slideIndex = 1 }
	if (n < 1) { slideIndex = slides.length }
	for (i = 0; i < slides.length; i++) {
		slides[i].style.display = "none";
	}
	for (i = 0; i < dots.length; i++) {
		dots[i].className = dots[i].className.replace(" active", "");
	}
	var x = slideIndex - 1;
	slides[x].style.display = "block";
	dots[x].className += " active";
}

function startShowSlides() {
	var slides = document.getElementsByClassName("slide");
	var dots = document.getElementsByClassName("dot");
	slides[0].style.display = "block";
	dots[0].className += " active";
	slideIndex = 1;
}
//Funzioni per validare la form del Signin
function validateNomeCognome(input) {
	var name = /^[A-Za-z]+$/;
	if (input.match(name)) {
		return true
	}
	return false
}

function validateEmail(input) {
	var email = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	if (input.match(email)) {
		return true
	}
	return false
}

function validateNumeroTelefono(input) {
	var tel = /^\d{10,15}$/;
	if (input.match(tel)) {
		return true
	}
	return false
}

function validatePassword(input) {
	var pass = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[^\w\s]).{8,32}$/;
	if (input.match(pass)) {
		return true;
	}
	return false;
}

function validateConfermaPassword(password, conferma) {
	if (password === conferma) {
		return true;
	}
	return false;
}

function validateSignIn(form) {
	var valid = true;

	if (userIdValidate() == false) {
		valid = false;
	};

	var nome = $("#nomeInput").val();
	if (!validateNomeCognome(nome)) {
		valid = false;
		$("#nomeInput").before("<p class=\"signinError\">x</p>");
		$("#nomeInput").css("color","red");
	}


	var cognome = $("#cognomeInput").val();
	if (!validateNomeCognome(cognome)) {
		valid = false;
		$("#cognomeInput").before("<p class=\"signinError\">x</p>");
		$("#nomeInput").css("color","red");
	}

	var email = $("#emailInput").val();
	if (!validateEmail(email)) {
		valid = false;
		$("#emailInput").before("<p class=\"signinError\">x</p>");
		$("#nomeInput").css("color","red");
	}


	var numero = $("#telefonoInput").val();
	if (!validateNumeroTelefono(numero)) {
		valid = false;
		$("#telefonoInput").before("<p class=\"signinError\">x</p>");
		$("#nomeInput").css("color","red");
	}

	var password = $("#passwordInput").val();
	if (!validatePassword(password)) {
		valid = false;
		$("#passwordInput").before("<p class=\"signinError\">x</p>");
		$("#nomeInput").css("color","red");
	}

	var confermaPassword = $("#confermaPasswordInput").val();
	if (!validateConfermaPassword(password, confermaPassword)) {
		valid = false;
		$("#confermaPasswordInput").before("<p class=\"signinError\">x</p>");
		$("#nomeInput").css("color","red");
	}

	if (valid) {
		form.submit();
	}
}

function userIdValidate() {
	var error = true;
	$.ajax({
		"type": "POST",
		"url": "userIdValidate",
		"data": {
			telefono: $("#telefonoInput").val(),
			email: $("#emailInput").val()
		},
		"async": false,
		"success": function(data) {
			if (data != "unico") {
				$(".alert").alert('close');
				html = "<div class=\"alert alert-danger alert-dismissible alertMod topSopra\" role=\"alert\">"
					+ "<strong>Attenzione!</strong> " + data
					+ "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">"
					+ "<span aria-hidden=\"true\">&times;</span></button></div>"
				$("body").prepend(html);
				closeAlert();
				error = false;
			}
		}
	})
	return error;
}

function logInCheck(form) {
	var error = true;
	$.ajax({
		"type": "POST",
		"url": "LogInValidate",
		"data": {
			username: $("#logInUsername").val(),
			password: $("#logInPassword").val()
		},
		"async": false,
		"success": function(data) {
			if (data != "passed") {
				$(".alert").alert('close');
				html = "<div class=\"alert alert-danger alert-dismissible alertMod topSopra\" role=\"alert\">"
					+ "<strong>Attenzione!</strong> " + data
					+ "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">"
					+ "<span aria-hidden=\"true\">&times;</span></button></div>"
				$("body").prepend(html);
				error = false;
			}
		}
	})
	if (error == true) {
		form.submit();
	}
}


//Funzioni che permettono di creare l'autocompilamento del tag e delle caratteristiche
var tag = new Bloodhound({
	datumTokenizer: Bloodhound.tokenizers.obj.whitespace('value'),
	queryTokenizer: Bloodhound.tokenizers.whitespace,
	remote: {
		url: 'Search?tagq=%QUERY',
		wildcard: '%QUERY'
	}
});

function tagAutoComplite() {
	$('#tag').tagsinput({
		typeaheadjs: {
			name: 'tag',
			display: 'value',
			source: tag
		}
	});
}
//Funzioni di anteprime del tag e delle caratteristiche
function prewiev(input, output) {
	$("#" + output).text($("#" + input).val())
}
function prewievC(input1, input2, output, idOutput) {
	$("#" + idOutput).remove()
	var html = "<div id=" + idOutput + "> <h5 style=\"display: inline-block;\">" + $("#" + input1 + " option:selected").text() + ":</h5>";
	var s = $("#" + input2).val().split(",");
	for (let i = 0; i < s.length; i++) {
		if (s[i][0] === '#') {
			var s1 = s[i].split(":");
			html += "<i class=\"fas fa-circle\" style=\"color:" + s1[0]
				+ "\" onmouseenter=\"cShow('" + s1[0] + s1[1] + "')\""
				+ " onmouseleave=\"cNotShow('" + s1[0] + s1[1] + "')\"></i>"
				+ "<p id=" + s1[0].replace("#", "") + s1[1] + " class=\"caratterisicap\">" + s1[1] + "</p>"
		} else {
			html += "<p class=\"tagp\">" + s[i] + "</p>";
		}
	}
	html += "</div>"
	$("#" + output).append(html)
}
function prewievTag(input, output) {
	$("#" + output).html("<p class=\"tagp\">" + $("#" + input).val().replace(/,/g, "</p><p class=\"tagp\">") + "</p>")
}
//Funzione del anteprima del prezzo
function prewievPrezzo(output) {
	var prezzo = Number($("#price").val());
	prezzo = prezzo + (prezzo * Number($("#iva").val())) / 100;
	prezzo = prezzo - (prezzo * Number($("#sconto").val())) / 100
	$("#" + output).html(prezzo.toFixed(2) + " &euro;");
}
//Funzione dell'anteprima della galleria
function initFileSelect() {
	var selDiv = $("#selectedFiles")
	var imgXL = $("#imgXL")
	var listImg = $("#listimg")
	var i = 0;
	$("#img").change(function(e) {
		selDiv.html("");
		listImg.html("");
		if (!e.target.files) return;
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		filesArr.forEach(function(f) {
			i++;
			var x = i;
			if (!f.type.match("image.*")) {
				return;
			}
			selDiv.append(f.name + "<br/>");
			var reader = new FileReader();
			reader.onload = function(e) {
				var html1 = "<img class=\"mySlides\" src=\"" + e.target.result + "\" style=\"width:100%;display:none\">"
				var html = "<div class=\"w3-col s4\"> "
					+ "<img class=\"demo w3-opacity w3-hover-opacity-off\" src=\"" + e.target.result + "\" style=\"width:100%;cursor:pointer\" onclick=\"currentDiv(" + x + ")\">"
					+ "</div>"
				imgXL.append(html1);
				listImg.append(html);
			}
			reader.readAsDataURL(f);
		});
	});
}
//Funzione che permette di aprire e chiudere il login , inoltre lo chiude anche premendo fuori dalla finestra
function openLogIn() {
	document.getElementById('divLogIn').style.display = 'block';
	switchLogInContent('contentFormLogIn', 'contentFormSignIn');
	$("#logInBtnSwitch").css("background-color", "#023838")
}

function closeLogIn() {
	document.getElementById('divLogIn').style.display = 'none';
}

function closeLogInOutside() {
	// Get the modal
	var modal1 = document.getElementById('divLogIn');

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal1) {
			modal1.style.display = "none";
		}
	}
}

function openSignIn() {
	document.getElementById('divLogIn').style.display = 'block'
	switchLogInContent('contentFormSignIn', 'contentFormLogIn');
	$("#signInBtnSwitch").css("background-color", "#023838");
}

//Funzione che permette di ingrandire l'immagine scorrendo il mouse su di essa
function currentDiv(n) {
	showDivs(slideIndex = n);
}

function showDivs(n) {
	var i;
	var x = document.getElementsByClassName("mySlides");
	var dots = document.getElementsByClassName("demo");
	if (n > x.length) { slideIndex = 1 }
	if (n < 1) { slideIndex = x.length }
	for (i = 0; i < x.length; i++) {
		x[i].style.display = "none";
	}
	for (i = 0; i < dots.length; i++) {
		dots[i].className = dots[i].className.replace(" w3-opacity-off", "");
	}
	x[slideIndex - 1].style.display = "block";
	dots[slideIndex - 1].className += " w3-opacity-off";
}
//Funzione di anteprima della quantità
function addQuantita(input, output) {
	var q = Number($("#" + input).val());
	var out = $("#" + output);
	out.html("")
	for (i = 1; i <= q; i++) {
		out.append("<option value=\"" + i + "\"> " + i + " </option>");
	}
}
//Funzione che permette di avvisarti se un articolo è stato aggiunto nel carrello.
function addCart(id, quantity) {
	$(".alert").alert('close');
	$.ajax({
		"type": "GET",
		"url": "addCart",
		"data": "itemID=" + id + "&addItem=" + quantity,
		"success": function() {
			html = "<div class=\"alert alert-success alert-dismissible topSopra\" role=\"alert\">"
				+ "<strong>Success!</strong> l'articolo &egrave; stato aggiunto al carrello."
				+ "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">"
				+ "<span aria-hidden=\"true\">&times;</span></button></div>"
			$("body").prepend(html);
			closeAlert();
		},
		"error": function() {
			html = "<div class=\"alert alert-danger alert-dismissible topSopra\" role=\"alert\">"
				+ "<strong>Error!</strong> l'articolo non &egrave; stato aggiunto al carrello."
				+ "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">"
				+ "<span aria-hidden=\"true\">&times;</span></button></div>"
			$("body").prepend(html);
			closeAlert();
		}
	})
}

//Funzione che tramite AJAX da l'autocompilamento della ricerca tramite suggerimenti
function cerca() {
	$(".ajax-typeahead").autocomplete({
		source: function(query, process) {
			return $.getJSON(
				'Search?itemq=' + query.term + "&doveq=" + $("#selectCerca").val(),
				function(data) {
					return process(data);
				}
			)
		}
	});
}
//Funzione che permette di eseguire la creazione del tag senza ricaricare la pagina
function creaTag() {
	$(".alert").alert('close');
	$.ajax({
		"type": "GET",
		"url": "creaTag",
		"data": "name=" + $("#nametag").val() + "&Suggerimento=" + $("#Suggerimentotag").val(),
		"success": function() {
			html = "<div class=\"alert alert-success alert-dismissible topSopra\" role=\"alert\">"
				+ "<strong>Success!</strong> il tag &egrave; stato aggiunto."
				+ "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">"
				+ "<span aria-hidden=\"true\">&times;</span></button></div>"
			$("body").prepend(html);
			$("#nametag").val("");
			$("#Suggerimentotag").val("");
			closeAlert();
		},
		"error": function() {
			html = "<div class=\"alert alert-danger alert-dismissible topSopra\" role=\"alert\">"
				+ "<strong>Error!</strong> il tag non &egrave; stato aggiunto."
				+ "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">"
				+ "<span aria-hidden=\"true\">&times;</span></button></div>"
			$("body").prepend(html);
			closeAlert();
		}
	})
	//TODO chiudere dopo submit 
}
//Funzione che permette di eseguire la creazione delle caratteristiche senza ricaricare la pagina
function creaC() {
	$(".alert").alert('close');
	$.ajax({
		"type": "GET",
		"url": "creaC",
		"data": "name=" + $("#namec").val() + "&Suggerimento=" + $("#Suggerimentoc").val(),
		"success": function() {
			html = "<div class=\"alert alert-success alert-dismissible topSopra\" role=\"alert\">"
				+ "<strong>Success!</strong> il caratterisiche &egrave; stato aggiunto."
				+ "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">"
				+ "<span aria-hidden=\"true\">&times;</span></button></div>"
			$("body").prepend(html);
			$("#namec").val("");
			$("#Suggerimentoc").val("");
			closeAlert();
		},
		"error": function() {
			html = "<div class=\"alert alert-danger alert-dismissible topSopra\" role=\"alert\">"
				+ "<strong>Error!</strong> il caratterisiche non &egrave; stato aggiunto."
				+ "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">"
				+ "<span aria-hidden=\"true\">&times;</span></button></div>"
			$("body").prepend(html);
			closeAlert();
		}
	})
	
}
/*aggiunge un data picker*/
function datapickerInit(id) {
	$('#' + id).fdatepicker({
		format: 'yyyy-mm-dd',
		disableDblClickSelection: true,
		language: 'it',
		closeButton: true
	});
}
var nAddCaratterisica = 0;
/*aggiunfe una riga caratterisica e genera una select con tutte le caratterisiche*/
function addCaratterisica() {
	$.ajax({
		"type": "GET",
		"url": "cercaC",
		dataType: "json",
		"success": function(data) {
			html = "<div class=\"divC\" id=\"divC" + nAddCaratterisica + "\">"
				+ "<select id=\"selectC" + nAddCaratterisica + "\" name=\"caratterisica\" class=\"caratterisica\" onchange=\"prewievC('selectC" + nAddCaratterisica + "','valoreC" + nAddCaratterisica + "','caratterisicheItem','divMC" + nAddCaratterisica + "')\">";
			for (let i = 0; i < data.length; i++) {
				html += "<option value=" + data[i]["id"] + ">" + data[i]["nome"] + "</option>";
			}
			html += "</select>"
				+ "<input id=\"picker" + nAddCaratterisica + "\" class=\"caratterisicaValore\" name=\"caratterisicaColore\" type=\"color\"  onchange=\"colorC('selectC" + nAddCaratterisica + "','valoreC" + nAddCaratterisica + "','picker" + nAddCaratterisica + "','caratterisicheItem','divMC" + nAddCaratterisica + "')\">"
				+ "<input id=\"valoreC" + nAddCaratterisica + "\" class=\"caratterisicaValore\" name=\"caratterisicaValore\" type=\"text\" placeholder=\"valore\" onchange=\"prewievC('selectC" + nAddCaratterisica + "','valoreC" + nAddCaratterisica + "','caratterisicheItem','divMC" + nAddCaratterisica + "')\">"
				+ "<input class=\"infoDetailsItemButton\" type=\"button\" value=\"rimuovi\" onclick=\"removeCaratterisica('divC" + nAddCaratterisica + "','divMC" + nAddCaratterisica + "')\">"
				+ "</div>"
			$("#caratterisicheSection").append(html);
			prewievC('selectC' + nAddCaratterisica, 'valoreC' + nAddCaratterisica, 'caratterisicheItem', 'divMC' + nAddCaratterisica)
			nAddCaratterisica++;
		}
	});
}
/*aggiunfe una riga caratterisica e genera una select con tutte le caratterisiche*/
function loadCaratterisica(nome, value) {
	$.ajax({
		"type": "GET",
		"url": "cercaC",
		dataType: "json",
		"success": function(data) {
			html = "<div class=\"divC\" id=\"divC" + nAddCaratterisica + "\">"
				+ "<select id=\"selectC" + nAddCaratterisica + "\" name=\"caratterisica\" class=\"caratterisica\" onchange=\"prewievC('selectC" + nAddCaratterisica + "','valoreC" + nAddCaratterisica + "','caratterisicheItem','divMC" + nAddCaratterisica + "')\">";
			for (let i = 0; i < data.length; i++) {
				if (data[i]["nome"] === nome) {
					html += "<option value=" + data[i]["id"] + " selected>" + data[i]["nome"] + "</option>";
				}
				html += "<option value=" + data[i]["id"] + ">" + data[i]["nome"] + "</option>";
			}
			html += "</select>"
				+ "<input id=\"picker" + nAddCaratterisica + "\" class=\"caratterisicaValore\" name=\"caratterisicaColore\" type=\"color\"  onchange=\"colorC('selectC" + nAddCaratterisica + "','valoreC" + nAddCaratterisica + "','picker" + nAddCaratterisica + "','caratterisicheItem','divMC" + nAddCaratterisica + "')\">"
				+ "<input id=\"valoreC" + nAddCaratterisica + "\" class=\"caratterisicaValore\" name=\"caratterisicaValore\" value=\"" + value + "\""
				+ "type=\"text\" placeholder=\"valore\" onchange=\"prewievC('selectC" + nAddCaratterisica + "','valoreC" + nAddCaratterisica + "','caratterisicheItem','divMC" + nAddCaratterisica + "')\">"
				+ "<input class=\"infoDetailsItemButton\" type=\"button\" value=\"rimuovi\" onclick=\"removeCaratterisica('divC" + nAddCaratterisica + "','divMC" + nAddCaratterisica + "')\">"
				+ "</div>"
			$("#caratterisicheSection").append(html);
			prewievC('selectC' + nAddCaratterisica, 'valoreC' + nAddCaratterisica, 'caratterisicheItem', 'divMC' + nAddCaratterisica)
			nAddCaratterisica++;
		}
	});
}
/*rimuove la riga della caratterisica*/
function removeCaratterisica(id, id2) {
	$("#" + id).remove();
	$("#" + id2).remove();
}
function cShow(id) {
	$(id).css("display", "inline-block");
}
function cNotShow(id) {
	$(id).css("display", "none");
}
/*invia un richiesta alla servelet per rimuovere l'immagine */
function rimuoviImg(imgId) {
	$.ajax({
		"type": "GET",
		"url": "remuveImg",
		data: "imgId=" + imgId,
		dataType: "json",
		"success": function() {
			$("#imgXXL" + imgId).remove();
			$("#imgL" + imgId).remove();
		}
	});
}
/*cambia la schermata da login a signin*/
function switchLogInContent(show, hide) {
	$("#" + hide).css("display", "none");
	$("#" + hide + "Btn").css("background-color", "#67f0bb");
	$("#" + show).css("display", "block");
	$("#" + show + "Btn").css("background-color", "#023838");
}
/*dopo 4 secondi chiude tutti i pop-up*/
function closeAlert() {
	setTimeout(function() { $(".alert").alert('close'); }, 4000);
}

// When the user clicks on the password field, show the message box
function showPswInfo() {
	document.getElementById("pswRequisiti").style.display = "block";
}

// When the user clicks outside of the password field, hide the message box
function hidePswInfo() {
	document.getElementById("pswRequisiti").style.display = "none";
}
/*controlla se la password rispetta i*/
function pswReqCheck() {
	var psw = document.getElementById("passwordInput");
	var letter = document.getElementById("letter");
	var capital = document.getElementById("capital");
	var number = document.getElementById("number");
	var length = document.getElementById("length");
	var specialChar = document.getElementById("specialChar");
	 // Validate lowercase letters
  var lowerCaseLetters = /[a-z]/g;
  if(psw.value.match(lowerCaseLetters)) {  
    letter.classList.remove("invalid");
    letter.classList.add("valid");
  } else {
    letter.classList.remove("valid");
    letter.classList.add("invalid");
  }
  
  // Validate capital letters
  var upperCaseLetters = /[A-Z]/g;
  if(psw.value.match(upperCaseLetters)) {  
    capital.classList.remove("invalid");
    capital.classList.add("valid");
  } else {
    capital.classList.remove("valid");
    capital.classList.add("invalid");
  }

  // Validate numbers
  var numbers = /[0-9]/g;
  if(psw.value.match(numbers)) {  
    number.classList.remove("invalid");
    number.classList.add("valid");
  } else {
    number.classList.remove("valid");
    number.classList.add("invalid");
  }


 // Validate special
  var special = /[^\w\s]/g;
  if(psw.value.match(special)) {  
    specialChar.classList.remove("invalid");
    specialChar.classList.add("valid");
  } else {
    specialChar.classList.remove("valid");
    specialChar.classList.add("invalid");
  }
  
  // Validate length
  if(psw.value.length >= 8) {
    length.classList.remove("invalid");
    length.classList.add("valid");
  } else {
    length.classList.remove("valid");
    length.classList.add("invalid");
  }
}
/*inserisce il colore scelto nella casella caratterisica al suo fianco*/
function colorC(input1,input2,input3,output,idOutput){
	
	var val=$("#"+input2).val()+$("#"+input3).val()+":colore,";
	$("#"+input2).val(val);
	prewievC(input1,input2,output,idOutput);
}

/*nasconde o mostra i dropdown*/
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var dropdownContent = this.nextElementSibling;
    if (dropdownContent.style.display === "block") {
      dropdownContent.style.display = "none";
    } else {
      dropdownContent.style.display = "block";
    }
  });
}
/* When the user scrolls down, hide the navbar. When the user scrolls up, show the navbar */
var prevScrollpos = window.pageYOffset;
window.onscroll = function() {
  var currentScrollPos = window.pageYOffset;
  if (prevScrollpos > currentScrollPos) {
    document.getElementById("mainHeader").style.top = "0";
document.getElementById("mainMenuBar").style.top = "128px";
  } else {
    document.getElementById("mainHeader").style.top = "-500px";
document.getElementById("mainMenuBar").style.top = "-500px";
  }
  prevScrollpos = currentScrollPos;
}
/*controlla se la carta è american express*/
function AmexCardnumber(inputtxt) {
	var cardno = /^(?:3[47][0-9]{13})$/;
	return cardno.test(inputtxt);
}
/*controlla se la carta è visa*/
function VisaCardnumber(inputtxt) {
	var cardno = /^(?:4[0-9]{12}(?:[0-9]{3})?)$/;
	return cardno.test(inputtxt);
}
/*controlla se la carta è Master card*/
function MasterCardnumber(inputtxt) {
	var cardno = /^(?:5[1-5][0-9]{14})$/;
	return cardno.test(inputtxt);
}
/*controlla se la carta è discover*/
function DiscoverCardnumber(inputtxt) {
	var cardno = /^(?:6(?:011|5[0-9][0-9])[0-9]{12})$/;
	return cardno.test(inputtxt);
}
/*controlla se la carta è diner club*/
function DinerClubCardnumber(inputtxt) {
	var cardno = /^(?:3(?:0[0-5]|[68][0-9])[0-9]{11})$/;
	return cardno.test(inputtxt);
}
/*controlla se la carta è jbc*/
function JCBCardnumber(inputtxt) {
	var cardno = /^(?:(?:2131|1800|35\d{3})\d{11})$/;
	return cardno.test(inputtxt);
}
/*controlla di che tipo è la carta*/
function IsValidCreditCardNumber(cardNumber) {
	var cardType = "fas fa-credit-card";
	if (VisaCardnumber(cardNumber)) {
		cardType = "fab fa-cc-visa";
	} else if (MasterCardnumber(cardNumber)) {
		cardType = "fab fa-cc-mastercard";
	} else if (AmexCardnumber(cardNumber)) {
		cardType = "fab fa-cc-amex";
	} else if (DiscoverCardnumber(cardNumber)) {
		cardType = "fab fa-cc-discover";
	} else if (DinerClubCardnumber(cardNumber)) {
		cardType = "fab fa-cc-diners-club";
	} else if (JCBCardnumber(cardNumber)) {
		cardType = "fab fa-cc-jcb";
	}
	return cardType;
}
/*cambia l'icona a seconda della carta'*/
function cambiaIcona(){
	$("#creditCardIcon").attr("class", IsValidCreditCardNumber($("#creditCard").val().replaceAll(' ','')))
}
/*aggiunge il picker della data in formatto mese/anno'*/
function cardDatapickerInit(id) {
	$('#' + id).fdatepicker({
		format: 'mm/yy',
		disableDblClickSelection: true,
		language: 'it',
		closeButton: true
	});
}

/*genera il seletore delle provincie*/
function selectProvincia() {
	$.ajax({
		"type": "GET",
		"url": "https://comuni-ita.herokuapp.com/api/province",
		dataType: "json",
		"success": function(data) {
			data.sort(function (a, b) {
  				return a["nome"].localeCompare(b["nome"]);
			});
			var html="";
			for(var i=0; i<data.length;i++){
				html+="<option value=\""+data[i]["nome"]+"\">"+data[i]["nome"]+"</option>"
			}
			$("#provinciaIndirizzo").html(html);
		}
	});	
}


/*genera il seletore dei comuni in base alle provincie scelte*/
function selectComuni() {
	$.ajax({
		"type": "GET",
		"url": "https://comuni-ita.herokuapp.com/api/comuni/provincia/"+$('#provinciaIndirizzo').val()+"?onlyname=true",
		dataType: "json",
		"success": function(data) {
			data.sort(function (a, b) {
  				return a.localeCompare(b);
			});
			var html="";
			for(var i=0; i<data.length;i++){
				html+="<option value=\""+data[i]+"\">"+data[i]+"</option>"
			}
			$("#cittaIndirizzo").html(html);
		}
	});
}
