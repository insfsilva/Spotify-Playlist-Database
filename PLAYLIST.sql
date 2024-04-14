DROP TABLE IF EXISTS 
  USER, 
  GENRE, 
  ARTIST, 
  ALBUM, 
  TRACK,
  TRACK_ARTIST, 
  FOLLOWS_USER,
  FOLLOWS_ARTIST,
  NUM_TEL;

CREATE TABLE USER
(
  UserId VARCHAR(64) NOT NULL,
  Username VARCHAR(64) NOT NULL,
  LCountry VARCHAR(64) NOT NULL,
  LState VARCHAR(22) NOT NULL,
  LCity VARCHAR(64) NOT NULL,
  Email VARCHAR(64),
  PRIMARY KEY(UserId)
);

CREATE TABLE GENRE
(
  GenreId VARCHAR(64) NOT NULL,
  GenreName VARCHAR(64) NOT NULL,
  PRIMARY KEY(GenreId),
  UNIQUE(GenreName)
);

CREATE TABLE ARTIST
(
  ArtistId VARCHAR(64) NOT NULL, 
  ArtistName VARCHAR(64) NOT NULL,
  ArtistPopularity INT NOT NULL,
  PRIMARY KEY(ArtistId)
);

CREATE TABLE ALBUM
(
  AlbumId VARCHAR(64) NOT NULL,
  AlbumName VARCHAR(64) NOT NULL,
  AlbumReleaseDate DATE NOT NULL,
  AlbumPopularity INT NOT NULL,
  TotalTracks INT NOT NULL,
  GenreId VARCHAR(64) NOT NULL,
  ArtistId VARCHAR(64) NOT NULL,
  PRIMARY KEY(AlbumId),
  FOREIGN KEY(GenreId) REFERENCES GENRE(GenreId),
  FOREIGN KEY(ArtistId) REFERENCES ARTIST(ArtistId)
);

CREATE TABLE TRACK
(
  TrackId VARCHAR(64) NOT NULL,
  TrackName VARCHAR(64) NOT NULL,
  TrackDuration TIME NOT NULL,
  TrackPopularity INT NOT NULL,
  AlbumId VARCHAR(64) NOT NULL,
  ArtistId VARCHAR(64) NOT NULL,
  PRIMARY KEY(TrackId),
  FOREIGN KEY(AlbumId) REFERENCES ALBUM(AlbumId),
  FOREIGN KEY(ArtistId) REFERENCES ARTIST(ArtistId)
);

CREATE TABLE TRACK_ARTIST
(
  TrackId VARCHAR(64) NOT NULL,
  ArtistId VARCHAR(64) NOT NULL,
  PRIMARY KEY(TrackId, ArtistId),
  FOREIGN KEY(TrackId) REFERENCES TRACK(TrackId),
  FOREIGN KEY(ArtistId) REFERENCES ARTIST(ArtistId)
);

CREATE TABLE FOLLOWS_USER 
(
  IdFollower VARCHAR(64) NOT NULL,
  IdFollows VARCHAR(64) NOT NULL,
  PRIMARY KEY(IdFollower, IdFollows), 
  FOREIGN KEY(IdFollower) REFERENCES USER(UserId),
  FOREIGN KEY(IdFollows) REFERENCES USER(UserId)
);

CREATE TABLE FOLLOWS_ARTIST
(
  UserId VARCHAR(64) NOT NULL,
  ArtistId VARCHAR(64) NOT NULL,
  PRIMARY KEY(UserId, ArtistId),
  FOREIGN KEY(UserId) REFERENCES USER(UserId),
  FOREIGN KEY(ArtistId) REFERENCES ARTIST(ArtistId)
);

CREATE TABLE NUM_TEL
(
  UserId VARCHAR(64) NOT NULL,
  NumTel INT,
  PRIMARY KEY(UserId),
  FOREIGN KEY(UserId) REFERENCES USER(UserId)
);

