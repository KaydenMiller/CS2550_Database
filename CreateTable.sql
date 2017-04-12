-- DROP TABLE <TableName> deletes the table

/* Create the Movie table */
CREATE TABLE Movie
(
	MovieID Number(5,0),
	MovieTitle VarChar2(255) NOT NULL,
	ReleaseDate Date NOT NULL,
	Actor_1 Number(6, 0) NOT NULL,
	Actor_2 Number(6, 0),
	Actor_3 Number(6, 0),
	Director Number(5, 0) NOT NULL,
	Producer Number(5, 0) NOT NULL,
	Genre Number(3, 0) NOT NULL,
	RunTime Number(3, 0) NOT NULL
);

/* Create the Actor table */
CREATE TABLE Actor
(
	ActorID Number(6, 0),
	FirstName VarChar2(255) NOT NULL,
	LastName VarChar2(255) NOT NULL
);

/* Create the Director table */
CREATE TABLE Director
(
	DirectorID Number(5, 0),
	FirstName VarChar2(255) NOT NULL,
	LastName VarChar2(255) NOT NULL 
);

/* Create the Producer table */
CREATE TABLE Producer
(
	ProducerID Number(5, 0),
	FirstName VarChar2(255) NOT NULL,
	LastName VarChar2(255) NOT NULL
);

/* Create the Genre table */
CREATE TABLE Genre
(
	GenreID Number(3, 0),
	GenreName VarChar2(25)
);

/* Create Primary Keys */
ALTER TABLE Movie
	ADD CONSTRAINT PK_Movie PRIMARY KEY (MovieID);
	
ALTER TABLE Actor
	ADD CONSTRAINT PK_Actor PRIMARY KEY (ActorID);
	
ALTER TABLE Director
	ADD CONSTRAINT PK_Director PRIMARY KEY (DirectorID);
	
ALTER TABLE Producer
	ADD CONSTRAINT PK_Producer PRIMARY KEY (ProducerID);

ALTER TABLE Genre
	ADD CONSTRAINT PK_Genre PRIMARY KEY (GenreID);
	
/* Create Foreign Keys */
ALTER TABLE Movie
	ADD CONSTRAINT FK_Actor_1_Actor_ActorID FOREIGN KEY (Actor_1) REFERENCES Actor(ActorID);
ALTER TABLE Movie
	ADD CONSTRAINT FK_Actor_2_Actor_ActorID FOREIGN KEY (Actor_2) REFERENCES Actor(ActorID);
ALTER TABLE Movie
	ADD CONSTRAINT FK_Actor_3_Actor_ActorID FOREIGN KEY (Actor_3) REFERENCES Actor(ActorID);
ALTER TABLE Movie
	ADD CONSTRAINT FK_Director_DirectorID FOREIGN KEY (Director) REFERENCES Director(DirectorID);
ALTER TABLE Movie
	ADD CONSTRAINT FK_Producer_ProducerID FOREIGN KEY (Producer) REFERENCES Producer(ProducerID);
ALTER TABLE Movie
	ADD CONSTRAINT FK_Genre_GenreID FOREIGN KEY (Genre) REFERENCES Genre(GenreID);
	
/* Delete the Tables */
DROP TABLE Movie;
DROP TABLE Actor;
DROP TABLE Producer;
DROP TABLE Director;
DROP TABLE Genre;
