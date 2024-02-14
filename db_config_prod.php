<?php
$servername = "localhost";
$username = "u796975099_root";
$password = "";
$db = "u796975099_stars";

// Create connection
$conn = mysqli_connect($servername, $username, $password,$db);

// Check connection
if (!$conn) {
  die("Sem Conexão: " . mysqli_connect_error());
}
?>
