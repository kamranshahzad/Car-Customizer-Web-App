<?php

/*
//path to storage
$storage = 'flash_uploads';

//allow path to be changed dynamically
if($_GET['uploadDir'] != "") {
	$storage = $_GET['uploadDir'];
}

//path name of file for storage
$uploadfile = "$storage/" . $_FILES['Filedata']['name'];

//if the file is moved successfully
if (move_uploaded_file( $_FILES['Filedata']['tmp_name'] , $uploadfile)){
	echo( '1 ' . $_FILES['Filedata']['name']);
	header("Location: http://www.google.com");
//file failed to move
}else{
	echo( '0');
}

*/

	require_once("easyup.cls.php");

	$siteloc = '/aoc/';
	$tmpUpload = '';
	
	// SET PATH ACCORDING TO USE
	switch($_REQUEST['uploadDir']){
		case 'effected':
						$tmpUpload = '/public/assets/parts/effected-imgs/';
						break;
		case 'icon':
						$tmpUpload = '/public/assets/parts/icons/';		
						break;
		case 'make':
						$tmpUpload = '/public/assets/makes/';		
						break;
		case 'model':
						$tmpUpload = '/public/assets/models/';		
						break;
		case 'interiors':
						$tmpUpload = '/public/assets/interiors/';		
						break;
		case 'bg':
						$tmpUpload = '/public/assets/backgrounds/';		
						break;
		case 'smallview':
						$tmpUpload = '/public/assets/views/smallviews/';		
						break;
		case 'canves':
						$tmpUpload = '/public/assets/views/canvesviews/';		
						break;
		default:
						$tmpUpload = '/public/assets/default/';
	}

	
	$up = new fileDir($siteloc.$tmpUpload);
	$result = $up->upload($_FILES['Filedata']);
	
	echo $up->getFileName();
	
	//echo $result;
	
	
	
?>
