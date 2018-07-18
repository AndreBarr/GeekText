<?php

	require('../config/config.php');
	require('../config/db.php');

	header('Content-Type: application/json');

	$userId = $_GET["UserID"];
	$bookId = $_GET["BookID"];

	$query = 'SELECT CASE WHEN up.BookID IS NULL THEN 0 ELSE 1 END AS Purchased
			  FROM gt_books AS gb 
			  	LEFT JOIN gt_user_purchased AS up ON up.UserID = '.$userId.' AND up.BookID = '.$bookId.'
			  WHERE gb.BookID ='.$bookId;

	$result = mysqli_query($conn, $query);
	$fdata = mysqli_fetch_all($result, MYSQLI_NUM);

	echo json_encode($fdata[0][0]);