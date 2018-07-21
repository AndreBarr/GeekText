<?php

	require('../config/config.php');
	require('../config/db.php');

	header('Content-Type: application/json');

	$data = json_decode(file_get_contents('php://input'));

	$queryDelete = 'DELETE FROM gt_user_shippings
					WHERE UserID = ' . $data->userId;

	$delete = mysqli_query($conn, $queryDelete);

	foreach ($data->theAddresses as $anAddress) {
		$queryInsert = 'INSERT INTO gt_user_shippings (UserID, ShippingAddr, ShippingState, ShippingCity, ShippingZip) VALUES (\'' . $data->userId . '\' , \'' . $anAddress->ShippingAddr . '\' , \''. $anAddress->ShippingState . '\' , \'' . $anAddress->ShippingCity . '\' ,\''. $anAddress->ShippingZip . '\')';

		$insert = mysqli_query($conn, $queryInsert);
	}

	echo true;

?>