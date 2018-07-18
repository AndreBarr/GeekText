<?php

	require('../config/config.php');
	require('../config/db.php');

	header('Content-Type: application/json');

	/*Just in case we need a drop down to filter with a list of genres*/

	$query = 'SELECT *
			  FROM gt_book_genres';

	$result = mysqli_query($conn, $query);
	$fdata = mysqli_fetch_all($result, MYSQLI_ASSOC);
	echo json_encode($fdata);
?>