INSERT INTO USER(UserId, Username, LCountry, LState, LCity, Email) 
VALUES
('e0f90acf72e9495b93922df9', 'Renatha', 'Brasil', 'São Paulo', 'São Paulo', 'vieira54@gmail.com'),
('5ea1900166fe4029a1521f0f', 'Ines','Portugal', 'Porto', 'Porto', 'silva23@gmail.com'),
('7e5db649bcdc49b5a9a3e173', 'Ravi', 'India', 'Goa', 'Goa', 'ravi@gmail.com'),
('d55919987c754070a6ed725c', 'Akira', 'Japao', 'Osaka', 'Osaka', 'akira@gmail.com'),
('d2ed5000d8e34fefbfaef605', 'Joao', 'Portugal', 'Lisboa', 'Lisboa', 'joao56@gmail.com'),
('4266fa7da1ce4c0aa0a15e8a', 'Nicole', 'USA', 'Washington', 'Washington', 'nicole25@hotmail.com'), 
('8c9df35de7204a16a9ee8c2c', 'John', 'USA', 'Texas', 'Texas', 'johnny67@gmail.com');

INSERT INTO GENRE(GenreId, GenreName)
VALUES
('7fxpqs4G8vj3rFYbJnsG7w', 'Alternative Rock'),
('0YMzPd9mYx4txOuCnhYUGU', 'Acid Rock'),
('7FRfYOql61DGDp9VPPe2qA', 'Alternative Metal'),
('4tmy6FB76bR5eLmx0zO1mn', 'Adult Standards'),
('6yMGxqKj0218mFR5KqsMRq', 'Classic Soul'),
('4Tw2N3wdvJPGEU7JqMxFfE', 'Album Rock'), 
('1SKApv6ZfJ9bkUxeRObJEF', 'New Wave Pop');

INSERT INTO ARTIST(ArtistId, ArtistName, ArtistPopularity)
VALUES
('7yCGrS6Xh3UngvY6Ad5sMJ', 'L7', 46),
('22WZ7M8sxp5THdruNY3gXt', 'The Doors', 71),
('64tNsm6TnZe2zpcMVMOoHL', 'Alice In Chains', 70),
('52lBOxCxbJg0ttXEW9CQpW', 'Louis Prima', 59),
('1eYhYunlNJlDoQhtYBvPsi', 'Ray Charles', 67),
('22CIOfLZB9z8He7WgHYAgH', 'Eddie Money', 56), 
('19ra5tSw0tWufvUp8GotLo', 'Ladies And Gentlemen... The Best Of George Michael', 72);

INSERT INTO ALBUM(AlbumId, AlbumName, AlbumReleaseDate, GenreId, ArtistId, AlbumPopularity, TotalTracks)
VALUES
('0z7Dc7FRsDH7E4kj32mKyM', 'Bricks Are Heavy', '1992-01-01', '7fxpqs4G8vj3rFYbJnsG7w', '7yCGrS6Xh3UngvY6Ad5sMJ', 57, 10),
('75bLu4Ung5QbMdJYxx7wTI', 'The Soft Parade', '1969-07-21', '0YMzPd9mYx4txOuCnhYUGU', '22WZ7M8sxp5THdruNY3gXt', 62, 12),
('58NXIEYqmq5dQHg9nV9duM', 'Dirt (2022 Remaster)', '1992-09-29', '7FRfYOql61DGDp9VPPe2qA', '64tNsm6TnZe2zpcMVMOoHL', 77, 13),
('5RDBugAE4cU2vbLZj0dvmf', 'The Call Of The Wildest (Expanded Edition)', '1957-01-01', '4tmy6FB76bR5eLmx0zO1mn', '52lBOxCxbJg0ttXEW9CQpW', 61, 8),
('0cw6Sv7IwZ87aLPPvNPSd0', 'Ray Charles', '2011-09-20', '6yMGxqKj0218mFR5KqsMRq', '1eYhYunlNJlDoQhtYBvPsi', 43, 14),
('24WAUPqhxqUbdbcRDHQ8Yr', 'The Essential Eddie Money', '1977-01-01', '4Tw2N3wdvJPGEU7JqMxFfE', '22CIOfLZB9z8He7WgHYAgH', 37, 11), 
('3coLNlyStg9h7f8CZ103Rl', 'Ladies And Gentlemen... The Best Of George Michael', '1998-11-09', '1SKApv6ZfJ9bkUxeRObJEF', '19ra5tSw0tWufvUp8GotLo', 79, 15);

