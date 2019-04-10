function showActivityInfo(id) {
  pnt = document.getElementById('activityInfo'+id);
	pnt.style.display = 'block';
}

function hideActivityInfo(id) {
  pnt = document.getElementById('activityInfo'+id);
	pnt.style.display = 'none';
}

function textFieldClicked(pnt) {
  if(pnt.value=="Din email")
	  pnt.value="";
}
function textFieldBlur(pnt) {
  if(pnt.value=="")
	  pnt.value="Din email";
}
function openPW() {
	str = "status=0,scrollbars=0,width=320,height=230";

  myWin = window.open("forgotPassword.php?front=1","PWWin", str);		
	myWin.focus();
  myWin.resizeTo(320, 230);
    
}
