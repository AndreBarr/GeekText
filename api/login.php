<?php

require('../config/config.php');
require('../config/db.php');

header('Content-Type: application/json');

$data = json_decode(file_get_contents('php://input'));
$username = $data->username;
$inputPass = $data->password;

$query = "SELECT * FROM gt_users WHERE UserName='$username'";
$result = mysqli_query($conn, $query);
$resultCheck = mysqli_num_rows($result);
if ($resultCheck < 1) {
	//error code
	echo -2;
}
else {
	if ($row = mysqli_fetch_assoc($result)) {
		$salt = $row['Salt'];
		$hashedPassword = $row['Hash'];
		$hashInputPassword = md5($inputPass . $salt);
		if ($hashInputPassword == $hashedPassword)
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

?>