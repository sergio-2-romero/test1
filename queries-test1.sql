USE sakila;

SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM film_actor;
SELECT * FROM language;


-- Inside sakila db modify 2 film records values
UPDATE film SET rating = 'NC-17' WHERE film_id = 1 OR film_id = 2;


-- List of movies by actor
SELECT film_actor.actor_id, actor.first_name, actor.last_name, film.title
FROM film_actor
LEFT JOIN film
ON film_actor.film_id = film.film_id
LEFT JOIN actor
ON film_actor.actor_id = actor.actor_id
ORDER BY actor_id;


-- Count number of movies per actor
SELECT actor_id, COUNT(*) FROM film_actor GROUP BY actor_id;


-- Count movie languages
SELECT COUNT(*) FROM language;
SELECT COUNT(DISTINCT language_id) FROM film;


-- Calculate average cost for replacement of a film
SELECT AVG(replacement_cost) FROM film;


-- Do a store procedure to update the film
DELIMITER //
CREATE PROCEDURE update_film_rental_duration (IN id SMALLINT, IN duration TINYINT)
BEGIN
	UPDATE film SET rental_duration = duration WHERE film_id = id;
END //
DELIMITER ;

CALL update_film_rental_duration(3, 4);
