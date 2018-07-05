<?php


require('../config/config.php');
require('../config/db.php');

header('Content-Type: application/json');

$id = $_GET["BookID"];
$userId = $_Get["UserID"];


/*TODO: WHere to store marked as purchased? */

$query = 'INSERT INTO gt_user_purchased (UserID, BookID) VALUES (' . $id . ',' . $userId .')';
$result = mysqli_query($conn, $query);
$fdata = mysqli_fetch_all($result, MYSQLI_ASSOC);

echo json_encode($fdata);


?>
