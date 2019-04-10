function toggleLogin(item) {
  div      = document.getElementById("loginDiv");
  
  if('none'==div.style.display || ''==div.style.display ) {
    div.style.display= 'block';
		if(document.loginForm.login.value=='email') { 
		  document.loginForm.login.focus();
		  document.loginForm.login.select();
		}
		else
		  document.loginForm.pass.focus();
	}
  else
    div.style.display= 'none';
    
}


function openLinkToYouTube(teamID, persID, galleryID) {
  str = "status=0,scrollbars=0,width=550,height=350";

  myWin = window.open("youtubelink.php?teamID="+teamID+"&persID="+persID+"&galleryID="+galleryID,"largeWin", str);
}



///////////////////////////////////////
// FORM SCRIPTS                      //
///////////////////////////////////////
function toggleRecurrenceView() {
  if(document.newEventForm.recurrenceBool.checked) 
	   document.getElementById("recurrenceDiv").style.display = 'block';
	else 
	   document.getElementById("recurrenceDiv").style.display = 'none';	
}
function toggleRecurrenceType() {
	if(document.newEventForm.recurrenceType[0].checked) {
	  document.getElementById("weeklyRecurrenceDiv").style.display = 'block';
		document.getElementById("monthlyRecurrenceDiv").style.display = 'none';
	}
	else if(document.newEventForm.recurrenceType[1].checked) {
	  document.getElementById("weeklyRecurrenceDiv").style.display = 'none';
		document.getElementById("monthlyRecurrenceDiv").style.display = 'block';
	} 
}

function newFromDate() {
  if(!document.getElementById("dateStart"))
	  return;
  // Mangler: Her skal der tjekkes om til datoen er før den fra dato man har indtastes.
	var fromDateStr = document.getElementById("dateStart").value;
	var endDateStr  = document.getElementById("dateEnd").value;
	
	// Year must be of the format 20-05-2007 10:30:03
	var regexp = new RegExp("([0-9]{1,2})-([0-9]{1,2})-([0-9]{4}) ([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})");
  var d = fromDateStr.match(regexp);
	var fromDate = new Date(d[3],d[2]-1,d[1],d[4],d[5],d[6]);
  var d = endDateStr.match(regexp);
	if(d)
	  var endDate = new Date(d[3],d[2]-1,d[1],d[4],d[5],d[6]);
	else 
	  endDate = null;

	if(!endDate || endDate < fromDate ) { 
	  endDate = fromDate;
		endDate.setHours(fromDate.getHours()+2);
		endDateStr = pad2(endDate.getDate())+"-"+pad2(endDate.getMonth()+1)+"-"+pad2(endDate.getFullYear())+" "+pad2(endDate.getHours())+":"+pad2(endDate.getMinutes())+":"+pad2(endDate.getSeconds());
		document.getElementById("dateEnd").value = endDateStr;
	}
	
}

function pad2(n) { 
  totalDigits = 2;
	n = n.toString(); 
  var pd = ''; 
  if (totalDigits > n.length)  {
	  for (i=0; i < (totalDigits-n.length); i++){
		  pd += '0';
	  } 
  } 
  return pd + n.toString(); 
}

function toggleShowEvents(eventID) {
    pnt = document.getElementById("eventDetail"+eventID);
		if(pnt.style.display=='' || pnt.style.display == 'none' ) {
		  pnt.style.display = 'block';
		}
		else {	
		  pnt.style.display = 'none';
		}
			
		// Show names:
		pntDiv = document.getElementById("eventLine"+eventID);
		divArr = pntDiv.getElementsByTagName('div');
		
	
		for (var i = 0; i < divArr.length; i++) {
		  if(divArr[i].getAttribute('name')!='eventDetailPers')
			  continue;
				
  		if(divArr[i].style.display=='' || divArr[i].style.display == 'none' ) {
	  	  divArr[i].style.display = 'block';
			}
	  	else {	
		    divArr[i].style.display = 'none';
			}
		}
}

function showComment(ID) {
    pnt = document.getElementById("comment"+ID);
	  pnt.style.display = 'block';
		
		pnt = document.getElementById("commentURL"+ID);
	  pnt.style.display = 'none';	
}
function showWriteComment(ID) {
    pnt = document.getElementById("writeComment"+ID);
	  pnt.style.display = 'block';
		
		pnt = document.getElementById("writeCommentURL"+ID);
	  pnt.style.display = 'none';	
}

function showVeryOldEvents() {
    pntDiv = document.getElementById('eventTable');
		divArr = pntDiv.getElementsByTagName('tr');		

		var browser=navigator.appName;

		for (var i = 0; i < divArr.length; i++) {
		  if(divArr[i].getAttribute('name')!='veryOld')
			  continue;
      if(browser=="Netscape")
			  divArr[i].style.display = 'table-row';
			else
			  divArr[i].style.display = 'block';
		}

		pnt = document.getElementById('eventTableFooter');
		pnt.style.display = 'none';
}

