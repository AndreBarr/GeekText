<?php

	require('../config/config.php');
	require('../config/db.php');

	header('Content-Type: application/json');

	$query = 'SELECT gb.BookID
					, gb.BookTitle
					, gb.AuthorID
					, gg.Genre
					, gb.AuthorID
					, ga.AuthorName
					, gb.Price
					, gb.BookCover
					, gc.PublisherName
					, gc.PublisherID
					, IFNULL(gr.Rating, \'-\') AS Rating
			        , IFNULL(purch.NumPurchased, 0) AS NumPurchased
				FROM gt_books AS gb 
				LEFT JOIN gt_authors AS ga ON gb.AuthorID = ga.AuthorID
				LEFT JOIN gt_publishers AS gc ON gc.PublisherID = gb.PublisherID
				LEFT JOIN gt_book_genres AS gg ON gg.BookGenreID = gb.Genre
			    LEFT JOIN (SELECT BookID, COUNT(BookID) AS NumPurchased
										FROM gt_user_purchased
										GROUP BY BookID) AS purch ON purch.BookID = gb.BookID
				LEFT JOIN (SELECT BookID, 
							ROUND(SUM(Rating)/COUNT(BookID), 2) AS Rating 
							FROM geek_text.gt_book_ratings
							GROUP BY BookID) AS gr ON gb.BookID = gr.BookID';

	$result = mysqli_query($conn, $query);
	$fdata = mysqli_fetch_all($result, MYSQLI_ASSOC);
	echo json_encode($fdata);

?>