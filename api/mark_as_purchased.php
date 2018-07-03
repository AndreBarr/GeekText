<?php

/*
	API call for the comments and their details. Dummy data until db is set up
*/
require('../config/config.php');
require('../config/db.php');

header('Content-Type: application/json');

$id = $_GET["BookID"];
$userId = $_Get["UserID"];


/*TODO: WHere to store marked as purchaseD? */

$query = '';
$result = mysqli_query($conn, $query);
$fdata = mysqli_fetch_all($result, MYSQLI_ASSOC);

echo json_encode($fdata);


?>
