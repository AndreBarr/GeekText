<?php

	require('../config/config.php');
	require('../config/db.php');

	header('Content-Type: application/json');

	/*Get all the user information*/
	$data = json_decode(file_get_contents('php://input'));

	$query = 'UPDATE gt_users
				SET UserName =\'' . $data->UserName . '\', Email = \''. $data->Email . '\' WHERE UserID = ' . $data->UserID;

	$queryAddr = 'UPDATE gt_user_detail
					SET RealName =\'' . $data->RealName . '\', HomeAddr = \'' . $data->HomeAddr . '\', HomeState = \'' . $data->HomeState . '\', HomeCity = \'' . $data->HomeCity . '\', HomeZip = \'' . $data ->HomeZip . '\' WHERE UserID = ' . $data->UserID;

	$update = mysqli_query($conn, $query);
	$updateAddr = mysqli_query($conn, $queryAddr);
	echo $data->UserID;
?>