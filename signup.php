<?php
	include("connect.php");
	
	$nim = $_POST['nim'];
	$nama = $_POST['nama'];
	$ttl = $_POST['ttl'];
	$alamat = $_POST['alamat'];
	if ($_POST['sandi'] == $_POST['sandi2']){
		$pass = $_POST['sandi'];
	} else {
		exit('Password doesn\'t match');
	}
	$nohp = $_POST['nohp'];
	$email = $_POST['email'];
	$fakprod = $_POST['fakprod'];
	$kelas = $_POST['kelas'];
	
	//echo $nim." ".$nama." ".$ttl." ".$alamat." ".$pass." ".$nohp." ".$email." ".$fakprod." ".$kelas."<br>";
	
	$sql = "INSERT INTO mahasiswa VALUES ('".$nim."','".$nama."','".$ttl."','".$alamat."','".$pass."','".$nohp."','".$email."','".$fakprod."','".$kelas."')";

	if ($conn->query($sql) === TRUE) {
		echo "New record created successfully <br> This page will redirect you to Login Page in 3 seconds.";
	} else {
		echo "Error: " . $sql . "<br>" . $conn->error;
	}

	$conn->close();
	header("refresh:3; url=login.html");
	die();
	
?>

