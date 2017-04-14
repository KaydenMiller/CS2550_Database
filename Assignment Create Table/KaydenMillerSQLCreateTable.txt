/*
DROP TABLE Track;
DROP TABLE Album;
DROP TABLE Artist;
DROP TABLE Genre;
DROP TABLE Media_Type;
*/

CREATE TABLE Artist
(
	ArtistId Number(5,0),
	Name VarChar2(120),
	CONSTRAINT PK_Artist PRIMARY KEY (ArtistId)
);

CREATE TABLE Genre
(
	GenreId Number(5,0),
	Name VarChar(120) NOT NULL,
	CONSTRAINT PK_Genre PRIMARY KEY (GenreId)
);

CREATE TABLE Media_Type
(
	MediaTypeId Number(5,0),
	Name VarChar2(120),
	CONSTRAINT PK_Media_Type PRIMARY KEY (MediaTypeId)
);

CREATE TABLE Album
(
	AlbumId Number(5,0),
	Title VarChar2(160) NOT NULL,
	ArtistId Number(5,0) NOT NULL,
	CONSTRAINT PK_Album PRIMARY KEY (AlbumId),
	CONSTRAINT FK_Artist_Id FOREIGN KEY (ArtistId) REFERENCES Artist(ArtistId)
);

CREATE TABLE Track
(
	TrackId Number(5,0),
	Name VarChar2(200) NOT NULL,
	AlbumId Number(5,0),
	MediaTypeId Number(5,0),
	GenreId Number(5,0),
	Composer VarChar2(220),
	Milliseconds Number(8,0) NOT NULL,
	Bytes Number(8,0),
	UnitPrice Number(12,2) NOT NULL,
	CONSTRAINT PK_Track PRIMARY KEY (TrackId),
	CONSTRAINT FK_Album_AlbumId FOREIGN KEY (AlbumId) REFERENCES Album(AlbumId),
	CONSTRAINT FK_MediaType_MediaId FOREIGN KEY (MediaTypeId) REFERENCES Media_Type(MediaTypeId),
	CONSTRAINT FK_Genre_GenreId FOREIGN KEY (GenreId) REFERENCES Genre(GenreId)
);

INSERT ALL 
	INTO Genre (genreid, name) VALUES (1, 'Rock')
	INTO Genre (genreid, name) VALUES (2, 'Jazz')
	INTO Genre (genreid, name) VALUES (3, 'Metal')
	INTO Genre (genreid, name) VALUES (4, 'Alternative and Punk')
	INTO Genre (genreid, name) VALUES (5, 'Rock And Roll')
	INTO Genre (genreid, name) VALUES (6, 'Blues')
	INTO Genre (genreid, name) VALUES (7, 'Latin')
	INTO Genre (genreid, name) VALUES (8, 'Reggae')
	INTO Genre (genreid, name) VALUES (9, 'Pop')
	INTO Genre (genreid, name) VALUES (10, 'Soundtrack')
	INTO Genre (genreid, name) VALUES (11, 'Bossa Nova')
	INTO Genre (genreid, name) VALUES (12, 'Easy Listening')
	INTO Genre (genreid, name) VALUES (13, 'Heavy Metal')
	INTO Genre (genreid, name) VALUES (14, 'RB and Soul')
	INTO Genre (genreid, name) VALUES (15, 'Electronica or Dance')
	INTO Genre (genreid, name) VALUES (16, 'World')
	INTO Genre (genreid, name) VALUES (17, 'Hip Hop or Rap')
	INTO Genre (genreid, name) VALUES (18, 'Science Fiction')
	INTO Genre (genreid, name) VALUES (19, 'TV Shows')
	INTO Genre (genreid, name) VALUES (20, 'Sci Fi and Fantasy')
	INTO Genre (genreid, name) VALUES (21, 'Drama')
	INTO Genre (genreid, name) VALUES (22, 'Comedy')
	INTO Genre (genreid, name) VALUES (23, 'Alternative')
	INTO Genre (genreid, name) VALUES (24, 'Classical')
	INTO Genre (genreid, name) VALUES (25, 'Opera')
SELECT 1 FROM DUAL;

INSERT ALL
	INTO Media_Type (mediatypeid, name) VALUES (1, 'MPEG audio file')
	INTO Media_Type (mediatypeid, name) VALUES (2, 'Protected AAC audio file')
	INTO Media_Type (mediatypeid, name) VALUES (3, 'Protected MPEG4 video file')
	INTO Media_Type (mediatypeid, name) VALUES (4, 'Purchased AAC audio file')
	INTO Media_Type (mediatypeid, name) VALUES (5, 'AAC audio file')
