#Query 1 querying
select * from customers

#Query 1 querying part 2
select * from orders o 

#Query 2 sorting
select * from customers c order by customerName 

#Query 2 sorting part 2
select * from orders o order by customerNumber  

#Query 3 filtering
select 
customerNumber
, customerName
, phone
, addressLine1
, city
, country
, creditLimit
from customers c 
where salesRepEmployeeNumber > 1600
order by customerNumber 

#Query 3 filtering part 2
select customerNumber, customerName, contactFirstName, contactLastName, phone, creditLimit from customers c 
where contactLastName like "K%"
and creditLimit > 50000

#Query 3 filtering part 3
select * from orders o 
where orderDate between '2003-01-01' and '2003-01-31'

#Query 4 join
select 
c.customerName
, c.contactLastName
, c.contactFirstName
, c.phone
, c.creditLimit
, o.orderDate
, o.requiredDate
, o.shippedDate
, o.status
from customers c
inner join orders o on o.customerNumber = c.customerNumber 

#Query 4 join part 2
select 
c.customerName
, c.phone
, c.creditLimit
, o.orderDate 
, o.status
, p.paymentDate 
, p.amount 
from customers c
left join payments p on p.customerNumber = c.customerNumber
left join orders o on o.customerNumber = c.customerNumber
order by c.customerNumber 

#Query 4 join part 3
select 
c.customerName
, c.contactLastName
, c.contactFirstName
, c.phone
, c.creditLimit
, o.orderDate
, o.requiredDate
, o.shippedDate
, o.status
from customers c
inner join orders o on o.customerNumber = c.customerNumber
where creditLimit > 100000 
and shippedDate between "2003=05-01" and "2003-05-10" 

#Query 5 agregate
select 
customerName
, count(*)
from customers c 
inner join orders o on o.customerNumber = c.customerNumber 
group by c.customerName 

#Query 5 agregate part 2
select 
c.customerName
, c.phone
, c.creditLimit
, o.orderDate
, o.requiredDate
, o.shippedDate
, o.status
, avg(p.amount) 
from customers c
inner join orders o on o.customerNumber = c.customerNumber
left join payments p on p.customerNumber = c.customerNumber 
where shippedDate between "2003=05-01" and "2003-05-10" 
group by 
c.customerName
, c.phone
, c.creditLimit
, o.orderDate
, o.requiredDate
, o.shippedDate
, o.status

#Query 6 DDL alter table
select * from payments p 

alter table payments 
add methodePayment varchar(255)

#Query 6 DDL alter table drop column
select * from offices

alter table offices 
drop column methodePayment

#Query 7 Indexing
select * from employees e 

create index jobTitle on employees(jobTitle)