function showClosedEco() {
    pntDiv = document.getElementById('ecoTable');
    divArr = pntDiv.getElementsByTagName('tr');		

    var browser=navigator.appName;

    for (var i = 0; i < divArr.length; i++) {
      if(divArr[i].getAttribute('name')!='closedEcoRow')
	  continue;
      if(browser=="Netscape")
          divArr[i].style.display = 'table-row';
      else
        divArr[i].style.display = 'block';
    }
    
    pnt = document.getElementById('showAllLink');
    pnt.style.display = 'none';

}

function showHiddenEventDetails(id) {
  pnt = document.getElementById('eventDetails'+id);
	pnt.style.display = 'block';
}

function hideHiddenEventDetails(id) {
  pnt = document.getElementById('eventDetails'+id);
	pnt.style.display = 'none';
}

// Object for the events:
function eventObj() {
  this.date = '';
	this.persPosArr = Array();
	this.persNegArr = Array();
	this.persIDFrom = Array();
	this.amountTo   = Array();
}

function eventChange() {
  eventID = document.getElementById("eventID").value;
 // document.getElementById("expenceDate").value = eventArr[eventID].date;
  for (var i in eventArr[eventID].persPosArr) {
	  persID = eventArr[eventID].persPosArr[i];
  	document.getElementById("expencePersID"+persID).checked = true;
	}
  for (var i in eventArr[eventID].persNegArr) {
	  persID = eventArr[eventID].persNegArr[i];
  	document.getElementById("expencePersID"+persID).checked = false;
	}
}

function changeEqualConditions() {
  eventID = document.getElementById("eventID").value;
	persID  = document.getElementById("persID").value;

  if(!eventArr[eventID])
	  return;
  
  if(eventArr[eventID].date!="")
	  document.getElementById("equalDate").value   = eventArr[eventID].date;
	
	if(eventArr[eventID].amountTo[persID] && eventArr[eventID].amountTo[persID]>0)
		document.getElementById("equalAmount").value = Math.round(eventArr[eventID].amountTo[persID]*100)/100;
	else
	  document.getElementById("equalAmount").value = "";
		
	if(eventArr[eventID].persIDFrom[persID])
  	selectOptionVal("persIDTo",eventArr[eventID].persIDFrom[persID]);
	
}



function autoLoginCheck(pnt) {
  if(pnt.checked) {
	  alert('Når du checker i autologin boksen bliver der placeret en cookie på din computer. \n' +
		      'Check derfor kun i boksen, når du logger ind fra din egen pc.') 
	}
}

function showEmail(persID) {
	str = "status=0,scrollbars=0,width=380,height=230";

  myWin = window.open("showEmail.php?persID="+persID,"largeWin", str);
		
	myWin.focus();
  myWin.resizeTo(380, 230);
    
}

function openPW() {
	str = "status=0,scrollbars=0,width=320,height=230";

  myWin = window.open("forgotPassword.php","PWWin", str);		
	myWin.focus();
  myWin.resizeTo(320, 230);
    
}


function openWeightplanner(eventID) {
	str = "status=0,scrollbars=0,width=600,height=300";

  myWin = window.open("weightplanner.php?eventID="+eventID,"WPWin", str);		
	myWin.focus();
}


function selectOptionVal(id,val) {
  pnt = document.getElementById(id);
	for(var i=0;i<pnt.options.length;i++) {
	  if(pnt.options[i].value == val) {
		  pnt.selectedIndex=i;
			return;
		}
	}
}

// FORM SUBMIT STUFF
var cancelIsClicked = false;
function clickSubmit(pnt) {
  if(pnt.value=='Annuler')
	  cancelIsClicked = true;
}

function validateExpence(pnt) {
  
	if(cancelIsClicked) 
	  return true;

  // Check weather a person is selected in the check-boxes.  
	inpArr = pnt.getElementsByTagName('input');
  anyIsSelected = false;
	for (var i = 0; i < inpArr.length; i++) {
	  if(inpArr[i].getAttribute('name').indexOf('expencePersIDArr')<0)
		  continue;
		if(inpArr[i].checked) {
		  anyIsSelected = true;
			break;
		}
	}
	if(!anyIsSelected) {
	  alert('Der skal angives minimum en modtager til udgiften \n(vælges i "gælder for" check-boksene)');
		return false;  
  }
	
	// Check weather an amount is specified:
	if(document.getElementById("expenceInput").value=="") {
	  alert('Der skal angives et beløb')
		return false;
	}  
	if(!IsNumeric(document.getElementById("expenceInput").value)) {
	   alert('Beløbet skal angives som et decimaltal');
		 return false;
	}
	else // Replace "," with "."
	  document.getElementById("expenceInput").value = document.getElementById("expenceInput").value.replace("\,",".");
	
	// Check weather the post is specified:
	if(document.getElementById("postInput").value=="") {
	  alert('Der skal angives en beskrivelse af posten.')
		return false;
	}
	
	// Date format:
	myReg = new RegExp("[0-9]{1,2}-[0-9]{1,2}-[0-9]{4}");
	if(!myReg.test(document.getElementById("expenceDate").value)) {
	  alert('Datoen skal angives i formatet "DD-MM-ÅÅÅÅ"');
	  return false;
	}
	 
	
	
	return true;
}

