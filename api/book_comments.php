<?php

/*
	API call for the comments and their details. Dummy data until db is set up
*/

header('Content-Type: application/json');
$json = 
'{
	 "book_id":1, "name":"Anonymous", "book":"Harry Potter", "comment":"Great book!", "rating": 4 
}';
echo $json;

?>
