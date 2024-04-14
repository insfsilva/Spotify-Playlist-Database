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