#1 Which actor has appeared in the most films? ANSWER : GINA DEGENERES
select count(film_id),a.actor_id,first_name,last_name from sakila.film_actor as a inner join sakila.actor as l on a.actor_id = l.actor_id group by a.actor_id order by count(film_id) desc;
#2 Most active customer (the customer that has rented the most number of films) ANSWER : ELEANOR HUNT
select count(rental_id),a.customer_id,first_name,last_name from sakila.customer as a inner join sakila.rental as l on a.customer_id = l.customer_id group by a.customer_id order by count(rental_id) desc;
#3 List number of films per category. ANSWER : SPORTS
select count(film_id),a.category_id,name from sakila.film_category as a inner join sakila.category as l on a.category_id = l.category_id group by a.category_id order by count(film_id) desc;
#4 Display the first and last names, as well as the address, of each staff member.
select a.address_id,address,first_name,last_name from sakila.staff as a inner join sakila.address as l on a.address_id = l.address_id;
#5 Display the total amount rung up by each staff member in August of 2005.
select sum(amount),staff_id from sakila.payment where payment_date like "2005-08%" group by staff_id;
#6 List each film and the number of actors who are listed for that film.
select a.film_id,count(actor_id) from sakila.film as a inner join sakila.film_actor as l on a.film_id = l.film_id group by a.film_id;
#7 Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name. Bonus: Which is the most rented film? The answer is Bucket Brotherhood This query might require using more than one join statement. Give it a try.
select sum(amount),a.customer_id, first_name,last_name from sakila.payment as a inner join sakila.customer as l on a.customer_id = l.customer_id group by customer_id order by last_name;
select count(rental_id),b.film_id,a.inventory_id,title from sakila.rental as a inner join sakila.inventory as l on a.inventory_id = l.inventory_id inner join sakila.film as b on b.film_id = l.film_id group by b.film_id order by count(rental_id) desc ;