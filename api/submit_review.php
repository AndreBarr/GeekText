<?php


require('../config/config.php');
require('../config/db.php');

header('Content-Type: application/json');

$bID = $_GET["BookID"];
$uID = $_GET["UserID"];
$rating = $_GET["Rating"];
$comment = $_GET["Comment"];

$query = 'INSERT INTO gt_book_ratings(BookID, UserID, Rating, Comment) 
		  VALUES ('.$bID.', '.$uID.', '.$rating.', \''.$comment.'\')';

$result = mysqli_query($conn, $query);

echo '[{"Test":"Successfully commented!"}]';

?>