SELECT 1 FROM DUAL;

INSERT ALL
	INTO Artist (artistId, name) VALUES (1, 'ACDC')
	INTO Artist (artistId, name) VALUES (2, 'Accept')
	INTO Artist (artistId, name) VALUES (3, 'Aerosmith')
	INTO Artist (artistId, name) VALUES (4, 'Alanis Morissette')
	INTO Artist (artistId, name) VALUES (5, 'Alice In Chains')
	INTO Artist (artistId, name) VALUES (6, 'Antonio Carlos Jobim')
	INTO Artist (artistId, name) VALUES (7, 'Apocalyptica')
	INTO Artist (artistId, name) VALUES (8, 'Audioslave')
	INTO Artist (artistId, name) VALUES (9, 'BackBeat')
	INTO Artist (artistId, name) VALUES (10, 'Billy Cobham')
	INTO Artist (artistId, name) VALUES (11, 'Black Label Society')
	INTO Artist (artistId, name) VALUES (12, 'Black Sabbath')
SELECT 1 FROM DUAL;

INSERT ALL 
	INTO Album (albumId, Title, artistId) VALUES (1, 'For Those About To Rock We Salute You', 1)
	INTO Album (albumId, Title, artistId) VALUES (2, 'Balls to the Wall', 2)
	INTO Album (albumId, Title, artistId) VALUES (3, 'Restless and Wild', 2)
	INTO Album (albumId, Title, artistId) VALUES (4, 'Let There Be Rock', 1)
	INTO Album (albumId, Title, artistId) VALUES (5, 'Big Ones', 3)
	INTO Album (albumId, Title, artistId) VALUES (6, 'Jagged Little Pill', 4)
	INTO Album (albumId, Title, artistId) VALUES (7, 'Facelift', 5)
	INTO Album (albumId, Title, artistId) VALUES (8, 'Warner 25 Anos', 6)
	INTO Album (albumId, Title, artistId) VALUES (9, 'Plays Metallica By Four Cellos', 7)
	INTO Album (albumId, Title, artistId) VALUES (10, 'Audioslave', 8)
	INTO Album (albumId, Title, artistId) VALUES (11, 'Out Of Exile', 8)
	INTO Album (albumId, Title, artistId) VALUES (12, 'BackBeat Soundtrack', 9)
	INTO Album (albumId, Title, artistId) VALUES (13, 'The Best Of Billy Cobham', 10)
	INTO Album (albumId, Title, artistId) VALUES (14, 'Alcohol Fueled Brewtality Live! [Disc 1]', 11)
	INTO Album (albumId, Title, artistId) VALUES (15, 'Alcohol Fueled Brewtality Live! [Disc 2]', 11)
	INTO Album (albumId, Title, artistId) VALUES (16, 'Black Sabbath', 12)
	INTO Album (albumId, Title, artistId) VALUES (17, 'Black Sabbath Vol. 4 (Remaster)', 12)
	INTO Album (albumId, Title, artistId) VALUES (34, 'Chill: Brazil (Disc 2)', 6)
	INTO Album (albumId, Title, artistId) VALUES (271, 'Revelations', 8)
SELECT 1 FROM DUAL;

