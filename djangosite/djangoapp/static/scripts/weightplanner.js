function calcWeights() {

	document.getElementById('dif').style.color = 'black';


  var elem = document.getElementById('weightForm').elements;
	
	totWeight = 0;
	noChecked = 0;
	for(var i = 0; i < elem.length; i++) {
	  if(elem[i].type=='checkbox' && elem[i].checked ) {
		  id = elem[i].name.substr(5);
			weight = Number(document.getElementById('weight'+id).value);
			totWeight += weight;
			noChecked++;
		}
	} 
	
	document.getElementById('totWeight').value=totWeight;
	
	maxWeight = Number(document.getElementById('maxWeight').value);
	dif=maxWeight-totWeight;
	if(maxWeight>totWeight)
	  document.getElementById('dif').value = -1*dif;
	else {
	  document.getElementById('dif').value = '+'+(-1*dif);
		document.getElementById('dif').style.color = 'red';
	}
	
	difPrPers = Math.round(dif/noChecked*10)/10;
	
	for(var i = 0; i < elem.length; i++) {
	  id = elem[i].name.substr(5);
	  if(elem[i].type=='checkbox' && elem[i].checked ) {
			if(maxWeight>totWeight)
			  document.getElementById('prop'+id).value = '(+'+difPrPers+')';
			else 
			  document.getElementById('prop'+id).value = '('+difPrPers+')';
		}
		else
		  document.getElementById('prop'+id).value = '';
	} 
	
	
	
	
}