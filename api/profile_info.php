<?php

	require('../config/config.php');
	require('../config/db.php');

	header('Content-Type: application/json');


	/*Get all the user information*/

	
$id = $_GET["UserID"];

	$query = 'SELECT UserName
					, Email
				FROM gt_users
				WHERE UserID = ' . $id;

	$result = mysqli_query($conn, $query);
	$fdata = mysqli_fetch_all($result, MYSQLI_ASSOC);
	echo json_encode($fdata[0]);
?>