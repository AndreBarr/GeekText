<?php

	require('../config/config.php');
	require('../config/db.php');

	header('Content-Type: application/json');

$data = json_decode(file_get_contents('php://input'));
$oldPassword = $data->oldPassword;
$newPassword = $data->newPassword;
$userID = $data->userId;
	
$query = 'SELECT * FROM gt_users WHERE UserID = ' . $userID;
$result = mysqli_query($conn, $query);

if ($row = mysqli_fetch_assoc($result)) {
	$salt = $row['Salt'];
	$hashedPassword = $row['Hash'];
	$hashOldPassword = md5($oldPassword . $salt);
	if ($hashOldPassword == $hashedPassword)
	{
		$hashNewPassword = md5($newPassword . $salt);
		if ($hashedPassword === $hashNewPassword)
		{
			//Not a new password
			echo -2;
		}
		else
		{
			$queryPass = 'UPDATE gt_users SET Hash = \'' . $hashNewPassword . '\' WHERE UserID = ' . $userID;
			$resultChange = mysqli_query($conn, $queryPass);
			echo true;
		}
	}
	else
	{
		//Old input password was incorrect
		echo -1;
	}
}

?>