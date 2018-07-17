<?php


	require('../config/config.php');
	require('../config/db.php');

	header('Content-Type: application/json');

	$id = $_GET["BookID"];
	$userId = $_GET["UserID"];

	$query = 'INSERT INTO gt_user_purchased (UserID, BookID, DatePurchased) VALUES (' . $userId . ',' . $id .', NOW() )';
	$result = mysqli_query($conn, $query);

	echo $result;


?>
