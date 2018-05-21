<?php

/*
	Api Call for getting all info related to a single book.
	Should take in a parameter for the Book ID and return JSON info for the book.
	This is dummy data for use in creating the GUI. Will need to code this once the database is working
*/

header('Content-Type: application/json');
$json = 
'{
	"book_id" : 1,
	"name" : "The Lord of The Rings",
	"description" : "The first volume in J.R.R. Tolkiens epic adventure THE LORD OF THE RINGS\nOne Ring to rule them all, One Ring to find them, One Ring to bring them all and in the darkness bind them\nIn ancient times the Rings of Power were crafted by the Elven-smiths, and Sauron, the Dark Lord, forged the One Ring, filling it with his own power so that he could rule all others. But the One Ring was taken from him, and though he sought it throughout Middle-earth, it remained lost to him. After many ages it fell into the hands of Bilbo Baggins, as told in The Hobbit. In a sleepy village in the Shire, young Frodo Baggins finds himself faced with an immense task, as his elderly cousin Bilbo entrusts the Ring to his care. Frodo must leave his home and make a perilous journey across Middle-earth to the Cracks of Doom, there to destroy the Ring and foil the Dark Lord in his evil purpose.\n\"A unique, wholly realized other world, evoked from deep in the well of Time, massively detailed, absorbingly entertaining, profound in meaning.\" – New York Times",
	"price" : 50,
	"rating" : 5,
	"author_name": "J.R.R Tolkien",
	"date_published": "December 19, 2001",
	"cover_image" : "https://freebooksummary.com/wp-content/uploads/2017/04/Lord-of-the-Rings.jpg"
}';
echo $json;
?>

