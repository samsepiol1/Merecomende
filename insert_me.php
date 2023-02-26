<?php
if (isset($_POST['submit'])) {
    if (isset($_POST['username']) && isset($_POST['album']) &&  isset($_POST['resenha']))
	{
		$username = $_POST['username'];
		$album = $_POST['album'];
		$resenha = $_POST['resenha'];
		$host = "localhost";
		$dbUsername = "root";
		$dbPassword = "lucasmatheus";
		$dbName = "dados2";
		$conn = new mysqli($host, $dbUsername, $dbPassword, $dbName);
        if ($conn->connect_error) {
            die('Could not connect to the database.');
        }
	else{
		 $Select = "SELECT username FROM register WHERE username = ? LIMIT 1";
		 $Insert = "INSERT INTO register(username, album , resenha) values(?, ?, ?)";
		 $stmt = $conn->prepare($Select);
		 $stmt->bind_param("s", $username);
		 $stmt->execute();
		 $stmt->bind_result($resultUsername);
		  $stmt->store_result();
            $stmt->fetch();
            $rnum = $stmt->num_rows;
            if ($rnum == 0) {
                $stmt->close();
				$stmt = $conn->prepare($Insert);
                $stmt->bind_param("sss",$username, $album, $resenha);
                if ($stmt->execute()) {
                   header('about_s.html')
                }
                else {
                    echo $stmt->error;
                }
            }
            else {
                echo "Alguém Já possui esse username.";
            }
            $stmt->close();
            $conn->close();
        }
    }
    else {
        echo "All field are required.";
        die();
    }
}
else {
    echo "Submit button is not set";
}
?>