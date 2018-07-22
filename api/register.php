<?php

/*
	Register user
*/

require('../config/config.php');
require('../config/db.php');

header('Content-Type: application/json');


$data = json_decode(file_get_contents('php://input'));
$salt = rand();
$password = md5($data->password . $salt);
$userId = rand();
 
 //No logic to check for duplicates i.e unique username & email
$queryCheck = 'SELECT * FROM gt_users WHERE UserName = \'' . $data->username . '\' OR Email = \'' . $data->email . '\'';
$resultCheck = mysqli_query($conn, $queryCheck) or die();
$resultCheckCount = mysqli_num_rows($resultCheck);
if ($resultCheckCount > 0) {
	//error code
	echo -1;
}
else {
	$query = 'INSERT INTO gt_users (UserID, UserName, Email, Hash, Salt) VALUES (' . $userId . ', \''. $data->username . '\', \'' . $data->	email .'\', \''. $password . '\', ' . $salt . ')';
	$result = mysqli_query($conn, $query) or die();

	$queryHomeAddr = 'INSERT INTO gt_user_detail (UserID) VALUES (' . $userId . ')';
	$resultHomeAddr = mysqli_query($conn, $queryHomeAddr) or die();

	if($result){
		echo $userId;
	}
}
	
?>

