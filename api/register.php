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

$query = 'INSERT INTO gt_users (UserID, UserName, Hash, Salt) VALUES (' . $userId . ', \''. $data->username . '\', \'' . $password . '\', ' . $salt . ')';
$result = mysqli_query($conn, $query) or die(mysqli_error());
if($result){
	echo $userId;
}
	
?>