function IsNumeric(sText){
  var ValidChars = "0123456789.,-";
  var IsNumber=true;
  var Char;
 
  for (i = 0; i < sText.length && IsNumber == true; i++)   { 
    Char = sText.charAt(i); 
    if (ValidChars.indexOf(Char) == -1) 
      IsNumber = false;
  }
  return IsNumber;
}

function replaceKomma() {
	  document.getElementById("equalAmount").value = document.getElementById("equalAmount").value.replace("\,",".");
}


// Message functions (typing SMS)
var msgType = "mail"
function mailOrSMSChange(pnt) {
  if(pnt.value=="SMS") {
	  msgType="SMS";
    document.getElementById("msgLengthDiv").style.display = 'block';	
    document.getElementById("subjectDiv").style.display   = 'none';
		document.getElementById("msgBody").rows = 7;	
		document.getElementById("msgBody").cols = 20;	
	}
	else if(pnt.value=="mail") {
	  msgType="mail";
    document.getElementById("msgLengthDiv").style.display = 'none';		
    document.getElementById("subjectDiv").style.display   = 'block';	
		document.getElementById("msgBody").rows = 15;	
		document.getElementById("msgBody").cols = 50;	
	}
}
function msgTyping(pnt) {
  if(msgType=="mail")
	  return true;
		
	maxSMSLength = 160;
	togo = maxSMSLength-pnt.value.length;
	document.getElementById("msgLength").value=togo;
	
	if(togo<0)
	  document.getElementById("msgTooLongWarning").style.display = "block";
	else
	  document.getElementById("msgTooLongWarning").style.display = "none";
	
}

function selectCategory(cat) {
  pnt = document.messageForm;
	
	inpArr = pnt.getElementsByTagName('input');
  anyIsSelected = false;
	for (var i = 0; i < inpArr.length; i++) {
	  if(inpArr[i].getAttribute('type')=='checkbox')
		  inpArr[i].checked=false;
		else
		  continue;

	  var browserName=navigator.appName;
	
	 
    if (browserName=="Netscape")
		  clsStr = inpArr[i].getAttribute('class');
		else
		  clsStr = inpArr[i].getAttribute('className');
			
		if(cat>0 && clsStr=='category1')
		  inpArr[i].checked=true;
		if(cat>1 && clsStr=='category2')
		  inpArr[i].checked=true;
		if(cat>2 && clsStr=='category3')
		  inpArr[i].checked=true;
			
	}   
}

// Economy year change
function changeEcoYear(urlStr,pnt) {
   year = pnt.options[pnt.selectedIndex].value;
   window.location.href ='?showEco=TRUE&showYear='+year
									 
}

//////////////////////////////////////////////////////////////////////////
//  HJÆLPE VISER                                                        //						 
//////////////////////////////////////////////////////////////////////////


function openHelp(elementId) {
  str = "status=0,toolbar=0,location=0,menubar=0,scrollbars=1,width=550,height=350";
  myWin = window.open("help.php?helpItem="+elementId,"Help", str);
}

function showHelp(elementId,offsetX,offsetY,evt) {
  id = "help_"+elementId;
	
	document.getElementById(id).style.visibility = 'visible';
}
function hideHelp(elementId) {
  divID = document.getElementById("help_"+elementId); 
  divID.style.visibility = 'hidden';
}
function findPos(obj) {
	var curleft = curtop = 0;
	if (obj.offsetParent) {
		curleft = obj.offsetLeft
		curtop = obj.offsetTop
		while (obj = obj.offsetParent) {
			curleft += obj.offsetLeft
			curtop += obj.offsetTop
		}
	}
	return [curleft,curtop];
}


// Delete event.
function deleteEvent(contentID, eventID) {
  str = "status=0,scrollbars=0,width=600,height=420";

  myWin = window.open("deleteEvent.php?contentID="+contentID+"&eventID="+eventID,"largeWin", str);
}

/////////////////////
// Person details  //
/////////////////////

function openPersonDetails(persID,teamID) {
  persDetailsWin = window.open("personDetails.php?viewPersID="+persID+"&teamID="+teamID,"persWin", "status=0,scrollbars=1,width=600,height=350");
  persDetailsWin.focus();
}


////////////////////////
// PLANNER FUNCTION   //
////////////////////////
function showPlannerFunctions() {
    pnt = document.getElementById("plannerFunctionFoldOut");
	  pnt.style.display = 'block';
}
function hidePlannerFunctions() {
    pnt = document.getElementById("plannerFunctionFoldOut");
	  pnt.style.display = 'none';	
}
function openGoogleCalIntegration(persID, teamID) {
  googleIntWin = window.open("googleCalIntegration.php?viewPersID="+persID+"&teamID="+teamID,"googleIntWin", "status=0,scrollbars=1,width=600,height=500");
  googleIntWin.focus();
}

function openReminderSender(teamID, eventID) {
  reminderWin = window.open("reminderWindow.php?teamID="+teamID+"&eventID="+eventID,"reminderWin", "status=0,scrollbars=1,width=600,height=300");
  reminderWin.focus();
  
}
