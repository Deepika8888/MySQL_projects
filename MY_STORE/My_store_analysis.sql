use my_store;

#Questions
#1. Find the total sales (total_amount) for each customer.

select Customer_id, sum(total_amount) as total_sales
from orders 
group by customer_id;

#lets do this by showing their names

select c.customer_id, c.first_name, c.last_name, sum(o.total_amount) as total_sales
from Customers c
join Orders o on c.customer_id = o.customer_id
group by c.customer_id, c.first_name, c.last_name;

#2. Calculate the average quantity of products sold per product.
select
  p.product_id,
  p.product_name,
  AVG(od.quantity) AS avg_quantity
FROM Order_Details AS od
JOIN Products AS p 
  ON p.product_id = od.product_id
GROUP BY p.product_id, p.product_name
ORDER BY p.product_id;

#3. List all customers whose total orders exceed 50,000.
select c.customer_id, c.first_name, c.last_name
from Customers c
join Orders o on c.customer_id = o.customer_id 
where o.total_amount > 50000;

#4 Find products that have been sold more than 100 times in total.

select p.product_name
from Products p
join Order_Details od on p.product_id = od.product_id
group by p.product_name, p.product_id
having sum(od.quantity) > 100;


#5 Retrieve all orders along with the customer name and order date.
select o.order_id, c.first_name, c.last_name, o.order_date
from Customers c 
join Orders o on o.customer_id = c.customer_id;

#6 Show all order details including product name, order ID, quantity, and price.

select p.product_name, od.order_id, od.quantity, od.price 
from Products p
join Order_Details od on p.product_id = od.product_id;

#7 List employees along with their department name.

select e.employee_id, e.first_name, e.last_name, d.department_name 
from Employees e
join department d on e.department_id = d.department_id;

#lets learn some sub-queries

#8 Find products that are more expensive than the average product price.

select product_name, price
from Products 
where price > (select avg(price) from Products);

#9 List customers who have purchased the most expensive product.

select distinct c.customer_id, c.first_name, c.last_name
from Customers c
join Orders o on c.customer_id = o.customer_id
join Order_Details od on o.order_id = od.order_id
join Products p on od.product_id = p.product_id
where p.price = (select MAX(price) from Products);

#using window functions/ranking
#10 Rank products based on total quantity sold.
select p.product_id, p.product_name, sum(od.quantity) as total_quantity_sold
from Products p 
join Order_Details od on p.product_id = od.product_id
group by p.product_id, p.product_name
order by total_quantity_sold desc;

#11 Rank customers based on total spending.
select c.first_name, c.last_name, sum(od.quantity * od.price) as total_spending 
from Customers c
join orders o on c.customer_id = o.customer_id 
join Order_details od on o.order_id = od.order_id
group by c.first_name, c.last_name
order by total_spending desc;

#lets do some combined/advanced questions

#12 Find total sales per department by summing orders handled by employees in each department.

select d.department_name,
SUM(od.quantity * od.price) AS total_sales
from department d
join products p on p.department_id = d.department_id
join Order_Details od on od.product_id = p.product_id
group by d.department_name
order by total_sales DESC;























