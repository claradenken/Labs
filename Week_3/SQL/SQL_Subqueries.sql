use sakila;

# 1	
# List all films whose length is longer than the average of all the films.
select title from film
where length > (select avg(length) from film);

# 2
# How many copies of the film Hunchback Impossible exist in the inventory system?
select count(inventory_id) from inventory
where film_id = (
	select film_id from film
	where title="HUNCHBACK IMPOSSIBLE"
);

# 3 
# Use subqueries to display all actors who appear in the film Alone Trip.
select concat(first_name, " ", last_name) as actor from actor
where actor_id in (
	select actor_id from film_actor
	where film_id = (
		select film_id from film
		where title="ALONE TRIP"
	) 
);

#4 
# Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
# Identify all movies categorized as family films.
select title from film
where film_id in ( 
	select film_id from film_category
	where category_id = (
		select category_id from category
		where name="Family"
	)
);

# 5
# (i) Get name and email from customers from Canada using subqueries. 
select concat(first_name, " ", last_name) as Name, Email from customer
where address_id in (
	select address_id from address
	where city_id in (
		select city_id from city
		where country_id in (
			select country_id from country
			where country="Canada"
		)
	)
);

# (ii) # Do the same with joins. 
# Note that to create a join, you will have to identify the correct tables with 
# their primary keys and foreign keys, that will help you get the relevant information.
select concat(first_name, " ", last_name) as Name, Email from customer
join address using(address_id)
join city using(city_id)
join country using(country_id)
where country="Canada";

# 6
# Which are films starred by the most prolific actor? 
# Most prolific actor is defined as the actor that has acted in the most number of films. 
# First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
select title from film
where film_id in (
	select film_id from film_actor
	where actor_id = (
		select actor_id from film_actor
		group by actor_id
		order by count(film_id) desc
		limit 1
	)
);

# 7
# Films rented by most profitable customer. You can use the customer table and payment table to find 
# the most profitable customer, i.e. the customer that has made the largest sum of payments.
# why 44 rows when the first child has 45 rows?
select title from film 
where film_id in (
	select film_id from inventory
	where inventory_id in (
		select inventory_id from rental
		where rental_id in (
			select rental_id from rental
			where customer_id = (
				select customer_id from payment
				group by customer_id
				order by sum(amount) desc
				limit 1
			)
		)
	)
);

# 8
# Customers who spent more than the average payments
# (this refers to the average of all amount spent per each customer).
# wrong output
select concat(first_name, " ", last_name) from customer
where customer_id in (
	select customer_id from (
		select customer_id, avg(amount) as cust_avg from payment
		group by customer_id
	) as t_alias
    where cust_avg >(select avg(amount) from payment)
)
order by first_name;

# correct output (question unclear)
SELECT first_name, last_name							#--> give customer name of customer_id if customer_id in list of customer_ids below
FROM customer
WHERE customer_id IN 
	(SELECT customer_id 								#--> give list of customer_ids where total amount spent by customer > average of total amount spent by customer
    FROM 												
		(SELECT customer_id, sum(amount) AS s 			# --> give total amount spent by customer (OUTER)
        FROM payment									
		GROUP BY customer_id
        ) AS sub WHERE s > 								#--> filter total spent amount by customer (OUTER) bigger than average of total amount spent by customer (from INNER)
			(SELECT avg(summe) FROM 					#--> give average of total amount spent by customer
				(SELECT sum(amount) AS summe 			#--> give total amount spent by customer (INNER)
                FROM payment							
				GROUP BY customer_id
				) AS sub2
			)
	)
    order by first_name;

/*
SELECT avg(summe) FROM (
SELECT sum(amount) AS summe FROM payment
GROUP BY customer_id
) AS sub2;
SELECT customer_id, sum(amount) FROM payment
GROUP BY customer_id
ORDER BY sum(amount) DESC;
*/