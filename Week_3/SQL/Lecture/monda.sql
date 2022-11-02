## OPEN THE TABLES
select * from sakila.actor;

use sakila;
select * from actor;

select distinct release_year from sakila.film;

select date from bank.loan
	order by date desc;

select count(loan_id), date, duration from bank.loan
where date between 971200  and 971231
group by date, duration ;


#1) BASIC FUNCTIONS
select actor_id, first_name from sakila.actor
	where actor_id>5 and actor_id <10
    limit 5;

## SLIDE 4 
SELECT * from bank.loan;
select (amount - payments) as balance from bank.loan;

SELECT 
    (amount - payments)/1000 AS 'Balance in thousands'
    FROM bank.loan;
    
SELECT 10%3 as remainder;

SELECT duration%2 FROM bank.loan;
select * from bank.loan;

## SLIDE 5 - 6
SELECT * FROM bank.loan
	WHERE status NOT IN ('B', 'b') AND amount <> 100000;

SELECT * FROM bank.loan
WHERE amount > 100000 AND amount < 200000;

SELECT * FROM bank.district;

SELECT distinct A2 FROM bank.district;

SELECT distinct A2 as whatever, a4 FROM bank.district
WHERE  A2 IN ('Benesov','Beroun') or A4 < 75000
LIMIT 10;

## SLIDE 8
SELECT DISTINCT A3 FROM bank.district;

SELECT distinct A2, A4 FROM bank.district
	WHERE A2 IN ('Benesov','Beroun') or A4 < 75000
	LIMIT 10;

SELECT * FROM bank.account
	WHERE district_id IN (1,2,3,4,5);
    
    
    
# 2) AGGREGATION 
SELECT A4 FROM bank.district;

SELECT SUM(A4) FROM bank.district;

SELECT A4, a2 FROM bank.district 
	ORDER BY A4 desc;

SELECT distinct A2, A4 FROM bank.district
	WHERE  A2 IN ('Benesov','Beroun') OR A4 < 75000
	ORDER BY A4
	LIMIT 10;


SELECT 
	max(amount), 
	min(amount),
    amount
    FROM bank.order;

SELECT distinct A2 FROM bank.district;

SELECT max(amount) FROM bank.order;
SELECT floor(avg(amount)) as "smth" FROM bank.order  ;

SELECT ceiling(avg(amount)) FROM bank.order;

SELECT * FROM bank.order;
SELECT *, LENGTH(k_symbol) AS 'symbol_length' FROM bank.order;


SELECT * FROM bank.order;
SELECT *, CONCAT(order_id, k_symbol) AS 'concat' FROM bank.order;
SELECT *, CONCAT(order_id, "-", account_id) AS ‘concat’ FROM bank.order;

SELECT *, LOWER(A2), UPPER(A3) FROM bank.district;

SELECT A3, RTRIM(A3) FROM bank.district;

#SELECT *, LEFT(A2, 2), A3, FROM bank.district;  A3 REDUNDANDT
SELECT a2, LEFT(A2, 4) as new_col FROM bank.district;

SELECT A3, RTRIM(A3) FROM bank.district;

SELECT SUBSTRING('Hello world',7,2) as my_name;
SELECT SUBSTRING('Hello world',7);
SELECT SUBSTRING_INDEX('www.google.com', '.', 1);  # select string from websites/mails (?)

## LIKE
SELECT distinct a3 FROM bank.district;


SELECT a2, a3 FROM bank.district
	WHERE A3 LIKE 'north%';
    
SELECT a2, a3 FROM bank.district
	WHERE A3 LIKE '%bo%';
#https://www.w3schools.com/sql/sql_like.asp
 
select * from bank.loan; 
 
 
## REGEX
SELECT * FROM bank.district 
	WHERE A2 regexp '^B';

SELECT * FROM bank.district 
	WHERE A2 regexp 'ov$';

SELECT distinct k_symbol FROM bank.order 
	WHERE k_symbol regexp 'ip|is';


## GROUP BY
select status, avg(amount) from bank.loan
	group by status;
    
select avg(amount) as Average, status from bank.loan
	group by status
	order by Average asc;

select type, operation, k_symbol, round(avg(balance),2) as Average
	from bank.trans
	where k_symbol <> '' and k_symbol <> ' ' and operation <> ''
	group by type, operation, k_symbol;

select * from bank.trans;

select type, operation, k_symbol, round(avg(balance),2) as Average
	from bank.trans
	where k_symbol <> '' and k_symbol <> ' ' and  operation <> ''
	group by type, operation, k_symbol
	having Average > 30000
    order by type, operation, k_symbol;


select round(avg(amount),2) - round(avg(payments),2) as Avg_Balance, status, duration
	from bank.loan
	group by status, duration
	having Avg_Balance > 100000
	order by duration, status;
