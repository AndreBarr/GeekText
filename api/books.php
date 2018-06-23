<?php

	require('../config/config.php');
	require('../config/db.php');

	header('Content-Type: application/json');

	$query = 'SELECT gb.BookID
					, gb.BookTitle
					, gb.BookDescription
					, gb.AuthorID
					, gb.Genre
					, ga.AuthorName
					, ga.AuthorBio
					, gb.Price
			  FROM gt_books AS gb 
				LEFT JOIN gt_authors AS ga ON gb.AuthorID = ga.AuthorID';
	$result = mysqli_query($conn, $query);
	$fdata = mysqli_fetch_all($result, MYSQLI_ASSOC);
	echo json_encode($fdata);
/*
Example API Call
Real life Example of a Web Api Call:
	https://www.reddit.com/.json
	
This api call URL would look like: http://localhost/api/books.php
A GET request to this url should return a list of books in a JSON format
This info would come from the MySQL Database.

You can serialize a php object into JSON by using json_encode($object);

I'm no expert in PHP so if there's better ways to go about doing this please 
let me know. 
	-Dariel
*/


/*This is just dummy data to show how angular works with databinding. See books component js and html.*/
/*$json = 
'[
	{ "name":"Harry Potter", "description":"Some description", "price": 14.99 },
	{ "name":"Game Of Thrones", "description":"Some description", "price": 59.99 },
	{ "name":"Hunger Games", "description":"Some description", "price": 13.50 },
	{ "name":"A Series of Unfortunate Events", "description":"Some description", "price": 9.99 },
	{ "name":"The Lord Of The Rings", "description":"Some description", "price": 17.99 },
	{ "name":"The Hobbit", "description":"Some description", "price": 17.99 }
]';
echo $json;*/
?>

