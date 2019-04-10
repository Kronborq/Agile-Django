<?
       
include("functions.php");
include("../commonVars.php");
include("../classes/3rdPart/exif.class.php");


connectSQL();
$debug=TRUE;


$fileName = $_FILES["Filedata"]["name"];
$fileType = strtolower(substr($fileName,strrpos($fileName, ".")+1));
$dateVal = "";


if($fileType=="jpg" || $fileType=="jpeg") {
  $exif = read_exif_data($_FILES["Filedata"]["tmp_name"],"IFD0");
	
  if($exif) {
	  $dateVal = $exif["DateTimeOriginal"]; // Format: 2006:08:05 18:36:33
	}
}


if($fileType=="jpg" || $fileType=="jpeg") {

	// Get the session Id passed from SWFUpload. We have to do this to work-around the Flash Player Cookie Bug
	if (isset($_POST["PHPSESSID"])) {
		session_id($_POST["PHPSESSID"]);
	}
	session_start();
	if (!isset($_SESSION["file_info"])) {
		$_SESSION["file_info"] = array();
	}

	// Check the upload
	if (!isset($_FILES["Filedata"]) || !is_uploaded_file($_FILES["Filedata"]["tmp_name"]) || $_FILES["Filedata"]["error"] != 0) {
		header("HTTP/1.1 500 Internal Server Error");
		echo "invalid upload";
		exit(0);
	}
	// Get the image and create a thumbnail
	$img = @imagecreatefromjpeg($_FILES["Filedata"]["tmp_name"]);
	if (!$img) {
		header("HTTP/1.1 500 Internal Server Error");
		echo "could not create image handle";
		exit(0);
	}
	$large = localResizeImg(500, $img);
	$thumb = localResizeImg(100, $img);
	if (!isset($_SESSION["file_info"])) {
		$_SESSION["file_info"] = array();
	}

	// Use a output buffering to load the image into a variable
	ob_start();
	imagejpeg($thumb);
	$imagevariable = ob_get_contents();
	ob_end_clean();

	$file_id = md5($_FILES["Filedata"]["tmp_name"] + rand()*100000);	
	$_SESSION["file_info"][$file_id] = $imagevariable;

	ob_start();
	imagejpeg($large,NULL,85);
	$largeImagevariable = ob_get_contents();
	ob_end_clean();
	

  $q = "INSERT INTO pics 
        SET galleryID = $galleryID, 
				    teamID    = $teamID, 
						persID    = $persID,
						title     = '$fileName', 
						fileType  = '$fileType',
						created   = NOW(),
						imgdata   = '".addslashes($largeImagevariable)."', 
						thumbdata = '".addslashes($imagevariable)     ."';";
	exeSQL($q,__LINE__);
	echo $file_id;	// Return the file id to the script

}

// UPLOAD OF VIDEO
else {

	$file = $_FILES['Filedata']['tmp_name'];
	$data = fread(@fopen($file, "r"), @filesize($file));
			
  $q = "INSERT INTO pics 
        SET galleryID = $galleryID, 
				    teamID    = $teamID, 
						persID    = $persID,
						title     = '$fileName', 
						fileType  = '$fileType',
						created   = NOW(),
						imgdata   = '".addslashes($data)."'";
	exeSQL($q,__LINE__);

	ob_start();
	imagejpeg(@imagecreatefromjpeg("../images/video.jpg"));
//  echo "<img src='../images/video.jpg'>";
	$imagevariable = ob_get_contents();
	ob_end_clean();
	
	$file_id = md5($_FILES["Filedata"]["tmp_name"] + rand()*100000);	
	$_SESSION["file_info"][$file_id] = $imagevariable; 

	echo $file_id;	// Return the file id to the script	

}


	function localResizeImg($targSize, $img) {
  
		$width = imageSX($img);
	  $height = imageSY($img);

  	if (!$width || !$height) {
	  	header("HTTP/1.1 500 Internal Server Error");
  		echo "Invalid width or height";
	  	return FALSE;
  	}

  	// Build the thumbnail
	  $target_width  = $targSize;
  	$target_height = $targSize;
  	$target_ratio  = $target_width / $target_height;

	  $img_ratio = $width / $height;

  	if (1 > $img_ratio) {
		  $new_height = $targSize;
		  $new_width = $img_ratio * $targSize;
	  } else {
		  $new_height = $targSize / $img_ratio;
		  $new_width = $targSize;
  	}

	  $new_img = ImageCreateTrueColor($new_width, $new_height);
		if(!$new_img) {
		  echo "Could not make the image";
			return FALSE;
		}
		
/*		if (!@imagefilledrectangle($new_img, 0, 0, $new_width, $new_height, 0)) {	// Fill the image black
		  header("HTTP/1.1 500 Internal Server Error");
		  echo "Could not fill new image";
		  return FALSE;
	  }
*/
	  if (!@imagecopyresampled($new_img, $img, 0, 0, 0, 0, $new_width, $new_height, $width, $height)) {
		  header("HTTP/1.0 500 Internal Server Error");
		  echo "Could not resize image";
		  return FALSE;
	  }	
		
		return $new_img;
	}

	?>