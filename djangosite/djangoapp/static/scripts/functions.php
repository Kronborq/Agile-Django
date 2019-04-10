<?
function exeSQL($q,$line="", $link="") {
  global $debug, $errNo;
	
	if(""==$link)
		$res = mysql_query($q);
	else
	  $res = mysql_query($q,$link);
	
	$retNo = 1;
			
	if(!$res) {
	  $errNo = mysql_errno();
		$retNo = $errNo;
	  // Der sendes mail til Jacob men fejlen skjules for brugeren. (ved ikke om det er helt smart)
	  $str = "<html><head><title>MySQL FEJL</title></head><body>
		        <br><br>Dårlig MySQL forespørgsel: <br><font color='red'>" . mysql_error().".<br>Error no: $errNo</font><br>
            Query: <font color='blue'>".nl2br($q)."</font><br>
      			Called from file ".$_SERVER["PHP_SELF"]." on line $line<br>
						
			  		</body></html>";

    // To send HTML mail, the Content-type header must be set
    $headers  = "MIME-Version: 1.0\r\n";
    $headers .= "Content-type: text/html; charset=iso-8859-1\r\n";
    $headers .= $headers . "From: sportplanner.dk \r\n";

    // Send the mail:
		if($debug && $errNo!=1062)
		  echo $str;
		elseif($errNo!=1062) {
		  mail("hans@jacobsimonsen.dk", "sportplanner.dk: MYSQL FEJL ", $str, $headers);
      echo "Der opstod desværre en databasefejl. Prøv venligst igen eller skriv mail til <a href='mailto:webmaster@sportplanner.dk'>webmaster@sportplanner.dk</a>";   		
		}
	}

  return $res;
	
}

function connectSQL() {
 $link = mysql_connect(_DBserver, _DBuser, _DBpswd) or die('Kunne ikke connecte til database serveren');
 $db_selected = mysql_select_db(_DB, $link) or die('Kunne ikke koble op til databasen');

}

function makeURL($getArr,$var="",$val="") {
  $URLstr = "?";
	$argUsed = FALSE;
  while(list($curVar,$curVal)=each($getArr)) {
	  if($curVar=="teamName")
		  continue;
	  if($curVar==$var) {
		   $curVal = $val;
			 $argUsed = TRUE;
		}
		$URLstr .= $curVar."=".$curVal."&";
	}
	if(!$argUsed && $var!="") 
	  $URLstr .= $var."=".$val;
		
	return $URLstr;
}

function showUrl($str, $doReturn=FALSE, $includeHTMLTag=TRUE) {
  $stripStr = ereg_replace("http://","",$str); 

	if($includeHTMLTag)
  	$outStr = "<a href='http://$stripStr' target='_blank'>$stripStr</a>";
	else
	  $outStr = "http://$stripStr";
	if($doReturn)
	  return $outStr;
	else
	  echo $outStr;
}

function imgResize($filename,$new_w, $new_h,$fileOut = "",$crop=TRUE,$compression=75) {
  
	$debug=TRUE;
	
	list($w, $h) = getimagesize($filename);

	// source more landscape
  if($w/$h > $new_w/$new_h) {
	  if($crop) {
		  $w_src = $new_w/$new_h*$h;
			$h_src = $h;
			$x = round(0.5*($w-$w_src));
			$y = 0;
		}
		else {
		  $w_src = $w;
			$h_src = $h;
			$x=0;
			$y=0;
			$new_h = round($new_w*$h/$w);
		}
  }
  // Source more portrait
  elseif($w/$h < $new_w/$new_h) {
	  if($crop) {
		 	$w_src = $w;
      $h_src = $new_h/$new_w*$w;
   	  $x = 0;
   	  $y = round(0.5*($h-$h_src));
		}
		else {
		  $w_src = $w;
			$h_src = $h;
			$x=0;
			$y=0;
			$new_w = round($new_h*$w/$h);		
		}
  } else {
   	$w_src = $w;
    $h_src = $h;
   	$x = 0;
   	$y = 0;
  }

	// Do the resizing
  $imgdata = imagecreatefromjpeg($filename);
  $im2   = ImageCreateTrueColor($new_w, $new_h);
	imagecopyResampled ($im2, $imgdata, 0, 0, $x, $y, $new_w, $new_h, $w_src, $h_src) or die('Resampling failed');
	if($fileOut)
		imagejpeg( $im2, $fileOut , $compression ) or die("Could not write image to ".$fileOut);
	else
		imagejpeg( $im2, $filename, $compression ) or die("Could not write image to ".$filename);


}

