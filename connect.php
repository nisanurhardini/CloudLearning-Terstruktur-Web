<?php
	$dbserver = 'localhost';
	$dbuser = 'root';
	$dbpass = '';
	$dbname = 'tubes_impal';
	$conn = mysqli_connect($dbserver,$dbuser,$dbpass,$dbname);
	
	if (!$conn){
		die('Could not connect : '.mysql_error());
	}
	
	echo 'Connected Successfully <br>';
	
?>