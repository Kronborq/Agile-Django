function validateTeamForm(pnt) {
  
	url = pnt.teamURLName.value;
	// TeamURLName må ikke være blank
	if(url=="") {
	  alert('Du skal indtaste en team URL (den der henvises til som www.myteam.dk/XXXXXX)')
		return false;
	}
	
	// TeamURLName må ikke indeholde ulovlige tegn:
	validChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
	for(i=0;i<url.length;i++) {
	  if(validChars.indexOf(url.charAt(i))<0) {
		  alert('Team URL\'en må kun indeholde karaktererne a-z og tal (og ingen mellemrum)\n'+url)
			return false; 
		}
	}
	
	// TeamURLName må ikke eksistere allerede
	for(i=0;i<teamURLArr.length;i++) {
	  if(teamURLArr[i]==url) {
		  alert('URL-navnet \''+url+'\' er desværre optaget')
			return false;
		}
		
	}
	return true;
}

// Person edit form
function persEditSubmit(pnt) {

  // Email validation
	var regex  = /^[a-zA-Z0-9._-]+@([a-zA-Z0-9.-]+\.)+[a-zA-Z0-9.-]{2,4}$/;
  if(!(regex.test(pnt.email.value))) {
	  alert('Emailen, '+pnt.email.value+', er ikke gyldig')
		return false;
	}
  
	// Navn
	if(pnt.name.value=="") {
	  alert('Du skal indtaste et navn')
		return false;
	}
	
	
	// Postcode must be integer:
	var validFormat = new RegExp("[0-9]{4}");
  var val = pnt.postCode.value;
  if(val.match(validFormat)!=val && val !="") {
	  alert('Postnummeret er ikke korrekt (skal være 4 tal).')
		return false;
  } 

	// Phone numbers must be integer:
	var validFormat = new RegExp("[0-9]{8}");
  var val = pnt.tele.value;
  if(val.match(validFormat)!=val && val !="") {
	  alert('Telefonnumre skal indtastes som 8 tal (uden mellemrum)')
		return false;
  } 
	var validFormat = new RegExp("[0-9]{8}");
  var val = pnt.mobile.value;
  if(val.match(validFormat)!=val && val !="") {
	  alert('Telefonnumre skal indtastes som 8 tal (uden mellemrum)')
		return false;
  } 
	var validFormat = new RegExp("[0-9]{8}");
  var val = pnt.workTele.value;
  if(val.match(validFormat)!=val && val !="") {
	  alert('Telefonnumre skal indtastes som 8 tal (uden mellemrum)')
		return false;
  } 

  // Password
  pnt1 = document.getElementById("pass1");
	if(!pnt1)
	  return true;
	pnt2 = document.getElementById("pass2");
	if(pnt1.value!=pnt2.value) {
	  alert('De to password er ikke identiske') 
	  return false
	}
	
		
	return true	
}


function submitNewTeam(pnt) {
  if(!pnt.acceptConditions.checked) {
	  alert('Du skal acceptere betingelserne for at kunne fortsætte');
		return false;
	}
	return true;
}