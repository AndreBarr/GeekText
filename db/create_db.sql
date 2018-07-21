DROP DATABASE geek_text;
CREATE DATABASE geek_text;
USE geek_text;

CREATE TABLE `gt_user_purchased` (
  `UserID` int(11) NOT NULL,
  `BookID` int(11) NOT NULL,
  `DatePurchased` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`BookID`, `UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `gt_publishers` (
  `PublisherID` int(11) NOT NULL,
  `PublisherName` varchar(255) DEFAULT NULL,
  `PublisherDescription` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`PublisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


CREATE TABLE `gt_books` (
  `BookID` int(11) NOT NULL,
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
  `AuthorID` int(11) NOT NULL,
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


CREATE TABLE `gt_book_genres` (
  `BookGenreID` int(11) NOT NULL,
  `Genre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`BookGenreID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

CREATE TABLE `gt_user_detail` (
  `UserID` int(11) NOT NULL,
  `RealName` varchar(50) NOT NULL,
  `HomeAddr` varchar(255) DEFAULT NULL,
  `HomeCity` varchar(2000) DEFAULT NULL,
  `HomeState` varchar(2000) DEFAULT NULL,
  `HomeZIP` INT(11) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `gt_user_shippings` (
  `UserID` int(11) NOT NULL,
  `ShippingAddr` varchar(255) NOT NULL,
  `ShippingCity` varchar(2000) NOT NULL,
  `ShippingState` varchar(2000) NOT NULL,
  `ShippingZIP` INT(11) NOT NULL,
  PRIMARY KEY (`UserID`, `ShippingAddr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (1, 'Science fiction');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (2, 'Satire');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (3, 'Drama');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (4, 'Action and Adventure');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (5, 'Romance');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (6, 'Mystery');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (7, 'Horror');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (8, 'Self help');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (9, 'Health');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (10, 'Guide');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (11, 'Travel');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (12, 'Children\'s');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (13, 'Religion, Spirituality & New Age');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (14, 'Science');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (15, 'History');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (16, 'Math');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (17, 'Anthology');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (18, 'Poetry');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (19, 'Encyclopedias');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (20, 'Dictionaries');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (21, 'Comics');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (22, 'Art');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (23, 'Cookbooks');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (24, 'Diaries');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (25, 'Journals');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (26, 'Prayer books');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (27, 'Series');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (28, 'Trilogy');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (29, 'Biographies');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (30, 'Autobiographies');
INSERT INTO gt_book_genres(BookGenreID, Genre) VALUES (31, 'Fantasy');

INSERT INTO gt_authors (AuthorID, AuthorName, AuthorBio) VALUES (1, 'George R Martin', 'Born in 1948, fantasy writer George R. R. Martin grew up in Bayonne, New Jersey. He developed a love for writing early on. His first novel, Dying of the Light, debuted in 1977. In 1996, he published his first installment of the A Song of Ice and Fire series. Martin became a best-selling author in 2005 with the fourth title A Feast for Crows and again in 2011 with the fifth A Dance with Dragons.');
INSERT INTO gt_authors (AuthorID, AuthorName, AuthorBio) VALUES (2, 'J. K. Rowling', 'Joanne Rowling, writing under the pen names J. K. Rowling and Robert Galbraith, is a British novelist, philanthropist, film and television producer and screenwriter best known for writing the Harry Potter fantasy series.');
INSERT INTO gt_authors (AuthorID, AuthorName, AuthorBio) VALUES (3, 'Aldous Huxley', 'Aldous Leonard Huxley was an English writer, novelist, philosopher, and prominent member of the Huxley family. He graduated from Balliol College at the University of Oxford with a first-class honours degree in English literature. The author of nearly fifty books, Huxley was best known for his novels (among them Brave New World, set in a dystopian future); for nonfiction works, such as The Doors of Perception, in which he recalls his experiences taking psychedelic drugs; and for his wide-ranging essays. Early in his career, Huxley published short stories and poetry, and edited the literary magazine Oxford Poetry. He went on to publish travel writing, film stories, satire, and screenplays. He spent the latter part of his life in the United States, living in Los Angeles from 1937 until his death.');
INSERT INTO gt_authors (AuthorID, AuthorName, AuthorBio) VALUES (4, 'J. R. R. Tolkien', 'John Ronald Reuel Tolkien was an English writer, poet, philologist, and university professor who is best known as the author of the classic high fantasy works The Hobbit, The Lord of the Rings, and The Silmarillion.');
INSERT INTO gt_authors (AuthorID, AuthorName, AuthorBio) VALUES (5, 'Edgar Allen Poe', 'Edgar Allan Poe was an American writer, editor, and literary critic. Poe is best known for his poetry and short stories, particularly his tales of mystery and the macabre. He is widely regarded as a central figure of Romanticism in the United States and American literature as a whole, and he was one of the country\'s earliest practitioners of the short story. Poe is generally considered the inventor of the detective fiction genre and is further credited with contributing to the emerging genre of science fiction. He was the first well-known American writer to try to earn a living through writing alone, resulting in a financially difficult life and career.');

INSERT INTO gt_publishers (PublisherID, PublisherName, PublisherDescription) VALUES (1, 'Bantam Spectra', 'Bantam Spectra is an American publishing house owned entirely by parent company Random House, a subsidiary of Penguin Random House; it is an imprint of the Random House Publishing Group. Well known for publishing the Game of Thrones books.');
INSERT INTO gt_publishers (PublisherID, PublisherName, PublisherDescription) VALUES (2, 'Bloomsbury Publishing', 'Bloomsbury Publishing is a leading independent publishing house established in 1986. It has companies in London, New York, Sydney and New Delhi.');
INSERT INTO gt_publishers (PublisherID, PublisherName, PublisherDescription) VALUES (3, 'Chatto & Windus', 'Chatto & Windus was an important publisher of books in London, founded in the Victorian era. Since 1987, it has been an imprint of Random House, publishers.');
INSERT INTO gt_publishers (PublisherID, PublisherName, PublisherDescription) VALUES (4, 'Allen & Unwin', 'Allen & Unwin is an Australian independent publishing company, established in Australia in 1976 as a subsidiary of the British firm George Allen & Unwin Ltd., which was founded by Sir Stanley Unwin in August 1914 and went on to become one of the leading publishers of the twentieth century.');
INSERT INTO gt_publishers (PublisherID, PublisherName, PublisherDescription) VALUES (5, 'Barnes & Nobles', 'Barnes & Noble, Inc., a Fortune 500 company, is the bookseller with the largest number of retail outlets in the United States, and a retailer of content, digital media, and educational products. As of October 15, 2017, the company operates 633 retail stores in all 50 U.S. states.');

INSERT INTO gt_books (BookID, AuthorID, PublisherID, BookTitle, BookDescription, ReleaseDate, Genre, Price, BookCover) VALUES (1, '1', '1', 'Game Of Thrones: A Song of Ice and Fire', 'Nominated as one of Americas best-loved novels by PBSs The Great American Read. From a master of contemporary fantasy comes the first novel of a landmark series unlike any youve ever read before. With A Game of Thrones, George R. R. Martin has launched a genuine masterpiece, bringing together the best the genre has to offer. Mystery, intrigue, romance, and adventure fill the pages of this magnificent saga, the first volume in an epic series sure to delight fantasy fans everywhere.\r\n \r\nA GAME OF THRONES\r\nA SONG OF ICE AND FIRE: BOOK ONE\r\n \r\nLong ago, in a time forgotten, a preternatural event threw the seasons out of balance. In a land where summers can last decades and winters a lifetime, trouble is brewing. The cold is returning, and in the frozen wastes to the north of Winterfell, sinister forces are massing beyond the kingdoms protective Wall. To the south, the kings powers are failing his most trusted adviser dead under mysterious circumstances and his enemies emerging from the shadows of the throne. At the center of the conflict lie the Starks of Winterfell, a family as harsh and unyielding as the frozen land they were born to. Now Lord Eddard Stark is reluctantly summoned to serve as the kings new Hand, an appointment that threatens to sunder not only his family but the kingdom itself.\r\n\r\nSweeping from a harsh land of cold to a summertime kingdom of epicurean plenty, A Game of Thrones tells a tale of lords and ladies, soldiers and sorcerers, assassins and bastards, who come together in a time of grim omens. Here an enigmatic band of warriors bear swords of no human metal; a tribe of fierce wildlings carry men off into madness; a cruel young dragon prince barters his sister to win back his throne; a child is lost in the twilight between life and death; and a determined woman undertakes a treacherous journey to protect all she holds dear. Amid plots and counter-plots, tragedy and betrayal, victory and terror, allies and enemies, the fate of the Starks hangs perilously in the balance, as each side endeavors to win that deadliest of conflicts: the game of thrones.\r\n\r\nUnparalleled in scope and execution, A Game of Thrones is one of those rare reading experiences that catch you up from the opening pages, wont let you go until the end, and leave you yearning for more.', '1996-04-22', 31, 8.69, '/img/cover_gameofthrones01.jpg');
INSERT INTO gt_books (BookID, AuthorID, PublisherID, BookTitle, BookDescription, ReleaseDate, Genre, Price, BookCover) VALUES (2, '1', '1', 'Game Of Thrones: A Clash of Kings', 'In this eagerly awaited sequel to A Game of Thrones, George R. R. Martin has created a work of unsurpassed vision, power, and imagination. A Clash of Kings transports us to a world of revelry and revenge, wizardry and warfare unlike any you have ever experienced.

A CLASH OF KINGS

A comet the color of blood and flame cuts across the sky. And from the ancient citadel of Dragonstone to the forbidding shores of Winterfell, chaos reigns. Six factions struggle for control of a divided land and the Iron Throne of the Seven Kingdoms, preparing to stake their claims through tempest, turmoil, and war. It is a tale in which brother plots against brother and the dead rise to walk in the night. Here a princess masquerades as an orphan boy; a knight of the mind prepares a poison for a treacherous sorceress; and wild men descend from the Mountains of the Moon to ravage the countryside. Against a backdrop of incest and fratricide, alchemy and murder, victory may go to the men and women possessed of the coldest steel...and the coldest hearts. For when kings clash, the whole land trembles.', '1998-11-16', 31, 14.40, '/img/cover_gameofthrones02.jpg');

INSERT INTO gt_books (BookID, AuthorID, PublisherID, BookTitle, BookDescription, ReleaseDate, Genre, Price, BookCover) VALUES 
  (3, '1', '1', 'Game Of Thrones: A Storm of Swords', 'HBOs hit series A GAME OF THRONES is based on George R R Martins internationally bestselling series A SONG OF ICE AND FIRE, the greatest fantasy epic of the modern age. A STORM OF SWORDS: STEEL AND SNOW is the FIRST part of the third volume in the series. Martin has captured the imagination of millions Guardian Winter approaches Westeros like an angry beast. The Seven Kingdoms are divided by revolt and blood feud. In the northern wastes, a horde of hungry, savage people steeped in the dark magic of the wilderness is poised to invade the Kingdom of the North where Robb Stark wears his new-forged crown. And Robbs defences are ranged against the South, the land of the cunning and cruel Lannisters, who have his younger sisters in their power. Throughout Westeros, the war for the Iron Throne rages more fiercely than ever, but if the Wall is breached, no king will live to claim it.', '2000-04-15', 31, 16.79, '/img/cover_gameofthrones03.jpg');
INSERT INTO gt_books (BookID, AuthorID, PublisherID, BookTitle, BookDescription, ReleaseDate, Genre, Price, BookCover) VALUES
  (4, '2', '2', 'Harry Potter and the Sorcerers Stone', 'Harry Potter has been living an ordinary life, constantly abused by his surly and cold aunt and uncle, Vernon and Petunia Dursley and bullied by their spoiled son Dudley since the death of his parents ten years prior. His life changes on the day of his eleventh birthday when he receives a letter of acceptance into a Hogwarts School of Witchcraft and Wizardry, delivered by a half-giant named Rubeus Hagrid after previous letters had been destroyed by Vernon and Petunia. Hagrid explains Harry\'s hidden past as the wizard son of James and Lily Potter, who were a wizard and witch respectively, and how they were murdered by the most evil and powerful dark wizard of all time, Lord Voldemort, which resulted in the one-year-old Harry being sent to live with his aunt and uncle. The strangest bit of the murder was how Voldemort was unable to kill him, but instead had his own powers removed and blasted away, sparking Harry\'s immense fame among the magical community.', '1997-06-27', 31, 9.99, '/img/HP_SS.jpg');  

INSERT INTO gt_books (BookID, AuthorID, PublisherID, BookTitle, BookDescription, ReleaseDate, Genre, Price, BookCover) VALUES
  (5, '2', '2', 'Harry Potter and the Chamber of Secrets', 'On Harry Potter\'s twelfth birthday, the Dursley family-Harry\'s uncle Vernon, aunt Petunia, and cousin Dudley-hold a dinner party for a potential client of Vernon\'s drill-manufacturing company. Harry is not invited, but is content to spend the evening quietly in his bedroom, although he is confused why his school friends have not sent cards or presents. However, when he goes to his room, a house-elf named Dobby warns him not to return to Hogwarts and admits to intercepting Harry\'s post from his friends. Having failed to persuade Harry to voluntarily give up his place at Hogwarts, Dobby then attempts to get him expelled by using magic to smash Petunia\'s dessert on a dinner party guest and framing it on Harry, who is not allowed to use magic out of school. Uncle Vernon\'s business deal falls through, but Harry is given a second chance from the Ministry of Magic, and allowed to return at the start of the school year.', '1998-07-2', 31, 9.99, '/img/HP_CS.jpeg');  

INSERT INTO gt_books (BookID, AuthorID, PublisherID, BookTitle, BookDescription, ReleaseDate, Genre, Price, BookCover) VALUES
  (6, '2', '2', 'Harry Potter and the Prisoner of Azkaban', 'Harry is back at the Dursleys for the summer holidays, where he sees on Muggle television that a convict named Sirius Black has escaped, though with no mention of what facility he has broken out of. Harry involuntarily inflates Aunt Marge when she comes to visit after she insults Harry and his parents. This leads to his running away and being picked up by the Knight Bus. He travels to the Leaky Cauldron where he meets Cornelius Fudge, the Minister for Magic, who asks Harry to stay in Diagon Alley for the remaining three weeks before the start of the school year at Hogwarts.', '1999-07-08', 31, 9.99, '/img/HP_PoA.jpeg'); 

INSERT INTO gt_books (BookID, AuthorID, PublisherID, BookTitle, BookDescription, ReleaseDate, Genre, Price, BookCover) VALUES
  (7, '2', '2', 'Harry Potter and the Goblet of Fire', 'Harry Potter is in his fourth year at Hogwarts. Harry wants to get away from the pernicious Dursleys and go to the Quidditch World Cup with Hermione, Ron, and the Weasleys. He wants to find out about the mysterious event to take place at Hogwarts this year, an event involving two other rival schools of magic, and a competition that hasn\'t happened for hundreds of years. He wants to be a normal, fourteen-year-old wizard. But unfortunately for Harry Potter, he\'s not normal - not even by Wizarding standards. And in his case, different can be deadly. ', '2000-07-08', 31, 9.99, '/img/HP_GoF.jpeg'); 

INSERT INTO gt_books (BookID, AuthorID, PublisherID, BookTitle, BookDescription, ReleaseDate, Genre, Price, BookCover) VALUES
  (8, '2', '2', 'Harry Potter and the Order of the Phoenix', 'Harry is in his fifth year at Hogwarts School as the adventures continue. There is a door at the end of a silent corridor. And it\'s haunting Harry Potter\'s dreams. Why else would he be waking in the middle of the night, screaming in terror? Harry has a lot on his mind for this, his fifth year at Hogwarts: a Defence Against the Dark Arts teacher with a personality like poisoned honey; a big surprise on the Gryffindor Quidditch team; and the looming terror of the Ordinary Wizarding Level exams. ', '2003-07-21', 31, 9.99, '/img/HP_OotP.jpeg'); 

INSERT INTO gt_books (BookID, AuthorID, PublisherID, BookTitle, BookDescription, ReleaseDate, Genre, Price, BookCover) VALUES
  (9, '2', '2', 'Harry Potter and the Half Blood Price', 'It is the middle of the summer, but there is an unseasonal mist pressing against the window panes. Harry Potter is waiting nervously in his bedroom at the Dursleys\' house in Privet Drive for a visit from Professor Dumbledore himself. One of the last times he saw the Headmaster was in a fierce one-to-one duel with Lord Voldemort, and Harry can\'t quite believe that Professor Dumbledore will actually appear at the Dursleys\' of all places. Why is the Professor coming to visit him now? What is it that cannot wait until Harry returns to Hogwarts in a few weeks\' time? Harry\'s sixth year at Hogwarts has already got off to an unusual start, as the worlds of Muggle and magic start to intertwine...', '2005-07-16', 31, 9.99, '/img/HP_HBP.jpeg');   

INSERT INTO gt_books (BookID, AuthorID, PublisherID, BookTitle, BookDescription, ReleaseDate, Genre, Price, BookCover) VALUES
  (10, '2', '2', 'Harry Potter and the Dealthy Hallows', 'Harry is waiting in Privet Drive. The Order of the Phoenix is coming to escort him safely away without Voldemort and his supporters knowing - if they can. But what will Harry do then? How can he fulfil the momentous and seemingly impossible task that Professor Dumbledore has left him? As he travels Harry discovers that a battle is breaking out at Hogwarts. He has to do anything to stop it even if that involves killing himself.', '2007-07-21', 31, 9.99, '/img/HP_DH.jpeg');  

INSERT INTO gt_books (BookID, AuthorID, PublisherID, BookTitle, BookDescription, ReleaseDate, Genre, Price, BookCover) VALUES
  (11, '3', '3', 'Brave New World', 'The natural processes of birth, aging, and death represent horrors in this world. Bernard Marx, an Alpha-Plus (or high-caste) psychologist, emerges as the single discontented person in a world where material comfort and physical pleasure - provided by the drug soma and recreational sex - are the only concerns.', '1932-01-01', 1, 19.99, '/img/BNW.jpg');  

INSERT INTO gt_books (BookID, AuthorID, PublisherID, BookTitle, BookDescription, ReleaseDate, Genre, Price, BookCover) VALUES
  (12, '4', '4', 'The Silmarillion', 'A complete summary is impossible, because the book spans millennia and has one earth-shattering event after another. But it includes the creation of Tolkien\'s invented pantheons of angelic beings under Eru Iluvatar, also known as God; how they sang the world into being; the creation of Elves, Men, and Dwarves; the legendary love story of Beren and Luthien, a mortal Man and an Elf maiden who gives up her immortality for the man she loves; the demonic Morgoth and Sauron; Elves of just about any kind - bad, mad, dangerous, good, sweet, brave, and so forth; the creation of the many Rings of Power - and the One Ring of Sauron; the Two Trees that made the sun and moon; and finally the quest of the Ringbearer, Frodo Baggins.', '1977-09-15', 31, 14.99, '/img/TSM.jpg'); 

INSERT INTO gt_books (BookID, AuthorID, PublisherID, BookTitle, BookDescription, ReleaseDate, Genre, Price, BookCover) VALUES
  (13, '4', '4', 'The Hobbit', 'The Hobbit is set in a time "between the Dawn of Færie and the Dominion of Men", and follows the quest of home-loving hobbit Bilbo Baggins to win a share of the treasure guarded by Smaug the dragon. Bilbo\'s journey takes him from light-hearted, rural surroundings into more sinister territory. The story is told in the form of an episodic quest, and most chapters introduce a specific creature or type of creature of Tolkien\'s geography. Bilbo gains a new level of maturity, competence, and wisdom by accepting the disreputable, romantic, fey, and adventurous sides of his nature and applying his wits and common sense. The story reaches its climax in the Battle of the Five Armies, where many of the characters and creatures from earlier chapters re-emerge to engage in conflict.', '1937-09-21', 31, 14.99, '/img/TH.jpg');

INSERT INTO gt_books (BookID, AuthorID, PublisherID, BookTitle, BookDescription, ReleaseDate, Genre, Price, BookCover) VALUES
  (14, '4', '4', 'The Fellowship of the Ring', 'Thousands of years before the events of the novel, the Dark Lord Sauron had forged the One Ring to rule the other Rings of Power and corrupt those who wore them: the leaders of Men, Elves and Dwarves. Sauron was defeated by an alliance of Elves and Men led by Gil-galad and Elendil, respectively. In the final battle, Isildur, son of Elendil, cut the One Ring from Sauron\'s finger, causing Sauron to lose his physical form. Isildur claimed the Ring as an heirloom for his line, but when he was later ambushed and killed by the Orcs, the Ring was lost in the River Anduin.', '1954-07-29', 31, 14.99, '/img/TFotR.jpg');

INSERT INTO gt_books (BookID, AuthorID, PublisherID, BookTitle, BookDescription, ReleaseDate, Genre, Price, BookCover) VALUES
  (15, '5', '5', 'The Complete Tales and Poems of Edgar Allan Poe', 'Edgar Allan Poe is credited with having pioneered the short story, having perfected the tale of psychological horror, and having revolutionized modern poetics. The entirety of Poe\'s body of imaginative work encompasses detective tales, satires, fables, fantasies, science fiction, verse dramas, and some of the most evocative poetry in the English language. This leatherbound omnibus collects all of Poe\'s fiction and poetry in a single volume, including "The Fall of the House of Usher," "The Tell-Tale Heart," "The Pit and the Pendulum,." "The Raven," "Annabel Lee," the full-length novel The Narrative of Arthur Gordon Pym of Nantucket, and much more.', '2015-07-31', 7, 34.99, '/img/EAP.jpg');

INSERT INTO gt_users (UserID, UserName, Email, Hash, Salt) VALUES (1111, 'Anonymous', 'anon@anon.com','' ,'');