function isUser() {
// Is a registered user on the current team
  if($GLOBALS["curUser"]->teamID == $GLOBALS["team"]->teamID && $GLOBALS["team"]->teamID != "")
  	return TRUE; 
	else
	  return FALSE;
}

function isAdmin($id="") {
  
	if(!isUser())
  	return FALSE; 

  if(is_object($GLOBALS["curUser"])) 
	  return $GLOBALS["curUser"]->isAdmin($id);
	else
	  return FALSE;
}

function arr($arr) {
  global $debug;
	if($debug)
	  echo nl2br(print_r($arr,TRUE));
}

function sms($phoneNo,$msg, $from="Sportplanner", $teamID, &$err) {
  // Function to send an SMS
  // The SMS gateway uses: CPSMS.dk
	$q = "SELECT noSMS FROM noSMS WHERE teamID=$teamID";
	$res = exeSQL($q);
	$arr = mysql_fetch_array($res);
	$no  = $arr["noSMS"];
	if(!is_numeric($no))
	  $no=0;
  if($no<1) {
	  $err="Ikke flere SMS'er til rådighed";
		return false;
	}
	
	if(!is_numeric(trim($phoneNo)) || strlen(trim($phoneNo))!=8) {
	  $err = "Telefonnummeret '$phoneNo' er ikke et korrekt nummer";
		return false;
	}
	
	
	$msg = str_replace("\n", "", $msg);

	if(strlen($msg)>160)
  	$msg = substr($msg,0,160);
		
  $headers  = 'MIME-Version: 1.0' . "\r\n";
  $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
  $headers .= 'From: MyTeam.dk <webmaster@sportplanner.dk>' . "\r\n";
		
  // Via www.cpsms.dk
	$pw = "LQES2648RGYO";
	$email = trim($phoneNo).".".$pw."@cpsms.dk";
						 
	// Via suresms.com
	$pw = "IvVnRvnM";
	$email = trim($phoneNo).".webmaster.".$pw."@sms.mutax.com";
	$from="";
						 
  $bRes = mail( $email,"$from","$msg","$headers");
	
	if($bRes) {
	  $q = "UPDATE noSMS SET noSMS = noSMS-1 WHERE teamID=$teamID";
  	$res = exeSQL($q);
	}
	return $bRes;	
}


function array_remval($val, &$arr) {
   for($x=0;$x<count($arr)-1;$x++) {
	    $i=array_search($val,$arr);
      if($i===false)return false;
      $arr=array_merge(array_slice($arr, 0,$i), array_slice($arr, $i+1));
   }
}

function readDate($dateStr) {
  // Read date in the form
	// 1: dd-mm-yyyy HH:MM:SS or
	// 2: yyyy-mm-dd HH:MM:SS
	
	$tmp  = split(' ',$dateStr);
	$hrs  = split(':',$tmp[1]);
	$date = split('-',$tmp[0]);
	
	// Form #1 
	if($date[2]>100) {
	  $yr   = $date[2];
		$mnth = $date[1];
		$day  = $date[0];
	}
	else { // Form #2
	  $yr   = $date[0];
		$mnth = $date[1];
		$day  = $date[2];
	}
	
	return mktime($hrs[0],$hrs[1],$hrs[2],$mnth,$day,$yr);
}

function createRandomPassword($len=5) {

    $chars = "abcdefghijkmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    srand((double)microtime()*10000009);
    $i = 0;
    $pass = '' ;

    while ($i <= $len) {
        $num = rand()%61;				
        $tmp = substr($chars, $num, 1);
        $pass = $pass . $tmp;
        $i++;
    }
    return $pass;
}

function dayNo($stamp="") {
  if(!$stamp)
	  $stamp = time();
	$no = date("w",$stamp);
	if($no==0)
	  $no = 7;
	return $no;
} 

