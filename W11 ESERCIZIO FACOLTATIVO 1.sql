-- 1. ANALISI ESPLORATIVA DEL DATABASE 
-- ELENCO DELLE PRIME 10 RIGHE DELLA TABELLA ALBUM
SELECT *
FROM album
LIMIT 10;
-- TROVARE IL NUMERO TATALE DI CANZONI NELLA TABELLA TRACKS
SELECT COUNT(TrackId)
FROM track ;
-- TROVARE I DIVERSI GENERI PRESENTI NELLA TABELLA GENERE
SELECT DISTINCT Name
FROM genre;

-- 2. RECUPERARE IL NOME DI TUTTE LE TRACCE E DEL GENERE ASSOCIATO
SELECT DISTINCT(T.Name) , G.Name
FROM track T LEFT JOIN  genre G ON T.GenreId=G.GenreId;

-- 3. RECUPERARE IL NOME DI TUTTI GLI ARTISTI CHE HANNO ALMENO UN ALBUM NEL DATABASE.
SELECT AR.Name AS ARTISTA, AL.Title AS TITOLO
FROM artist AR LEFT JOIN album AL ON  AR.ArtistId=AL.ArtistId;
-- ESISTONO ARTISTI SENZA ALBUM NEL DATABASE?
SELECT AR.Name AS ARTISTA, AL.Title AS TITOLO
FROM artist AR LEFT JOIN album AL ON  AR.ArtistId=AL.ArtistId
WHERE AL.Title IS NULL;

-- 4. RECUPERARE IL NOME DI TUTTE LE TRACCE, DEL GENERE ASSOCIATO E DELLA TIPOLOGIA DI MEDIA.
SELECT T.Name AS TITOLO, G.Name AS GENERE, T.MediaTypeId AS TIPOLOGIA_DI_MEDIA
FROM track T LEFT JOIN  genre G ON T.GenreId=G.GenreId;
-- ESISTE UN MODO PER RECUPERARE IL NOME DELLA TIPOLOGIA DI MEDIA?
SELECT M.Name AS NOME_TIPOLOGIA_DI_MEDIA, T.Name AS TITOLO, G.Name AS GENERE
FROM track T LEFT JOIN  genre G ON T.GenreId=G.GenreId LEFT JOIN mediatype M ON T.MediaTypeId=M.MediaTypeId;

-- 5. ELENCATE I NOMI DI TUTTI GLI ARTISTI E DEI LORO ALBUM
SELECT AR.Name AS ARTISTA, AL.Title AS ALBUM
FROM   artist AR LEFT JOIN album AL ON AR.ArtistId=AL.ArtistId;
