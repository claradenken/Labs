## wednesday

############
## SUBQ 1 ##
############    
-- step 1: calculate the average
select avg(amount) from bank.loan;

-- step 2 --> pseudo code the main goal of this step ....
select * from bank.loan
	where amount > 151410.1760
;

-- step 3 ... create the query
select * from bank.loan
	where amount > (
	  select avg(amount) from sakila.payment
      );


-- step 4 - Prettify the result. Let's find top 10 such customers
select * from bank.loan
	where amount > (select avg(amount)
	from bank.loan)
	order by amount desc
	limit 10;
    
    
    
############
## SUBQ 2 ##
############    

select * from (
  select account_id, bank_to, account_to, round(sum(amount),2) as Total
	  from bank.order
	  group by account_id, bank_to, account_to
	)  as sub1
where Total > 10000;

## child query
select account_id, bank_to, account_to, round(sum(amount),2) as Total
  from bank.order
  group by account_id, bank_to, account_to;
  

############
## SUBQ 3 ##
############  
select * from bank.trans
	where k_symbol in (
		select k_symbol from (
			select avg(amount) as Average, k_symbol
				from bank.order
				where k_symbol <> ' '
				group by k_symbol
				having Average > 3000
				order by Average desc
		  ) as sub1
	);


## child 2
select avg(amount) as Average, k_symbol from bank.order
	where k_symbol <> ' ' 
	group by k_symbol
	#having Average > 3000
	order by Average desc;
    
## child 1
select k_symbol from (
	select avg(amount) as Average, k_symbol from bank.order
		where k_symbol <> ' '
		group by k_symbol
		having Average > 3000
		order by Average desc 
	) as sub1;
    
    

############
## SUBQ 4 ##
############ 
select k_symbol from (  									 ##1
  select avg(amount) as mean, k_symbol from bank.order		 ##2
	  where bank_to in (
		select bank											 ##3
			from (
			  select bank, avg(amount) as Average				 ##4
				  from bank.trans
				  where bank <> ''
				  group by bank
				  having Average > 5500
			) as sub1
	  )
  and k_symbol <> ' '
  group by k_symbol
  having mean > 2000
	) sub;


## child 3 
select bank, avg(amount) as Average from bank.trans
	where bank <> ''
	group by bank
	having Average > 5500;
    
    
## child 2
select bank
	from (
	  select bank, avg(amount) as Average
		  from bank.trans
		  where bank <> ''
		  group by bank
		  having Average > 5500
	) whatever;


select * from bank.order;

## child 1
select * from bank.order;
select avg(amount) as mean, k_symbol from bank.order		 ##2
  where bank_to in (
	select bank											 ##3
	from (
	  select bank, avg(amount) as Average				 ##4
		  from bank.trans
		  where bank <> ''
		  group by bank
		  having Average > 5500
	) sub1
  )
  and k_symbol <> ' '
  group by k_symbol
  having mean > 2000;


############
## SUBQ 5 ##
############ 
select * from bank.trans;

select operation, round(avg(balance),2) as Avg_balance from bank.trans  ##1
	where k_symbol in (
	  select k_symbol as symbol from (									##2
		select avg(amount) as Average, k_symbol							##3
			from bank.order
				where k_symbol <> ' '
				group by k_symbol
				having Average > 3000
				order by Average desc
	  ) as sub1
	)
	group by operation
	order by Avg_balance
	limit 5;
    
    
## child 2
select avg(amount) as Average, k_symbol							
	from bank.order
		where k_symbol <> ' '
		group by k_symbol
		having Average > 3000
		order by Average desc;


## child 1
select k_symbol as symbol from (									
	select avg(amount) as Average, k_symbol							
		from bank.order
			where k_symbol <> ' '
			group by k_symbol
			having Average > 3000
			order by Average desc
	) as sub1;
    
    
############
## SUBQ 1 ##
############ 
select * from bank.loan
	where amount > (
	  select avg(amount)
	  from bank.loan
      );

## create variables 
set @my_variable := (
	  select avg(amount)
	  from bank.loan
      );

select * from bank.loan
	where amount > @my_variable;
    
    
############
## SUBQ 2 ##
############ 
## subquery
select * from (
  select account_id, bank_to, account_to, round(sum(amount),2) as Total
  from bank.order
  group by account_id, bank_to, account_to
)  as sub1
where Total > 10000;


CREATE TEMPORARY TABLE my_table 
  select account_id, bank_to, account_to, round(sum(amount),2) as Total
  from bank.order
  group by account_id, bank_to, account_to
;

select * from my_table
	where Total>10000;

use sakila;
CREATE TEMPORARY TABLE new_tbl2  
	select account_id, bank_to, account_to, round(sum(amount),2) as Total
    from bank.order
    group by account_id, bank_to, account_to;