function danishDay($str) {
  global $weekArr;
	
  $firstLetter = substr($str);
	if(strstr("ABCDEFGHIJKLMNOPQRSTUVWXYZ",$firstLetter))
	  return ucfirst($weekArr[strtolower($str)]);
	else
	  return strtolower($weekArr[strtolower($str)]);
	
}
function danishMonth($str) {
  global $monthArr;
	
  $firstLetter = substr($str);
	if(strstr("ABCDEFGHIJKLMNOPQRSTUVWXYZ",$firstLetter))
	  return ucfirst($monthArr[strtolower($str)]);
	else
	  return strtolower($monthArr[strtolower($str)]);
	
}


function sanitize($data) {
$safe_data = $data;

if ($pos = strpos($safe_data, "\n")) {
$safe_data = substr($safe_data, 0, $pos-1);
}
if ($pos = strpos($safe_data, "\r")) {
$safe_data = substr($safe_data, 0, $pos-1);
}
return $safe_data;
}
 
 
function validEmail($email) {
  // First, we check that there's one @ symbol, and that the lengths are right
  if (!ereg("^[^@]{1,64}@[^@]{1,255}$", $email)) {
    // Email invalid because wrong number of characters in one section, or wrong number of @ symbols.
    return false;
  }
  // Split it into sections to make life easier
  $email_array = explode("@", $email);
  $local_array = explode(".", $email_array[0]);
  for ($i = 0; $i < sizeof($local_array); $i++) {
     if (!ereg("^(([A-Za-z0-9!#$%&#038;'*+/=?^_`{|}~-][A-Za-z0-9!#$%&#038;'*+/=?^_`{|}~\.-]{0,63})|(\"[^(\\|\")]{0,62}\"))$", $local_array[$i])) {
      return false;
    }
  }  
  if (!ereg("^\[?[0-9\.]+\]?$", $email_array[1])) { // Check if domain is IP. If not, it should be valid domain name
    $domain_array = explode(".", $email_array[1]);
    if (sizeof($domain_array) < 2) {
        return false; // Not enough parts to domain
    }
    for ($i = 0; $i < sizeof($domain_array); $i++) {
      if (!ereg("^(([A-Za-z0-9][A-Za-z0-9-]{0,61}[A-Za-z0-9])|([A-Za-z0-9]+))$", $domain_array[$i])) {
        return false;
      }
    }
  }
  return true;
}   

function dTime() {
  global $tic;
	
	// Time:
  list($usec, $sec) = explode(" ", microtime());
  $toc = ((float)$usec + (float)$sec);
	$dTime = round($toc-$tic,2);
	echo "<!-- Time since last: $dTime sec -->";
	
	$tic=$toc;
}

function help($helpName,$offsetX=0,$offsetY=0,$openNewWindow=FALSE) {
  
	if($openNewWindow) {
	  $outStr = "<a href='javascript:openHelp(\"$helpName\")'><img src='images/helpIcon.gif' style='border:0px;'></a>";
	}
	else {
	  $q = "SELECT * FROM helpTable WHERE helpName='$helpName'";
		$res = exeSQL($q);
		$arr = mysql_fetch_array($res);
		
		$str = $arr["helpText"];
		if($str!="") {
		 	$outStr  = "
			            <img src='images/helpIconSmall.gif' onmouseover='showHelp(\"$helpName\",$offsetX,$offsetY,event)' onmouseout='hideHelp(\"$helpName\")'>
									<div class='help' id='help_$helpName'>$str</div>
									";
	  }
	}	
		
	return $outStr;
		 
}

function trunkStr($str,$no) {

  if(strlen($str)<$no)
	  return $str;

  else 
	  return substr($str,0,$no)."...";

}




