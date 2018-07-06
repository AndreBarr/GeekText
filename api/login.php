<?php

require('../config/config.php');
require('../config/db.php');

header('Content-Type: application/json');

$data = json_decode(file_get_contents('php://input'));
$username = $data->username;
$inputPass = $data->password;

//Error handlers
//Check if inputs are empty
if (empty($username) || empty($inputPass)) {
	header("Location: ../index.php?login=empty");
	exit();
}
else {
	$query = "SELECT * FROM gt_users WHERE UserName='. $username . '";
	$result = mysqli_query($conn, $query);
	$resultCheck = mysqli_num_rows($result);
	if ($resultCheck < 1) {
		//error code
		echo -2;
	}
	else {
		if ($row = mysqli_fetch_all($result)) {
			$salt = $row['Salt'];
			$password = md5($inputPass . $salt);
			if ($password == $inputPass)
			{
				$userId = $row['UserID'];
				echo $userId;
			}
			else
			{
				//error code
				echo -1;
			}
		}
	}
}

?>