INSERT INTO TRACK(TrackId, TrackName, TrackDuration, TrackPopularity, AlbumId, ArtistId)
VALUES
('7fxpqs4G8vj3rFYbJnsG7w', 'Shitlist', '02:55', 55, '0z7Dc7FRsDH7E4kj32mKyM', '7yCGrS6Xh3UngvY6Ad5sMJ'),
('0YMzPd9mYx4txOuCnhYUGU', 'The Soft Parade', '08:34', 46, '75bLu4Ung5QbMdJYxx7wTI', '22WZ7M8sxp5THdruNY3gXt'),
('7FRfYOql61DGDp9VPPe2qA', 'Down In A Hole', '05:38', 68, '58NXIEYqmq5dQHg9nV9duM', '64tNsm6TnZe2zpcMVMOoHL'),
('4tmy6FB76bR5eLmx0zO1mn', 'Pennies From Heaven', '02:21', 69, '5RDBugAE4cU2vbLZj0dvmf', '52lBOxCxbJg0ttXEW9CQpW'),
('6yMGxqKj0218mFR5KqsMRq', 'Georgia on My Mind', '03:35', 51, '0cw6Sv7IwZ87aLPPvNPSd0', '1eYhYunlNJlDoQhtYBvPsi'),
('22CIOfLZB9z8He7WgHYAgH', 'Two Tickets To Paradise', '03:57', 39, '24WAUPqhxqUbdbcRDHQ8Yr', '22CIOfLZB9z8He7WgHYAgH'), 
('1SKApv6ZfJ9bkUxeRObJEF', 'Freedom! 90', '06:28', 63, '3coLNlyStg9h7f8CZ103Rl', '19ra5tSw0tWufvUp8GotLo');


INSERT INTO TRACK_ARTIST(Trackid, ArtistId)
VALUES
('7fxpqs4G8vj3rFYbJnsG7w', '7yCGrS6Xh3UngvY6Ad5sMJ'),
('0YMzPd9mYx4txOuCnhYUGU', '22WZ7M8sxp5THdruNY3gXt'),
('7FRfYOql61DGDp9VPPe2qA', '64tNsm6TnZe2zpcMVMOoHL'),
('4tmy6FB76bR5eLmx0zO1mn', '52lBOxCxbJg0ttXEW9CQpW'),
('6yMGxqKj0218mFR5KqsMRq', '1eYhYunlNJlDoQhtYBvPsi'),
('22CIOfLZB9z8He7WgHYAgH', '22CIOfLZB9z8He7WgHYAgH'), 
('1SKApv6ZfJ9bkUxeRObJEF', '19ra5tSw0tWufvUp8GotLo');

 
INSERT INTO FOLLOWS_USER(IdFollower, IdFollows)
VALUES('e0f90acf72e9495b93922df9', '5ea1900166fe4029a1521f0f'),
('5ea1900166fe4029a1521f0f', 'e0f90acf72e9495b93922df9'),
('7e5db649bcdc49b5a9a3e173', '4266fa7da1ce4c0aa0a15e8a'),
('d55919987c754070a6ed725c','d2ed5000d8e34fefbfaef605'),
('d2ed5000d8e34fefbfaef605',  '5ea1900166fe4029a1521f0f'),
('4266fa7da1ce4c0aa0a15e8a', '8c9df35de7204a16a9ee8c2c'), 
('8c9df35de7204a16a9ee8c2c', 'e0f90acf72e9495b93922df9');


