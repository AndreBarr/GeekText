<?php

require('../config/config.php');
require('../config/db.php');

header('Content-Type: application/json');

$id = $_GET["AuthorID"];
$query = 'SELECT *
		  FROM gt_authors
		  WHERE AuthorID = ' . $id;
$result = mysqli_query($conn, $query);
$fdata = mysqli_fetch_all($result, MYSQLI_ASSOC);

echo json_encode($fdata[0]);
?>