/* SET DEFINE OFF; this prevents sql developer from asking for substitution variables */
INSERT ALL
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice) 
		VALUES (1, 'For Those About To Rock (We Salute You)', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 343719, 11170334, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
		VALUES (6, 'Put The Finger On You', 1, 1, 1, 'Angus Young, Malcolm Young, Brian Johnson', 205662, 6713451, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Milliseconds, Bytes, UnitPrice)
		VALUES (2, 'Balls to the Wall', 2, 2, 1, 342562, 5510424, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
		VALUES (3, 'Fast As a Shark', 3, 2, 1, 'F. Baltes, S. Kaufman, U. Dirkscneider & W. Hoffman', 230619, 3990994, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
		VALUES (4, 'Restless and Wild', 3, 2, 1, 'F. Baltes, R.A. Smith-Diesel, S. Kaufman, U. Dirkscneider & W. Hoffman', 252051, 4331779, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
		VALUES (16, 'Dog Eat Dog', 4, 1, 1, 'AC/DC', 215196, 7032162, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
		VALUES (17, 'Let There Be Rock', 4, 1, 1, 'AC/DC', 366654, 12021261, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
		VALUES (23, 'Walk On Water', 5, 1, 1, 'Steven Tyler, Joe Perry, Jack Blades, Tommy Shaw', 295680, 9719579, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
		VALUES (24, 'Love In An Elevator', 5, 1, 1, 'Steven Tyler, Joe Perry', 321828, 10552051, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
		VALUES (38, 'All I Really Want', 6, 1, 1, 'Alanis Morissette & Glenn Ballard', 284891, 9375567, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
		VALUES (39, 'You Oughta Know', 6, 1, 1, 'Alanis Morissette & Glenn Ballard', 249234, 8196916, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
		VALUES (40, 'Perfect', 6, 1, 1, 'Alanis Morissette & Glenn Ballard', 188133, 6145404, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
		VALUES (51, 'We Die Young', 7, 1, 1, 'Jerry Cantrell', 152084, 4925362, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
		VALUES (52, 'Man In The Box', 7, 1, 1, 'Jerry Cantrell, Layne Staley', 286641, 9310272, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Milliseconds, Bytes, UnitPrice)
		VALUES (63, 'Desafinado', 8, 1, 2, 185338, 5990473, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Milliseconds, Bytes, UnitPrice)
		VALUES (64, 'Garota De Ipanema', 8, 1, 2, 285048, 9348428, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
		VALUES (77, 'Enter Sandman', 9, 1, 3, 'Apocalyptica', 221701, 7286305, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
		VALUES (78, 'Master Of Puppets', 9, 1, 3, 'Apocalyptica', 436453, 14375310, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
		VALUES (85, 'Cochise', 10, 1, 1, 'Audioslave and Chris Cornell', 222380, 5339931, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
		VALUES (86, 'Show Me How to Live', 10, 1, 1, 'Audioslave and Chris Cornell', 277890, 6672176, .99)
	/* HERE DOWN */
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
		VALUES (99, 'Your Time Has Come', 11, 1, 4, 'Cornell, Commerford, Morello, Wilk', 255529, 8273592, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
		VALUES (100, 'Out Of Exile', 11, 1, 4, 'Cornell, Commerford, Morello, Wilk', 291291, 9506571, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
		VALUES (111, 'Money', 12, 1, 5, 'Berry Gordy, Jr. and Janie Bradford', 147591, 2365897, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
		VALUES (112, 'Long Tall Sally', 12, 1, 5, 'Enotris Johnson and Little Richard and Robert "Bumps" Blackwell', 106396, 1707084, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
		VALUES (123, 'Quadrant', 13, 1, 2, 'Billy Cobham', 261851, 8538199, .99)
		/* Snoopy's had an ' in the name should it be there */
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
		VALUES (124, 'Snoopys search-Red baron', 13, 1, 2, 'Billy Cobham', 456071, 15075616, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Milliseconds, Bytes, UnitPrice)
		VALUES (131, 'Intro/ Low Down', 14, 1, 3, 323683, 10642901, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Milliseconds, Bytes, UnitPrice)
		VALUES (132, '13 Years Of Grief', 14, 1, 3, 246987, 8137421, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Milliseconds, Bytes, UnitPrice)
		VALUES (144, 'Heart Of Gold', 15, 1, 3,  194873, 6417460, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Milliseconds, Bytes, UnitPrice)
		VALUES (145, 'Snowblind', 15, 1, 3, 420022, 13842549, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Milliseconds, Bytes, UnitPrice)
		VALUES (149, 'Black Sabbath', 16, 1, 3, 382066, 12440200, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Milliseconds, Bytes, UnitPrice)
		VALUES (150, 'The Wizard', 16, 1, 3, 264829, 8646737, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
		VALUES (156, 'Wheels Of Confusion - The Straightener', 17, 1, 3, 'Tony Iommi, Bill Ward, Geezer Butler, Ozzy Osbourne', 494524, 16065830, .99)
	/* Tomorrow's */
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
		VALUES (157, 'Tomorrows Dream', 17, 1, 3, 'Tony Iommi, Bill Ward, Geezer Butler, Ozzy Osbourne', 192496, 6252071, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
		VALUES (403, 'Bumbo Da Mangueira', 34, 1, 7, 'Various', 270158, 9073350, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
		VALUES (404, 'Mr Funk Samba', 34, 1, 7, 'Various', 213890, 7102545, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Milliseconds, Bytes, UnitPrice)
		VALUES (3389, 'Revelations', 271, 2, 23, 252376, 4111051, .99)
	INTO Track (TrackId, Name, AlbumId, MediaTypeId, GenreId, Milliseconds, Bytes, UnitPrice)
		VALUES (3390, 'One and the Same', 271, 2, 23, 217732, 3559040, .99)
SELECT 1 FROM DUAL;

/* SELECT * FROM Track; */