INSERT INTO FOLLOWS_ARTIST(UserId, ArtistId)
 VALUES('e0f90acf72e9495b93922df9', '7yCGrS6Xh3UngvY6Ad5sMJ'),
 ('5ea1900166fe4029a1521f0f', '22WZ7M8sxp5THdruNY3gXt'),
 ('7e5db649bcdc49b5a9a3e173', '22CIOfLZB9z8He7WgHYAgH'),
 ('d55919987c754070a6ed725c', '52lBOxCxbJg0ttXEW9CQpW'),
 ('d2ed5000d8e34fefbfaef605', '19ra5tSw0tWufvUp8GotLo'),
 ('4266fa7da1ce4c0aa0a15e8a', '22WZ7M8sxp5THdruNY3gXt'), 
 ('8c9df35de7204a16a9ee8c2c', '22WZ7M8sxp5THdruNY3gXt');


INSERT INTO NUM_TEL(UserId, NumTel)
VALUES
('e0f90acf72e9495b93922df9', 934684954),
('7e5db649bcdc49b5a9a3e173', 969785678),
('d55919987c754070a6ed725c', 934657899), 
('5ea1900166fe4029a1521f0f', NULL),
('d2ed5000d8e34fefbfaef605', NULL),
('4266fa7da1ce4c0aa0a15e8a', 936729748), 
('8c9df35de7204a16a9ee8c2c', NULL);

SELECT A.ArtistName, COUNT(F.UserId) 
AS 'Numero de Seguidores' 
FROM ARTIST A, FOLLOWS_ARTIST F 
WHERE A.ArtistId=F.ArtistId 
GROUP BY ArtistName;

SELECT F.UserId, U.Username
FROM FOLLOWS_ARTIST F
JOIN USER U ON F.UserId = U.UserId
WHERE F.ArtistId = '22WZ7M8sxp5THdruNY3gXt';

SELECT A.ArtistName, G.GenreName 
FROM ARTIST A 
JOIN ALBUM AL ON A.ArtistId = AL.ArtistId
JOIN GENRE G ON AL.GenreId = G.GenreId 
ORDER BY ArtistName;

SELECT U.LCountry
FROM FOLLOWS_ARTIST F
JOIN USER U ON F.UserId = U.UserId
WHERE F.ArtistId = '22WZ7M8sxp5THdruNY3gXt';

INSERT INTO GENRE (GenreId, GenreName)
VALUES ('4dneV7C1yDt9UtyxrQY375', 'New Wave');

INSERT INTO ARTIST (ArtistId, ArtistName, ArtistPopularity)
VALUES ('7bu3H8JO7d0UbMoVzbo70s', 'The Cure', 74);

INSERT INTO ALBUM (AlbumId, AlbumName, AlbumReleaseDate, GenreId, ArtistId, AlbumPopularity, TotalTracks)
VALUES ('7gPql7GFpBMOxeO80vMMsC', 'Three Imaginary Boys', '1979-05-11', '4dneV7C1yDt9UtyxrQY375', '7bu3H8JO7d0UbMoVzbo70s', 75, 16);

INSERT INTO TRACK (TrackId, TrackName, TrackDuration, TrackPopularity, AlbumId, ArtistId)
VALUES ('4dneV7C1yDt9UtyxrQY375', 'Boys Dont Cry', '02:35', 82, '7gPql7GFpBMOxeO80vMMsC', '7bu3H8JO7d0UbMoVzbo70s');

INSERT INTO USER (UserId, Username, LCountry, LCity, LState, Email)
VALUES
('81577b198dea4af78cb23e36', 'Maria', 'Portugal', 'Vila-Real', 'Vila-Real' , 'mariafk@gmail.com');

INSERT INTO NUM_TEL (UserId, NumTel)
VALUES
('81577b198dea4af785623e36', 934683954);