-- 1. RECUPERARE TUTTE LE TRACCE CHE ABBIANO GENERE POP O ROCK
SELECT T.Name AS TRACCIA, G.Name AS GENERE
FROM track T LEFT JOIN  genre G ON T.GenreId=G.GenreId 
WHERE G.Name IN ( "POP","ROCK");

-- 2.1 ELENCARE TUTTI GLI ARTISTI E GLI ALBUM CHE INIZIANO CON LA LETTERA A
SELECT AR.Name AS ARTISTA, AL.Title AS ALBUM
FROM artist AR LEFT JOIN album AL  ON AR.ArtistId=AL.ArtistId
WHERE AR.Name LIKE "A%" AND AL.Title LIKE "A%";
-- 2.1 ELENCARE TUTTI GLI ARTISTI O GLI ALBUM CHE INIZIANO CON LA LETTERA A
SELECT AR.Name AS ARTISTA, AL.Title AS ALBUM
FROM artist AR LEFT JOIN album AL  ON AR.ArtistId=AL.ArtistId
WHERE AR.Name LIKE "A%" OR AL.Title LIKE "A%";


-- 3. ELENCARE TUTTE LE TRACCE CHE HANNO COME GENERE JAZZ O CHE DURANO MENO DI 3 MINUTI
SELECT T.Name AS TRACCIA, G.Name AS GENERE, T.Milliseconds/60000
FROM track T LEFT JOIN  genre G ON T.GenreId=G.GenreId
WHERE G.Name LIKE "JAZZ" OR T.Milliseconds/60000 < 3;

-- 4. RECUPERARE TUTTE LE TRACCE PIù LUNGHE DELLA DURATA MEDIA
SELECT T.Name AS TRACCIA, CAST((T.Milliseconds)/60000 AS DECIMAL(5,3)) AS DURATA_MIN
FROM track T
WHERE CAST((T.Milliseconds)/60000 AS DECIMAL(5,3)) > (SELECT CAST(AVG(T.Milliseconds)/60000 AS DECIMAL(5,2)) 
FROM track T);

-- 5. INDIVIDUARE I GENERI CHE HANNO TRACCE CON UNA DURATA MEDIA MAGGIORE DI 4 MINUTI
SELECT G.Name AS GENERE, CAST(AVG(T.Milliseconds)/60000 AS DECIMAL(5,3)) AS DURATA_MIN
FROM  genre G LEFT JOIN track T ON G.GenreId=T.GenreId
GROUP BY G.Name
HAVING CAST(AVG(T.Milliseconds)/60000 AS DECIMAL(5,3)) > 4
ORDER BY CAST(AVG(T.Milliseconds)/60000 AS DECIMAL(5,3));

-- 6. INDIVIDUARE GLI ARTISTI CHE HANNO RILASCIATO PIù DI UN ALBUM
SELECT AR.Name AS ARTISTA, COUNT(AL.AlbumId)
FROM artist AR LEFT JOIN album AL  ON AR.ArtistId=AL.ArtistId
GROUP BY AR.Name
HAVING COUNT(AL.AlbumId)>1
ORDER BY COUNT(AL.AlbumId);

-- 7. TROVARE LA TRACCIA PIù LUNGA IN OGNI ALBUM
SELECT B.TITLE, B.NAME, A.DURATA/1000
FROM(
SELECT AL.ALBUMID, max(milliseconds) AS DURATA
FROM TRACK T
LEFT JOIN ALBUM AL ON T.ALBUMID=AL.ALBUMID
LEFT JOIN ARTIST AR ON AL.ARTISTID=AR.ARTISTID
GROUP BY  AL.ALBUMID) A 
LEFT JOIN(    SELECT AL.TITLE, AL.ALBUMID, MILLISECONDS, T.NAME
            FROM TRACK T
            LEFT JOIN ALBUM AL ON T.ALBUMID=AL.ALBUMID
            LEFT JOIN ARTIST AR ON AL.ARTISTID=AR.ARTISTID ) B ON A.ALBUMID=B.ALBUMID AND A.DURATA=B.MILLISECONDS;


-- 8. INDIVIDUARE LA DURATA MEDIA DELLE TRACCE PER OGNI ALBUM
SELECT AL.Title AS ALBUM, CAST(AVG(T.Milliseconds)/60000 AS DECIMAL(5,3))
FROM track T LEFT JOIN album AL ON T.AlbumId=AL.AlbumId
GROUP BY AL.Title;

-- 9. INDIVIDUARE GLI ALBUM CHE HANNO PIù DI 20 TRACCE E MOSTRATE IL NOME DELL'ALBUM E IL NUMERO DI TRACCE IN ESSO CONTENUTE

SELECT AL.Title AS ALBUM, COUNT(T.Name) AS NUMERO_TRACCE 
FROM album AL LEFT JOIN track T ON AL.AlbumId=T.AlbumId
GROUP BY AL.Title
HAVING COUNT(T.Name) > 20
ORDER BY COUNT(T.Name);

