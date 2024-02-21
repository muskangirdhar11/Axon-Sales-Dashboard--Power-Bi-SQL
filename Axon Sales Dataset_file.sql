use classicmodels
show tables;
#Q1. Order numbers and total sales from 2003 until 2005 which order status is finished
Select YEAR(orderdate) Year,
SUM(priceeach * quantityordered) Sales, COUNT(ordernumber) Num_orders
FROM orders
JOIN orderdetails using(ordernumber)
GROUP BY YEAR(orderdate);


#Q2.show the product name along with their buying price and filter them from highest to lowest
select productName,buyPrice 
from products 
order by buyprice desc;

#Q3. A.Find number of customer and s
-- B.the order total for the status 'shipped' group them by year
select count(customerNumber)
from customers ;

SELECT  YEAR(orderdate) Year,
COUNT(DISTINCT(customerNumber)) Num_Customers,Count(ordernumber) Num_Orders_Shipped
FROM orders
WHERE status = 'shipped'
GROUP BY 1;

#Q4. find the name of the product with whose max quantity sold.
select ProductName,o.quantityOrdered 
from products p
join orderdetails o
using(productcode)
order by quantityOrdered desc
limit 1;

#Q5. Find the customer Number,name of the customer along with thier number of orders made by them.
-- the given code showing there are multiple products ordered by one customer--> repeated customers

select customernumber,ordernumber
FROM payments
JOIN orders using(customernumber)
-- 

SELECT customernumber,CONCAT(contactFirstName,' ',contactLastName) Name,COUNT(ordernumber) num_orders
FROM orders
JOIN customers using(customernumber)
WHERE status = 'shipped'
GROUP BY 1,2
HAVING 3>1
ORDER BY 3 DESC;

 #Q6The number of new customers for each year
 
 select count(customerNumber) as Num_customers,year(orderdate)
 as year
 from orders
 group by year;
 
 SELECT Year_Acquired Year, COUNT(*) Num_NewCustomers
FROM (SELECT customernumber,MIN(YEAR(orderdate)) Year_Acquired
FROM orders
GROUP BY 1) new_customers
GROUP BY Year_Acquired
UNION 
SELECT 2005,0 ;