function xml2array($url, $get_attributes = 1, $priority = 'tag')
{
    $contents = "";
    if (!function_exists('xml_parser_create'))
    {
        return array ();
    }
    $parser = xml_parser_create('');
    if (!($fp = @ fopen($url, 'rb')))
    {
        return array ();
    }
    while (!feof($fp))
    {
        $contents .= fread($fp, 8192);
    }
    fclose($fp);
//    xml_parser_set_option($parser, XML_OPTION_TARGET_ENCODING, "UTF8");
    xml_parser_set_option($parser, XML_OPTION_CASE_FOLDING, 0);
    xml_parser_set_option($parser, XML_OPTION_SKIP_WHITE, 1);
    xml_parse_into_struct($parser, trim($contents), $xml_values);
    xml_parser_free($parser);
    if (!$xml_values)
        return; //Hmm...
    $xml_array = array ();
    $parents = array ();
    $opened_tags = array ();
    $arr = array ();
    $current = & $xml_array;
    $repeated_tag_index = array ();
    foreach ($xml_values as $data)
    {
        unset ($attributes, $value);
        extract($data);
        $result = array ();
        $attributes_data = array ();
        if (isset ($value))
        {
            if ($priority == 'tag')
                $result = $value;
            else
                $result['value'] = $value;
        }
        if (isset ($attributes) and $get_attributes)
        {
            foreach ($attributes as $attr => $val)
            {
                if ($priority == 'tag')
                    $attributes_data[$attr] = $val;
                else
                    $result['attr'][$attr] = $val; //Set all the attributes in a array called 'attr'
            }
        }
        if ($type == "open")
        {
            $parent[$level -1] = & $current;
            if (!is_array($current) or (!in_array($tag, array_keys($current))))
            {
                $current[$tag] = $result;
                if ($attributes_data)
                    $current[$tag . '_attr'] = $attributes_data;
                $repeated_tag_index[$tag . '_' . $level] = 1;
                $current = & $current[$tag];
            }
            else
            {
                if (isset ($current[$tag][0]))
                {
                    $current[$tag][$repeated_tag_index[$tag . '_' . $level]] = $result;
                    $repeated_tag_index[$tag . '_' . $level]++;
                }
                else
                {
                    $current[$tag] = array (
                        $current[$tag],
                        $result
                    );
                    $repeated_tag_index[$tag . '_' . $level] = 2;
                    if (isset ($current[$tag . '_attr']))
                    {
                        $current[$tag]['0_attr'] = $current[$tag . '_attr'];
                        unset ($current[$tag . '_attr']);
                    }
                }
                $last_item_index = $repeated_tag_index[$tag . '_' . $level] - 1;
                $current = & $current[$tag][$last_item_index];
            }
        }
        elseif ($type == "complete")
        {
            if (!isset ($current[$tag]))
            {
                $current[$tag] = $result;
                $repeated_tag_index[$tag . '_' . $level] = 1;
                if ($priority == 'tag' and $attributes_data)
                    $current[$tag . '_attr'] = $attributes_data;
            }
            else
            {
                if (isset ($current[$tag][0]) and is_array($current[$tag]))
                {
                    $current[$tag][$repeated_tag_index[$tag . '_' . $level]] = $result;
                    if ($priority == 'tag' and $get_attributes and $attributes_data)
                    {
                        $current[$tag][$repeated_tag_index[$tag . '_' . $level] . '_attr'] = $attributes_data;
                    }
                    $repeated_tag_index[$tag . '_' . $level]++;
                }
                else
                {
                    $current[$tag] = array (
                        $current[$tag],
                        $result
                    );
                    $repeated_tag_index[$tag . '_' . $level] = 1;
                    if ($priority == 'tag' and $get_attributes)
                    {
                        if (isset ($current[$tag . '_attr']))
                        {
                            $current[$tag]['0_attr'] = $current[$tag . '_attr'];
                            unset ($current[$tag . '_attr']);
                        }
                        if ($attributes_data)
                        {
                            $current[$tag][$repeated_tag_index[$tag . '_' . $level] . '_attr'] = $attributes_data;
                        }
                    }
                    $repeated_tag_index[$tag . '_' . $level]++; //0 and 1 index is already taken
                }
            }
        }
        elseif ($type == 'close')
        {
            $current = & $parent[$level -1];
        }
    }
    return ($xml_array);
}

function danishChars($str) {
  // æ
  $str = str_replace("Ã¦","æ",$str); 
  // ø
  $str = str_replace("Ã¸","ø",$str); 
  // å
  $str = str_replace("Ã¥","å",$str); 
	$str = str_replace("Â’","'",$str);
	$str = str_replace("Â”","''",$str);
	return $str;
}

?>