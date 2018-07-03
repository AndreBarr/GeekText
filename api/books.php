<?php

	require('../config/config.php');
	require('../config/db.php');

	header('Content-Type: application/json');

	$query = 'SELECT gb.BookID
					, gb.BookTitle
					, gb.BookDescription
					, gb.BookRating
					, gb.AuthorID
					, gb.Genre
					, ga.AuthorName
					, gb.Price
					, gb.BookCover
					, gb.BookRating
					, gc.PublisherName
					, gc.PublisherID
			  FROM gt_books AS gb 
				LEFT JOIN gt_authors AS ga ON gb.AuthorID = ga.AuthorID
				LEFT JOIN gt_publishers AS gc ON gc.PublisherID = gb.PublisherID';
	$result = mysqli_query($conn, $query);
	$fdata = mysqli_fetch_all($result, MYSQLI_ASSOC);
	echo json_encode($fdata);
?>

