<?php

	require('../config/config.php');
	require('../config/db.php');

	header('Content-Type: application/json');

	$id = $_GET["UserID"];

	$query = 'SELECT * FROM gt_user_cards
					WHERE UserID = ' . $id;

	$result = mysqli_query($conn, $query);
	$fdata = mysqli_fetch_all($result, MYSQLI_ASSOC);
	echo json_encode($fdata);

?>