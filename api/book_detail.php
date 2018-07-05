<?php

/*
	Api Call for getting all info related to a single book.
	Should take in a parameter for the Book ID and return JSON info for the book.
	This is dummy data for use in creating the GUI. Will need to code this once the database is working
*/

require('../config/config.php');
require('../config/db.php');

header('Content-Type: application/json');

$id = $_GET["BookID"];
$query = 'SELECT gb.BookID
 				, gb.BookTitle
 				, gb.BookDescription
 				, gb.AuthorID
 				, ga.AuthorName
 				, ga.AuthorBio
 				, gb.PublisherID
 				, gp.PublisherName
 				, gp.PublisherDescription
 				, gb.Price
				, gb.BookCover
				, IFNULL(gr.Rating, \'-\') AS Rating
		  FROM gt_books AS gb 
			LEFT JOIN gt_authors AS ga ON gb.AuthorID = ga.AuthorID 
			LEFT JOIN gt_publishers AS gp ON gp.PublisherID = gb.PublisherID 
			LEFT JOIN (SELECT BookID, 
	  					 ROUND(SUM(Rating)/COUNT(BookID), 2) AS Rating 
					   FROM geek_text.gt_book_ratings
					   GROUP BY BookID) AS gr ON gb.BookID = gr.BookID
		  WHERE gb.BookID = ' . $id;		  	  
$result = mysqli_query($conn, $query);
$fdata = mysqli_fetch_all($result, MYSQLI_ASSOC);

echo json_encode($fdata[0]);
?>

