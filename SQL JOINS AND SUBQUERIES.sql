--  1

select first_name, last_name,address.district
from customer 
inner join address 
on customer.address_id = address.address_id
where district = 'Texas'

-- 2

select first_name,last_name , payment.amount 
from customer 
inner join payment 
on customer.customer_id = payment.customer_id
where payment.amount > 6.99

-- 3 incomeplete
select first_name, last_name 
from customer
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id 
	having sum(amount) > 175
	order by sum(amount) desc
	);
	
	
	
	--4

select customer.first_name, customer.last_name, country
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
full join country on city.country_id = country.country_id 
where country = 'Nepal'

--5

select count(staff_id), salesperson.first_name
from payment
inner join salesperson
on payment.staff_id = salesperson.salesperson_id
group by salesperson.first_name 

-- 6

select count(rating), rating
from film
group by rating 

--7

select first_name, last_name 
from customer
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id 
	having sum(amount) > 6.99
	order by sum(amount) desc
	);



--8
select count(rental_id)
from rental
where rental_id in(
select rental.rental_id
from rental 
left join payment 
on payment.rental_id = rental.rental_id 
where payment.rental_id is null);







