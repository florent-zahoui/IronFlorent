#1 Write a query to display for each store its store ID, city, and country.Write a query to display for each store its store ID, city, and country.
select store_id,city,country from sakila.store as a
inner join sakila.address as l on a.address_id = l.address_id
inner join sakila.city as b on l.city_id = b.city_id 
inner join sakila.country as d on b.country_id = d.country_id
group by store_id ;
#2 Write a query to display how much business, in dollars, each store brought in.
select a.store_id,sum(amount) from sakila.store as a
inner join sakila.inventory as l on a.store_id = l.store_id
inner join sakila.rental as b on l.inventory_id = b.inventory_id
inner join sakila.payment as d on b.rental_id = d.rental_id
group by a.store_id ;
#3 What is the average running time(length) of films by category?
select avg(length),name from sakila.film as a
inner join sakila.film_category as l on a.film_id = l.film_id
inner join sakila.category as b on l.category_id = b.category_id
group by name ;
#4 Which film categories are longest(length)? (Hint: You can rely on question 3 output.)
select avg(length),name from sakila.film as a
inner join sakila.film_category as l on a.film_id = l.film_id
inner join sakila.category as b on l.category_id = b.category_id
group by name 
order by avg(length) desc;
#5 Display the most frequently(number of times) rented movies in descending order.
select count(rental_id),title from sakila.film as a
inner join sakila.inventory as l on a.film_id = l.film_id
inner join sakila.rental as b on l.inventory_id = b.inventory_id
group by title 
order by count(rental_id) desc;
#6 List the top five genres in gross revenue in descending order.
# payment to rental to inventory to film_category to category
select sum(amount),name from sakila.category as a
inner join sakila.film_category as b on a.category_id = b.category_id
inner join sakila.inventory as c on b.film_id = c.film_id
inner join sakila.rental as d on c.inventory_id = d.inventory_id
inner join sakila.payment as e on d.rental_id = e.rental_id
group by name
order by sum(amount) desc
limit 5;
#7 Is "Academy Dinosaur" available for rent from Store 1?
select * from sakila.category as a
inner join sakila.film_category as b on a.category_id = b.category_id
inner join sakila.film as f on b.film_id = f.film_id
inner join sakila.inventory as c on b.film_id = c.film_id
where title = "ACADEMY DINOSAUR";