<?php

	require('../config/config.php');
	require('../config/db.php');

	header('Content-Type: application/json');

	$data = json_decode(file_get_contents('php://input'));

	$queryDelete = 'DELETE FROM gt_user_cards
					WHERE UserID = ' . $data->userId;

	$delete = mysqli_query($conn, $queryDelete);

	foreach ($data->theCards as $aCard) {
		$queryInsert = 'INSERT INTO gt_user_cards (UserID, CreditCardNum, ExpMonth, ExpYear, NameOnCard) VALUES (\'' . $data->userId . '\' , \'' . $aCard->CreditCardNum . '\' , \''. $aCard->ExpMonth . '\' , \'' . $aCard->ExpYear . '\' ,\''. $aCard->NameOnCard . '\')';

		$insert = mysqli_query($conn, $queryInsert);
	}

	echo true;

?>