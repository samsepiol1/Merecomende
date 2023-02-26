<?php
$servername = "localhost";
$username = "root";
$password = "lucasmatheus";
$db = "sole";

// Create connection
$conn = mysqli_connect($servername, $username, $password,$db);

// Check connection
if (!$conn) {
  die("Sem Conexão: " . mysqli_connect_error());
}
?>