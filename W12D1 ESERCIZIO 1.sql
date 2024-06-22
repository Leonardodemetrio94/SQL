-- 1. effettuare una esplorazione preliminare del database. di cosa si tratta? quante e quali tabelle contiene? fate in modo di avere un'idea abbastanza chiara riguardo a con cosa state lavorando
SHOW TABLES FROM SAKILA;
SELECT * FROM actor;
SELECT * FROM address;
SELECT * FROM category;
SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM customer;
SELECT * FROM film;
SELECT * FROM film_actor;
SELECT * FROM film_category;
SELECT * FROM film_text;
SELECT * FROM inventory;
SELECT * FROM language;
SELECT * FROM payment;
SELECT * FROM rental;
SELECT * FROM staff;
SELECT * FROM store;


-- 2. scoprite quanti clienti si sono registrati nel 2006
SELECT COUNT(C.customer_id)
FROM customer C
WHERE YEAR(C.create_date) = "2006";


-- 3. trovate il numero totale di noleggi effettuati il giorno 1/1/2006
SELECT COUNT(R.rental_id)
FROM rental R
WHERE R.rental_date = "2006-01-01";


-- 4. elencate tutti i film noleggiati nell'ultima settimana e tutte le informazioni legate al cliente che li ha noleggiati
SELECT F.title, C.*,R.rental_date
FROM film F LEFT JOIN inventory I ON F.film_id=I.film_id
LEFT JOIN rental R ON I.inventory_id=R.inventory_id
LEFT JOIN customer C ON R.customer_id=C.customer_id
WHERE DATEDIFF("2006-02-14", DATE(R.rental_date)) < 7;


-- 5. calcolate la durata media del noleggio per ogni categoria di film
SELECT C.name, AVG (DATEDIFF(R.return_date,R.rental_date))
FROM rental R LEFT JOIN inventory I ON R.inventory_id=I.inventory_id
LEFT JOIN film F ON I.film_id=F.film_id
LEFT JOIN  film_category FC ON F.film_id=FC.film_id
LEFT JOIN category C ON FC.category_id=C.category_id 
GROUP BY C.name;



-- 6. trovate la durata del noleggio più lungo
select MAX(DATEDIFF(R.return_date,R.rental_date))
FROM rental AS R;