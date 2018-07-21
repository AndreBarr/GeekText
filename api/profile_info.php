<?php

	require('../config/config.php');
	require('../config/db.php');

	header('Content-Type: application/json');


	/*Get all the user information*/

	
$id = $_GET["UserID"];

	$query = 'SELECT UserName
					, Email
					, RealName
					, HomeAddr
					, HomeCity
					, HomeState
					, HomeZip
					, UserID
				FROM gt_users
				NATURAL JOIN gt_user_detail
				WHERE UserID = ' . $id;


	$result = mysqli_query($conn, $query);
	$fdata = mysqli_fetch_all($result, MYSQLI_ASSOC);
	echo json_encode($fdata[0]);
?>