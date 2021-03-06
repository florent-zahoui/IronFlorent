#1 How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT COUNT(*) FROM sakila.inventory 
WHERE film_id = (SELECT film_id FROM sakila.film 
WHERE title = "Hunchback Impossible");
#2 List all films whose length is longer than the average of all the films.
SELECT * FROM sakila.film
WHERE length > ( SELECT AVG(length) FROM sakila.film) ;
#3 Use subqueries to display all actors who appear in the film Alone Trip.
SELECT first_name,last_name FROM sakila.actor
WHERE actor_id IN (SELECT actor_id FROM sakila.film_actor
WHERE film_id = (SELECT film_id FROM sakila.film 
WHERE title = "Alone Trip"));
#4 Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
SELECT title FROM sakila.film 
WHERE film_id in (SELECT film_id FROM sakila.film_category 
WHERE category_id = (SELECT category_id FROM sakila.category
WHERE name = "Family"));
#5 Get name and email from customers from Canada using subqueries. 
SELECT first_name,last_name,email FROM sakila.customer
WHERE address_id in (SELECT address_id FROM sakila.address
WHERE city_id in (SELECT city_id FROM sakila.city 
WHERE country_id = (SELECT country_id FROM sakila.country
WHERE country = "Canada")));
#5b Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
SELECT first_name,last_name,email FROM sakila.customer AS a
INNER JOIN sakila.address AS b ON a.address_id = b.address_id
INNER JOIN sakila.city AS c ON b.city_id = c.city_id
INNER JOIN sakila.country AS d ON c.country_id = d.country_id
WHERE country = "Canada";
#6 Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
SELECT title from sakila.film WHERE 
film_id in (SELECT film_id from sakila.film_actor WHERE
actor_id = (SELECT actor_id FROM sakila.film_actor
GROUP BY actor_id
ORDER BY COUNT(film_id) DESC
LIMIT 1));
#7 Films rented by most profitable customer. You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments (I have 44 titles returned but 45 film_id in the inventory, I need to correct the discrepancy.)
SELECT title from sakila.film WHERE 
film_id IN (SELECT film_id  FROM sakila.inventory WHERE
inventory_id IN (SELECT inventory_id FROM sakila.rental WHERE 
customer_id = (SELECT customer_id FROM sakila.payment
GROUP BY customer_id
ORDER BY sum(amount) DESC
LIMIT 1)));
# Customers who spent more than the average payments.
SELECT customer_id FROM sakila.payment GROUP BY customer_id HAVING sum(amount) > 
(SELECT avg(customer_payments) as average from (SELECT sum(amount) as customer_payments,customer_id FROM sakila.payment
GROUP BY customer_id) derived_table_name);

