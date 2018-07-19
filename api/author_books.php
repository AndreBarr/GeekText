<?php

require('../config/config.php');
require('../config/db.php');

header('Content-Type: application/json');

$id = $_GET["AuthorID"];
$query = 'SELECT gb.BookID
				, gb.BookTitle
				, gb.AuthorID
				, gb.Price
				, gp.PublisherName
				, gb.BookCover
				, gbg.Genre
		  FROM gt_books AS gb
		  LEFT JOIN gt_publishers AS gp ON gp.PublisherID = gb.PublisherID
		  LEFT JOIN gt_book_genres AS gbg ON gbg.BookGenreID = gb.Genre
		  WHERE AuthorID = '. $id;

$result = mysqli_query($conn, $query);
$fdata = mysqli_fetch_all($result, MYSQLI_ASSOC);

echo json_encode($fdata);
?>

