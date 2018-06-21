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
$query = 'SELECT * FROM gt_books JOIN gt_publishers JOIN gt_authors WHERE BookID = ' . $id;
$result = mysqli_query($conn, $query);
$fdata = mysqli_fetch_all($result, MYSQLI_ASSOC);

echo json_encode($fdata[0]);
?>

