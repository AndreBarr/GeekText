DROP DATABASE geek_text;
CREATE DATABASE geek_text;

CREATE TABLE `gt_user_purchased` (
  `UserID` int(11) DEFAULT NULL,
  `BookID` int(11) NOT NULL,
  `DatePurchased` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BookID`),
  KEY `FK` (`UserID`,`BookID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `gt_publishers` (
  `PublisherID` int(11) NOT NULL AUTO_INCREMENT,
  `PublisherName` varchar(255) DEFAULT NULL,
  `PublisherDescription` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`PublisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


CREATE TABLE `gt_books` (
  `BookID` int(11) NOT NULL AUTO_INCREMENT,
  `BookTitle` varchar(255) DEFAULT NULL,
  `BookDescription` varchar(10000) DEFAULT NULL,
  `AuthorID` int(11) DEFAULT NULL,
  `PublisherID` int(11) DEFAULT NULL,
  `ReleaseDate` date DEFAULT NULL,
  `Genre` varchar(20) DEFAULT NULL,
  `Price` decimal(16,2) DEFAULT NULL,
  `BookCover` varchar(200) DEFAULT NULL,
  `BookRating` int(11) DEFAULT '1',
  PRIMARY KEY (`BookID`),
  KEY `FK` (`AuthorID`,`PublisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `gt_users` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Hash` varchar(2000) DEFAULT NULL,
  `Salt` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`UserID`,`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `gt_authors` (
  `AuthorID` int(11) NOT NULL AUTO_INCREMENT,
  `AuthorName` varchar(50) DEFAULT NULL,
  `AuthorBio` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`AuthorID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


CREATE TABLE `gt_book_ratings` (
  `BookRatingID` int(11) NOT NULL AUTO_INCREMENT,
  `BookID` int(11) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`BookRatingID`),
  KEY `FK` (`BookID`,`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;



INSERT INTO gt_authors (AuthorID, AuthorName, AuthorBio) VALUES (NULL, 'George R Martin', 'Born in 1948, fantasy writer George R. R. Martin grew up in Bayonne, New Jersey. He developed a love for writing early on. His first novel, Dying of the Light, debuted in 1977. In 1996, he published his first installment of the A Song of Ice and Fire series. Martin became a best-selling author in 2005 with the fourth title A Feast for Crows and again in 2011 with the fifth A Dance with Dragons.

Early Life
A leading fantasy author, George R. R. Martin grew up in Bayonne, New Jersey where his world was five blocks long. He may have spent his early years never straying far from home, but his imagination seemed to take him places. The oldest of three children, Martin liked to watch offbeat and suspenseful television shows, such as Thriller and The Twilight Zone.

The son of a longshoreman, Martin started writing in elementary school. He sold monster stories to other kids in his working-class neighborhood. During his high school years, Martin moved on to other subjects. He started writing fan fiction based on the comic books he adored and began creating new superheroes as well. At Marist High School, a Catholic boys school, Martin played on the chess team and spent several years on the schools newspaper. After graduating in 1966, he went to Northwestern University where he continued to pursue his passion for writing. He earned first a bachelors degree in journalism in 1970 and then a masters degree in the same subject the following year.

A conscientious objector during the Vietnam War, Martin worked with the Cook County Legal Assistance Foundation as part of his alternative service from 1973 to 1976. He then spent two years as a college professor at Clarke College in Dubuque, Iowa.

Career Beginnings
Martin sold his first short story, The Hero, to Galaxy, a science fiction magazine, which was published in 1971. Continuing to write short stories, he released a collection of his tales as A Song for Lya and Others in 1976. His debut novel, Dying of the Light, came out the following year. Martin also served as an editor on numerous book projects, including New Voices in Science Fiction (1977) and the Wild Cards series.

While he became well regarded in the fantasy and science fiction worlds, Martin had yet to achieve a huge commercial success by the 1980s. He did, however, attract some attention from Hollywood. He worked as story editor for a remake of the old favorite Twilight Zone in 1986, and then became involved with the series Beauty and the Beast. Writing for television posed certain challenges for Martin. Whenever I would turn in a script, the producers would always say to me: George, this is wonderful, but it would cost five times our budget to produce it, he said in a National Public Radio interview. Weary of the limitations of television, Martin embarked on a new writing project in the early 1990s fantasy series inspired by medieval Englands Wars of the Roses.

');


INSERT INTO gt_publishers (PublisherID, PublisherName, PublisherDescription) VALUES (NULL, 'Bantam Spectra', '');
INSERT INTO gt_books (BookID, AuthorID, PublisherID, BookTitle, BookDescription, ReleaseDate, Genre, Price, BookCover) VALUES (NULL, '1', '1', 'Game Of Thrones: A Song of Ice and Fire', 'Nominated as one of Americas best-loved novels by PBSs The Great American Read. From a master of contemporary fantasy comes the first novel of a landmark series unlike any youve ever read before. With A Game of Thrones, George R. R. Martin has launched a genuine masterpiece, bringing together the best the genre has to offer. Mystery, intrigue, romance, and adventure fill the pages of this magnificent saga, the first volume in an epic series sure to delight fantasy fans everywhere.\r\n \r\nA GAME OF THRONES\r\nA SONG OF ICE AND FIRE: BOOK ONE\r\n \r\nLong ago, in a time forgotten, a preternatural event threw the seasons out of balance. In a land where summers can last decades and winters a lifetime, trouble is brewing. The cold is returning, and in the frozen wastes to the north of Winterfell, sinister forces are massing beyond the kingdoms protective Wall. To the south, the kings powers are failing his most trusted adviser dead under mysterious circumstances and his enemies emerging from the shadows of the throne. At the center of the conflict lie the Starks of Winterfell, a family as harsh and unyielding as the frozen land they were born to. Now Lord Eddard Stark is reluctantly summoned to serve as the kings new Hand, an appointment that threatens to sunder not only his family but the kingdom itself.\r\n\r\nSweeping from a harsh land of cold to a summertime kingdom of epicurean plenty, A Game of Thrones tells a tale of lords and ladies, soldiers and sorcerers, assassins and bastards, who come together in a time of grim omens. Here an enigmatic band of warriors bear swords of no human metal; a tribe of fierce wildlings carry men off into madness; a cruel young dragon prince barters his sister to win back his throne; a child is lost in the twilight between life and death; and a determined woman undertakes a treacherous journey to protect all she holds dear. Amid plots and counter-plots, tragedy and betrayal, victory and terror, allies and enemies, the fate of the Starks hangs perilously in the balance, as each side endeavors to win that deadliest of conflicts: the game of thrones.\r\n\r\nUnparalleled in scope and execution, A Game of Thrones is one of those rare reading experiences that catch you up from the opening pages, wont let you go until the end, and leave you yearning for more.', '1996-04-22', 'Fantasy', 8.69, '/img/cover_gameofthrones01.jpg');
INSERT INTO gt_books (BookID, AuthorID, PublisherID, BookTitle, BookDescription, ReleaseDate, Genre, Price, BookCover) VALUES (NULL, '1', '1', 'Game Of Thrones: A Clash of Kings', 'In this eagerly awaited sequel to A Game of Thrones, George R. R. Martin has created a work of unsurpassed vision, power, and imagination. A Clash of Kings transports us to a world of revelry and revenge, wizardry and warfare unlike any you have ever experienced.

A CLASH OF KINGS

A comet the color of blood and flame cuts across the sky. And from the ancient citadel of Dragonstone to the forbidding shores of Winterfell, chaos reigns. Six factions struggle for control of a divided land and the Iron Throne of the Seven Kingdoms, preparing to stake their claims through tempest, turmoil, and war. It is a tale in which brother plots against brother and the dead rise to walk in the night. Here a princess masquerades as an orphan boy; a knight of the mind prepares a poison for a treacherous sorceress; and wild men descend from the Mountains of the Moon to ravage the countryside. Against a backdrop of incest and fratricide, alchemy and murder, victory may go to the men and women possessed of the coldest steel...and the coldest hearts. For when kings clash, the whole land trembles.', '1998-11-16', 'Fantasy', 14.40, '/img/cover_gameofthrones02.jpg');

INSERT INTO gt_books (BookID, AuthorID, PublisherID, BookTitle, BookDescription, ReleaseDate, Genre, Price, BookCover) VALUES (NULL, '1', '1', 'Game Of Thrones: A Storm of Swords', 'HBOs hit series A GAME OF THRONES is based on George R R Martins internationally bestselling series A SONG OF ICE AND FIRE, the greatest fantasy epic of the modern age. A STORM OF SWORDS: STEEL AND SNOW is the FIRST part of the third volume in the series. Martin has captured the imagination of millions Guardian Winter approaches Westeros like an angry beast. The Seven Kingdoms are divided by revolt and blood feud. In the northern wastes, a horde of hungry, savage people steeped in the dark magic of the wilderness is poised to invade the Kingdom of the North where Robb Stark wears his new-forged crown. And Robbs defences are ranged against the South, the land of the cunning and cruel Lannisters, who have his younger sisters in their power. Throughout Westeros, the war for the Iron Throne rages more fiercely than ever, but if the Wall is breached, no king will live to claim it.', '2000-04-15', 'Fantasy', 16.79, '/img/cover_gameofthrones03.jpg');



INSERT INTO gt_users (UserID, UserName, Email, Hash, Salt) VALUES (1988495636, 'dariel312', 'dariel_games@yahoo.com', '31ab7bc03822d9d30a766f3aabb060f7', '411887070');

INSERT INTO gt_book_ratings (BookRatingID, BookID, UserID, Rating, Comment) VALUES (NULL, '1', '1988495636', '4', 'This was the best book I ever read!');