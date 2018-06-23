<?php

/*
	API call for the comments and their details. Dummy data until db is set up
*/
require('../config/config.php');
require('../config/db.php');

header('Content-Type: application/json');

$id = $_GET["BookID"];

$query = 'SELECT ga.BookID
				 , ga.BookTitle
			     , ga.BookDescription
			     , gbr.RatingValue
			     , gbrd.UserName
			     , gbrd.IndividualRatingValue
			     , gbrd.IndividualRatingComment
			FROM gt_books AS ga
				LEFT JOIN gt_book_ratings AS gbr ON ga.BookRatingID = gbr.BookRatingID
			    LEFT JOIN gt_book_rating_details AS gbrd ON gbr.BookRatingID = gbrd.BookRatingID
			WHERE ga.BookID = '. $id;
$result = mysqli_query($conn, $query);
$fdata = mysqli_fetch_all($result, MYSQLI_ASSOC);

echo json_encode($fdata);


?>
