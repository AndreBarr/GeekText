<?php

/*
	API call for the comments and their details. Dummy data until db is set up
*/
require('../config/config.php');
require('../config/db.php');

header('Content-Type: application/json');

$id = $_GET["BookID"];

$query = 'SELECT 
			c.BookRatingID,
			c.BookID,
			c.Rating,
			c.Comment,
			u.UserName,
			u.UserID
			FROM gt_book_ratings AS c
			NATURAL JOIN gt_users AS u
			WHERE c.BookID = '. $id;

$result = mysqli_query($conn, $query);
$fdata = mysqli_fetch_all($result, MYSQLI_ASSOC);

echo json_encode($fdata);


?>
