use sakila;

#1 	Which actor has appeared in the most films?
SELECT count(film_actor.actor_id) as n_films, first_name, last_name FROM actor 
JOIN film_actor using(actor_id)
GROUP BY film_actor.actor_id
order by n_films desc
limit 1;

#2 	Most active customer (the customer that has rented the most number of films)
select count(rental.customer_id) as n_rentals, first_name, last_name from customer
join rental using(customer_id)
group by rental.customer_id
order by n_rentals desc
limit 1;

#3 	List number of films per category
select name, count(film_category.category_id) from category
join film_category using(category_id)
group by film_category.category_id;

#4 	Display the first and last names, as well as the address, of each staff member
select first_name, last_name, address.address from staff
join address using(address_id);

#5 	Get films titles where the film language is either English or italian, 
# 	and whose titles starts with letter "M" , sorted by title descending.
select f.title, l.name as language from film as f
join language as l using(language_id)
where f.title like 'M%' and l.name in ('English', 'Italian');

#6	Display the total amount rung up by each staff member in August of 2005.
select concat(first_name, " ", last_name) as name, sum(p.amount) as total_amount from staff
join payment as p using(staff_id)
where p.payment_date like '2005_08%'
group by staff_id;

#7 	List each film and the number of actors who are listed for that film.
select title, count(fa.actor_id) as n_actors from film
join film_actor as fa using(film_id)
group by film_id
order by n_actors desc;

#8 	Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
#	List the customers alphabetically by last name.
select c.first_name, c.last_name, sum(amount) as total_paid_by_customer from payment
join customer as c using(customer_id)
group by c.customer_id
order by c.last_name;

#9	Write sql statement to check if you can find any actor who never participated in any film.
SELECT concat(a.first_name," ",a.last_name) as name, count(fa.film_id) as n_films from actor as a
left join film_actor as fa using(actor_id)
group by a.actor_id having n_films=0;

#10	Get the addresses that has NO customers, and ends with the letter "e".
select address, c.customer_id  from address
left join customer as c using(address_id)
where address like '%e' and c.customer_id is null;

# (Optional) 
# What is the most rented film?
select title, count(f.film_id) as 'times_rented' 
from film f
join inventory i using(film_id)
join rental r using(inventory_id)
group by title 
order by times_rented desc
limit 2;