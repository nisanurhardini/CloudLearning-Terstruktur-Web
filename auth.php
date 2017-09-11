<?php
	include("connect.php");
	
	$nim = $_POST['nim'];
	$pass = $_POST['sandi'];
	
	$sql = "SELECT nim, nama FROM mahasiswa WHERE nim='".$nim."' and password='".$pass."';";
	$get = mysqli_query($conn,$sql);
	$num_row = $get->num_rows;
	$username = mysqli_fetch_array($get);
	if ($num_row == 1){
		echo "Login Successfully<br>Welcome, ".$username['nama'];
		$conn->close();
		header("refresh:3; url=login.html");
		die();
	} else {
		echo "NIM or Password invalid<br>";
		$conn->error;
		$conn->close();
	}
?>