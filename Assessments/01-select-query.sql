
#================================= Module 4 – SQL for Data Analytics =============================================================
#================================= Section A — Concept Application ===============================================================
#================================= Session - 01 ==================================================================================
/*
SCENARIO
You are a data analyst at a food delivery platform. The operations team needs a report
showing which restaurant partners earned more than Rs 1,00,000 in total revenue last
month — but only for restaurants that received at least 50 orders.

Question:
Explain how you would use GROUP BY and HAVING together to produce this report.
Why is HAVING more appropriate than WHERE for filtering on aggregated values? What would
break in your query if you replaced HAVING with WHERE?

*/

use assignmentpractice;
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    restaurant_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO orders
(order_id, restaurant_id, order_date, total_amount)
VALUES
(1,101,'2026-10-01',2500),
(2,101,'2026-10-02',2200),
(3,101,'2026-10-03',2100),
(4,101,'2026-10-04',2300),
(5,101,'2026-10-05',2400),
(6,101,'2026-10-06',2000),
(7,101,'2026-10-07',2500),
(8,101,'2026-10-08',2200),
(9,101,'2026-10-09',2100),
(10,101,'2026-10-10',2300),
(11,101,'2026-10-11',2400),
(12,101,'2026-10-12',2000),
(13,101,'2026-10-13',2500),
(14,101,'2026-10-14',2200),
(15,101,'2026-10-15',2100),
(16,101,'2026-10-16',2300),
(17,101,'2026-10-17',2400),
(18,101,'2026-10-18',2000),
(19,101,'2026-10-19',2500),
(20,101,'2026-10-20',2200),
(21,101,'2026-10-21',2100),
(22,101,'2026-10-22',2300),
(23,101,'2026-10-23',2400),
(24,101,'2026-10-24',2000),
(25,101,'2026-10-25',2500),
(26,101,'2026-10-26',2200),
(27,101,'2026-10-27',2100),
(28,101,'2026-10-28',2300),
(29,101,'2026-10-29',2400),
(30,101,'2026-10-30',2000),
(31,101,'2026-10-01',2500),
(32,101,'2026-10-02',2200),
(33,101,'2026-10-03',2100),
(34,101,'2026-10-04',2300),
(35,101,'2026-10-05',2400),
(36,101,'2026-10-06',2000),
(37,101,'2026-10-07',2500),
(38,101,'2026-10-08',2200),
(39,101,'2026-10-09',2100),
(40,101,'2026-10-10',2300),
(41,101,'2026-10-11',2400),
(42,101,'2026-10-12',2000),
(43,101,'2026-10-13',2500),
(44,101,'2026-10-14',2200),
(45,101,'2026-10-15',2100),
(46,101,'2026-10-16',2300),
(47,101,'2026-10-17',2400),
(48,101,'2026-10-18',2000),
(49,101,'2026-10-19',2500),
(50,101,'2026-10-20',2200),
(51,102,'2026-10-01',6000),
(52,102,'2026-10-02',6500),
(53,102,'2026-10-03',7000),
(54,102,'2026-10-04',7500),
(55,102,'2026-10-05',8000),
(56,102,'2026-10-06',8500),
(57,102,'2026-10-07',9000),
(58,102,'2026-10-08',9500),
(59,102,'2026-10-09',10000),
(60,102,'2026-10-10',10500),
(61,102,'2026-10-11',11000),
(62,102,'2026-10-12',11500),
(63,102,'2026-10-13',12000),
(64,102,'2026-10-14',12500),
(65,102,'2026-10-15',13000),
(66,103,'2026-10-01',1000),
(67,103,'2026-10-02',1200),
(68,103,'2026-10-03',1100),
(69,103,'2026-10-04',1300),
(70,103,'2026-10-05',1000),
(71,103,'2026-10-06',1200),
(72,103,'2026-10-07',1100),
(73,103,'2026-10-08',1300),
(74,103,'2026-10-09',1000),
(75,103,'2026-10-10',1200),
(76,103,'2026-10-11',1100),
(77,103,'2026-10-12',1300),
(78,103,'2026-10-13',1000),
(79,103,'2026-10-14',1200),
(80,103,'2026-10-15',1100),
(81,103,'2026-10-16',1300),
(82,103,'2026-10-17',1000),
(83,103,'2026-10-18',1200),
(84,103,'2026-10-19',1100),
(85,103,'2026-10-20',1300),
(86,103,'2026-10-21',1000),
(87,103,'2026-10-22',1200),
(88,103,'2026-10-23',1100),
(89,103,'2026-10-24',1300),
(90,103,'2026-10-25',1000),
(91,103,'2026-10-26',1200),
(92,103,'2026-10-27',1100),
(93,103,'2026-10-28',1300),
(94,103,'2026-10-29',1000),
(95,103,'2026-10-30',1200),
(96,103,'2026-10-01',1100),
(97,103,'2026-10-02',1300),
(98,103,'2026-10-03',1000),
(99,103,'2026-10-04',1200),
(100,103,'2026-10-05',1100),
(101,103,'2026-10-06',1300),
(102,103,'2026-10-07',1000),
(103,103,'2026-10-08',1200),
(104,103,'2026-10-09',1100),
(105,103,'2026-10-10',1300),
(106,103,'2026-10-11',1000),
(107,103,'2026-10-12',1200),
(108,103,'2026-10-13',1100),
(109,103,'2026-10-14',1300),
(110,103,'2026-10-15',1000),
(111,103,'2026-10-16',1200),
(112,103,'2026-10-17',1100),
(113,103,'2026-10-18',1300),
(114,103,'2026-10-19',1000),
(115,103,'2026-10-20',1200);


DROP TABLE IF EXISTS restaurants;
CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    city VARCHAR(50),
    cuisine VARCHAR(50)
);
INSERT INTO restaurants
(restaurant_id, restaurant_name, city, cuisine)
VALUES
(101, 'Mehfil Restaurant', 'Hyderabad', 'Biryani'),
(102, 'Pizza Palace', 'Mumbai', 'Italian'),
(103, 'Food Corner', 'Pune', 'Chinese'),
(104, 'Spice Garden', 'Bangalore', 'South Indian');

SELECT
    r.restaurant_id,
    r.restaurant_name,
    r.city,
    r.cuisine,
    SUM(o.total_amount) AS total_revenue,
    COUNT(o.order_id) AS total_orders
FROM restaurants AS r
INNER JOIN orders AS o
    ON r.restaurant_id = o.restaurant_id
WHERE o.order_date >= date_format(now() - interval 1 month,"%Y-%m-01")
  AND o.order_date < date_format(now(),"%Y-%m-01")
GROUP BY
    r.restaurant_id,
    r.restaurant_name,
    r.city,
    r.cuisine
HAVING
    SUM(o.total_amount) > 100000
    AND COUNT(o.order_id) >= 50;

#===========================================
SELECT
    r.restaurant_id,
    r.restaurant_name,
    r.city,
    r.cuisine,
    SUM(o.total_amount) AS total_revenue,
    COUNT(o.order_id) AS total_orders
FROM restaurants AS r
INNER JOIN orders AS o
    ON r.restaurant_id = o.restaurant_id
WHERE o.order_date >= date_format(now() - interval 1 month,"%Y-%m-%d")
  AND o.order_date < date_format(now(),"%Y-%m-%d")
GROUP BY
    r.restaurant_id,
    r.restaurant_name,
    r.city,
    r.cuisine
HAVING
    SUM(o.total_amount) > 100000
    AND COUNT(o.order_id) >= 50;

/*
Why use GROUP BY?
- GROUP BY combines rows belonging to the same restaurant.
- WHERE filters individual rows before grouping, whereas HAVING filters groups after aggregation.
- Consider the sql execution order => FROM => WHERE => GROUP BY => HAVING => SELECT

What happens if we replace HAVING with WHERE?
*/

SELECT
    restaurant_id,
    SUM(total_amount) AS total_revenue,
    COUNT(order_id) AS total_orders
FROM orders
WHERE SUM(total_amount) > 100000
GROUP BY restaurant_id;
/*
- MySQL will return an error because aggregate functions such as SUM() cannot be used in the WHERE clause at that stage of query execution.
- The groups have not been created yet, so MySQL cannot calculate and filter their total revenue.
- WHERE COUNT(order_id) >= 50
-You must use HAVING for these aggregate conditions.
*/


/*
#=======================================================================================================================================
#=================================================================SCENARIO 2=============================================================
#========================================================================================================================================
SCENARIO:
You are building a customer insights report for a food delivery app. The marketing team
needs a list of every registered customer and their most recent order details — even for
customers who have never placed an order.

Question:
 Which type of JOIN would you use to ensure all customers appear in the result,
including those with no orders? Justify your choice by comparing it with INNER JOIN, and explain
specifically what data would be lost if INNER JOIN were used instead.
*/

use assignmentpractice;
-- Customers table
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    email VARCHAR(100),
    registration_date DATE
);

-- Orders table
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    order_status VARCHAR(30),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

INSERT INTO customers
(customer_id, customer_name, city, email, registration_date)
VALUES
(1, 'Rahul Sharma', 'Mumbai', 'rahul@gmail.com', '2026-01-10'),
(2, 'Priya Patel', 'Pune', 'priya@gmail.com', '2026-02-15'),
(3, 'Amit Verma', 'Delhi', 'amit@gmail.com', '2026-03-20'),
(4, 'Sneha Shah', 'Bangalore', 'sneha@gmail.com', '2026-04-05'),
(5, 'Rohit Kumar', 'Hyderabad', 'rohit@gmail.com', '2026-05-12'),
(6, 'Neha Joshi', 'Mumbai', 'neha@gmail.com', '2026-06-18'),
(7, 'Karan Mehta', 'Pune', 'karan@gmail.com', '2026-07-22'),
(8, 'Anjali Desai', 'Chennai', 'anjali@gmail.com', '2026-08-11'),
(9, 'Vikas Singh', 'Delhi', 'vikas@gmail.com', '2026-09-01'),
(10, 'Pooja Nair', 'Kochi', 'pooja@gmail.com', '2026-10-15');


INSERT INTO orders
(order_id, customer_id, order_date, total_amount, order_status)
VALUES
(101, 1, '2026-11-01', 500, 'Delivered'),
(102, 1, '2026-11-05', 800, 'Delivered'),
(103, 1, '2026-11-12', 1200, 'Delivered'),
(104, 2, '2026-11-02', 600, 'Delivered'),
(105, 2, '2026-11-10', 900, 'Delivered'),
(106, 4, '2026-11-03', 700, 'Delivered'),
(107, 4, '2026-11-13', 900, 'Delivered'),
(108, 5, '2026-11-04', 1500, 'Delivered'),
(109, 6, '2026-11-06', 450, 'Cancelled'),
(110, 6, '2026-11-14', 750, 'Delivered'),
(111, 8, '2026-11-07', 1100, 'Delivered'),
(112, 8, '2026-11-15', 1300, 'Delivered'),
(113, 9, '2026-11-09', 850, 'Delivered');

SELECT * FROM customers;
SELECT * FROM orders;


SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date,
    o.total_amount
FROM customers AS c
LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id;
    
/*
Notice that Amit verma, karan mehta and Pooja nair appears even though he has never placed an order.
*/
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date,
    o.total_amount
FROM customers AS c
 JOIN orders AS o
    ON c.customer_id = o.customer_id;
/*
- Now only the customers who have placed order will be listed using inner join. Inner join will list only 
The matching field from both tables.
I will select LEFT JOIN because the customers table is my primary table, and I need 
every registered customer in the report. LEFT JOIN preserves all customer records and returns NULL for order details when no matching order exists. 
If I used INNER JOIN, customers who have never placed an order would be excluded, resulting in incomplete customer insights
*/

#=============================================================================================================================================================
#======================================================== SCENARIO - 3 ========================================================================================
#==============================================================================================================================================================
/*
SCENARIO
You are designing a delivery performance dashboard. The business wants to identify
delivery agents whose average delivery time is faster than the overall platform average,
without using a temporary table or creating a new view.

Question:
Describe how you would write a subquery to find these agents. What type of
subquery is most appropriate here — scalar, row, or table — and why? What would happen if you
tried to place this subquery in the SELECT clause instead of the WHERE clause?

*/

use assignmentpractice;

DROP TABLE IF EXISTS delivery_agents;
CREATE TABLE delivery_agents (
    agent_id INT PRIMARY KEY,
    agent_name VARCHAR(100),
    city VARCHAR(50),
    joining_date DATE
);

DROP TABLE IF EXISTS deliveries;
CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY,
    agent_id INT,
    order_id INT,
    delivery_date DATE,
    delivery_time INT,
    delivery_status VARCHAR(30),
    FOREIGN KEY (agent_id)
    REFERENCES delivery_agents(agent_id)
);

INSERT INTO delivery_agents
(agent_id, agent_name, city, joining_date)
VALUES
(101, 'Rahul Sharma', 'Mumbai', '2025-01-10'),
(102, 'Priya Patel', 'Pune', '2025-02-15'),
(103, 'Amit Verma', 'Delhi', '2025-03-20'),
(104, 'Sneha Shah', 'Bangalore', '2025-04-05'),
(105, 'Rohit Kumar', 'Hyderabad', '2025-05-12'),
(106, 'Neha Joshi', 'Mumbai', '2025-06-18');


INSERT INTO deliveries
(delivery_id, agent_id, order_id, delivery_date,
 delivery_time, delivery_status)
VALUES

(1,101,1001,'2026-11-01',20,'Delivered'),
(2,101,1002,'2026-11-02',25,'Delivered'),
(3,101,1003,'2026-11-03',30,'Delivered'),
(4,101,1004,'2026-11-04',25,'Delivered'),


(5,102,1005,'2026-11-01',40,'Delivered'),
(6,102,1006,'2026-11-02',45,'Delivered'),
(7,102,1007,'2026-11-03',50,'Delivered'),
(8,102,1008,'2026-11-04',45,'Delivered'),


(9,103,1009,'2026-11-01',30,'Delivered'),
(10,103,1010,'2026-11-02',35,'Delivered'),
(11,103,1011,'2026-11-03',40,'Delivered'),
(12,103,1012,'2026-11-04',35,'Delivered'),

(13,104,1013,'2026-11-01',50,'Delivered'),
(14,104,1014,'2026-11-02',55,'Delivered'),
(15,104,1015,'2026-11-03',60,'Delivered'),
(16,104,1016,'2026-11-04',55,'Delivered'),

(17,105,1017,'2026-11-01',25,'Delivered'),
(18,105,1018,'2026-11-02',30,'Delivered'),
(19,105,1019,'2026-11-03',35,'Delivered'),
(20,105,1020,'2026-11-04',30,'Delivered'),

(21,106,1021,'2026-11-01',35,'Delivered'),
(22,106,1022,'2026-11-02',40,'Delivered'),
(23,106,1023,'2026-11-03',45,'Delivered'),
(24,106,1024,'2026-11-04',40,'Delivered');


/*
- FIRST WE WILL CALCULATE THE AVERAGE OF ALL THE DELIVERY
*/

SELECT
	AVG(delivery_time)AS avg_delivery_time
    FROM deliveries;
    
#This is the average delivery time across all 24 deliveries.

SELECT
	da.agent_id,
    da.agent_name,
    da.city,
    avg(d.delivery_time)as agent_avg_time
from delivery_agents as da
inner join deliveries as d
on da.agent_id = d.agent_id
where d.delivery_status  = "Delivered"
group by
	da.agent_id,
    da.agent_name,
    da.city
having agent_avg_time < (SELECT
	AVG(delivery_time)AS avg_delivery_time
    FROM deliveries where delivery_status="Delivered");
    
/*
- This query will list the agent with the average delivery times below the platform average of 38.33 minutes.
- The correct choice is a Scalar Subquery.A scalar subquery returns exactly one value (one row and one column).

SELECT AVG(delivery_time)
FROM deliveries
WHERE delivery_status = 'Delivered';

- If we use the subquery in select it will display platform average can return all the agents and used to show the additional information
SELECT
    da.agent_id,
    da.agent_name,
    AVG(d.delivery_time) AS agent_avg_time,

    (
        SELECT AVG(delivery_time)
        FROM deliveries
        WHERE delivery_status = 'Delivered'
    ) AS platform_avg_time
*/

#=========================================================================================================================================================
#============================================================= SCENARIO - 4 ================================================================================
#==========================================================================================================================================================
/*
SCENARIO:-
You are analysing order data for a food delivery company. The product team wants to
rank the top 3 highest-revenue restaurants within each city. Two restaurants in Surat
have the exact same revenue figure and you must decide how to number them.

Question:-
Compare RANK() and DENSE_RANK() window functions for this use case. Which would
you choose and why? Provide a brief example showing how each function would number three
restaurants where two share the same revenue, and explain the practical impact of that
difference on the product team's report.

give me the create and insert query
*/
use assignmentpractice;
DROP TABLE IF EXISTS restaurants;
CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    city VARCHAR(50),
    total_revenue DECIMAL(12,2)
);
INSERT INTO restaurants
(restaurant_id, restaurant_name, city, total_revenue)
VALUES

(101, 'Mehfil Restaurant', 'Surat', 250000),
(102, 'Spice Garden', 'Surat', 200000),
(103, 'Food Palace', 'Surat', 200000),
(104, 'Royal Kitchen', 'Surat', 180000),
(105, 'Pizza Hub', 'Surat', 150000),
(106, 'Biryani House', 'Surat', 120000),
(107, 'Tasty Treat', 'Mumbai', 350000),
(108, 'Urban Kitchen', 'Mumbai', 300000),
(109, 'Food Junction', 'Mumbai', 300000),
(110, 'The Hungry Spot', 'Mumbai', 250000),
(111, 'Spice Express', 'Mumbai', 200000),
(112, 'Desi Dhaba', 'Pune', 180000),
(113, 'Green Bowl', 'Pune', 160000),
(114, 'Cafe Delight', 'Pune', 160000),
(115, 'Burger Point', 'Pune', 140000),
(116, 'South Spice', 'Pune', 110000);

SELECT * FROM restaurants ORDER BY total_revenue DESC;
SELECT
	RESTAURANT_ID,
    RESTAURANT_NAME,
    CITY,
    TOTAL_REVENUE,
    RANK()OVER(partition by CITY ORDER BY TOTAL_REVENUE DESC)AS REVENUE_RANK
FROM restaurants;

SELECT
    restaurant_id,
    restaurant_name,
    city,	
    total_revenue,
    DENSE_RANK() OVER (
        PARTITION BY city
        ORDER BY total_revenue DESC
    ) AS revenue_rank
FROM restaurants;

# TO SELECT THE TOP 3 RESTAURANT FROM EACH CITY

WITH CTE_TOP_RESTAURANT AS(
SELECT
	RESTAURANT_ID,
    RESTAURANT_NAME,
    CITY,
    TOTAL_REVENUE,
    DENSE_RANK()OVER(partition by CITY ORDER BY TOTAL_REVENUE DESC)AS REVENUE_RANK
FROM restaurants)

SELECT * FROM CTE_TOP_RESTAURANT WHERE REVENUE_RANK <= 3;

/*
RANK() with revenue_rank <= 3 returns three Surat restaurants because rank 3 is skipped.
DENSE_RANK() with revenue_rank <= 3 returns four Surat restaurants because it includes all restaurants in the top three distinct revenue levels.
Use DENSE_RANK() if the product team wants the top three revenue levels while including all tied restaurants.
Use RANK() if the report should follow competition-style ranking.
*/

#======================================================================================================================================================
#============================================================ SCENARIO - 5 ============================================================================
#======================================================================================================================================================
/*
SCENARIO
You are writing a CRM query for a food delivery startup. The customer success team
wants each customer labelled as 'Platinum', 'Gold', or 'Standard' based on total lifetime
spend — above Rs 5,000, between Rs 2,000 and Rs 5,000, and below Rs 2,000
respectively — directly in the query output without creating a new table.

Question: 
Explain how you would use CASE WHEN to generate this classification column. If a
customer's total spend is exactly Rs 5,000, which tier will they fall into, and how does the order of
your WHEN conditions control that outcome?
wITH CREATE AND INSERT QUERY
*/

use assignmentpractice;

DROP TABLE IF EXISTS new_customers;
CREATE TABLE new_customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

drop table if exists new_orders;
CREATE TABLE new_orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

INSERT INTO new_customers
(customer_id, customer_name, city)
VALUES
(1, 'Rahul', 'Mumbai'),
(2, 'Priya', 'Pune'),
(3, 'Amit', 'Surat'),
(4, 'Sneha', 'Delhi'),
(5, 'Karan', 'Mumbai'),
(6, 'Neha', 'Pune'),
(7, 'Vikas', 'Surat');

INSERT INTO new_orders
(order_id, customer_id, order_date, order_amount)
VALUES
(101, 1, '2026-01-10', 2500),
(102, 1, '2026-02-15', 3000),
(103, 2, '2026-01-12', 1200),
(104, 2, '2026-02-18', 1000),
(105, 3, '2026-01-20', 5000),
(106, 4, '2026-02-05', 1500),
(107, 5, '2026-01-25', 1800),
(108, 5, '2026-02-20', 700),
(109, 6, '2026-02-10', 500),
(110, 6, '2026-03-01', 800);

SELECT * FROM customers;
SELECT * FROM orders;

select
	c.customer_id,
    c.customer_name,
    coalesce(sum(o.order_amount),0)as life_time_spend,
    case 
		when coalesce(sum(o.order_amount),0) > 5000 then "Platinum"
		when coalesce(sum(o.order_amount),0)  between 2000 and 5000 then "Gold"
        else "Standard"
	end as "customer_tier"
    from new_customers as c
    left join new_orders as o
    on c.customer_id = o.customer_id
    group by c.customer_id,c.customer_name;
    
    
#========================================================================================================================================================
#========================================================= SCENARIO 6 ===================================================================================
#========================================================================================================================================================
/*
SCENARIO
You are optimising a slow-running analytics query for a food delivery platform. The
query joins four large tables and applies a GROUP BY across 10 million rows, taking over
30 seconds. A colleague suggests adding an index on the JOIN column used most
frequently.

Question: 
Explain what a database index does at the engine level and why it would speed up
this specific query. Are there scenarios where adding an index could actually hurt performance?
What trade-off must you evaluate before indexing every column in a large table?

*/

use assignmentpractice;

CREATE DATABASE food_delivery_analytics;
USE food_delivery_analytics;

DROP TABLE IF EXISTS new_customers;
CREATE TABLE new_customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

DROP TABLE IF EXISTS restaurants;
CREATE TABLE restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    city VARCHAR(50)
);

DROP TABLE IF EXISTS new_orders;
CREATE TABLE new_orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    order_date DATE,
    order_status VARCHAR(30)
);

DROP TABLE IF EXISTS order_items;
CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_name VARCHAR(100),
    quantity INT,
    item_price DECIMAL(10,2)
);

INSERT INTO new_customers VALUES
(1, 'Rahul', 'Mumbai'),
(2, 'Priya', 'Pune'),
(3, 'Amit', 'Surat'),
(4, 'Sneha', 'Delhi'),
(5, 'Karan', 'Mumbai');

INSERT INTO restaurants VALUES
(101, 'Food Palace', 'Mumbai'),
(102, 'Spice Garden', 'Pune'),
(103, 'Royal Kitchen', 'Surat'),
(104, 'Tasty Treat', 'Delhi');

INSERT INTO new_orders VALUES
(1001, 1, 101, '2026-01-10', 'Delivered'),
(1002, 2, 102, '2026-01-11', 'Delivered'),
(1003, 3, 103, '2026-01-12', 'Cancelled'),
(1004, 1, 104, '2026-02-05', 'Delivered'),
(1005, 4, 101, '2026-02-10', 'Delivered'),
(1006, 5, 102, '2026-02-15', 'Delivered'),
(1007, 2, 101, '2026-03-01', 'Delivered'),
(1008, 3, 103, '2026-03-05', 'Delivered');

INSERT INTO order_items VALUES
(1, 1001, 'Pizza', 2, 300),
(2, 1001, 'Burger', 1, 150),
(3, 1002, 'Biryani', 2, 250),
(4, 1003, 'Pasta', 1, 200),
(5, 1004, 'Pizza', 1, 300),
(6, 1004, 'Coke', 2, 50),
(7, 1005, 'Burger', 3, 150),
(8, 1006, 'Biryani', 1, 250),
(9, 1007, 'Pizza', 2, 300),
(10, 1008, 'Pasta', 2, 200);


SELECT
    r.restaurant_id,
    r.restaurant_name,
    r.city,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * oi.item_price) AS total_revenue

FROM new_orders AS o

INNER JOIN new_customers AS c
    ON o.customer_id = c.customer_id

INNER JOIN restaurants AS r
    ON o.restaurant_id = r.restaurant_id

INNER JOIN order_items AS oi
    ON o.order_id = oi.order_id

WHERE o.order_status = 'Delivered'
  AND o.order_date >= '2026-01-01'
  AND o.order_date < '2027-01-01'

GROUP BY
    r.restaurant_id,
    r.restaurant_name,
    r.city

ORDER BY total_revenue DESC;

/*
- This query joins four tables, filters orders, calculates revenue, and groups the results by restaurant.

- What index will do at this level?
- Think of a book containing 1,000 pages.
- Without an index, if you want to find a particular topic, you may need to check every page.
- With an index, you can look up the topic in the index and jump directly to the relevant page.
- A database index works in a similar way.
- In MySQL's InnoDB storage engine, indexes are generally implemented using a B+ tree structure

- Index hurt performance?
- Index can improve the select, join, and can slower the insert, update and delete and the index will require additional storage 

- How to create the index
CREATE UNIQUE INDEX idx_customer_email
ON customers(email);

- Show the index
 SHOW INDEX FROM orders;
 
 -Drop the index:-
 DROP INDEX idx_customer_id ON orders;
 
 - There are different ways to create index
 - normal index:- create index
 - unique index:- create unique index
 - composite index:- create index with mutiple column
 - views index:- show index from table name
 - delete index:- drop index 
 
*/

#+=====================================================================================================================================================================================
#==================================================================== Section B — Practical Coding Tasks ===============================================================================
#==================================================================== Task 1: Menu and orders ==========================================================================================
#=======================================================================================================================================================================================

/*
Write a series of SELECT queries on a food delivery orders table to retrieve, filter, and sort data
using core SQL clauses.
- Create a table named food_orders with columns: order_id, customer_name, restaurant_name, item_ordered, quantity, price_per_item, order_date, and city. Insert at least 8 rows spanning at least 3 cities.
- Write a query to retrieve all orders placed in the city of 'Mumbai', sorted by price_per_item in descending order.
- Write a query to return all distinct restaurant names that have received at least one order.
- Write a query to list the top 5 most expensive individual orders using ORDER BY and LIMIT.
*/

use assignmentpractice;

drop table if exists food_orders;
CREATE TABLE food_orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    restaurant_name VARCHAR(100),
    item_ordered VARCHAR(100),
    quantity INT,
    price_per_item DECIMAL(10,2),
    order_date DATE,
    city VARCHAR(50)
);

INSERT INTO food_orders
(order_id, customer_name, restaurant_name, item_ordered,
 quantity, price_per_item, order_date, city)
VALUES
(101, 'Rahul', 'Mehfil', 'Biryani', 2, 350, '2026-01-10', 'Mumbai'),
(102, 'Priya', 'Spice Garden', 'Paneer Tikka', 1, 280, '2026-01-11', 'Pune'),
(103, 'Amit', 'Mehfil', 'Chicken Biryani', 3, 450, '2026-01-12', 'Mumbai'),
(104, 'Sneha', 'Food Palace', 'Pizza', 2, 550, '2026-01-13', 'Surat'),
(105, 'Karan', 'Burger Hub', 'Burger', 2, 180, '2026-01-14', 'Mumbai'),
(106, 'Neha', 'Spice Garden', 'Veg Thali', 2, 220, '2026-01-15', 'Pune'),
(107, 'Vikas', 'Food Palace', 'Pasta', 1, 400, '2026-01-16', 'Delhi'),
(108, 'Riya', 'Mehfil', 'Mutton Biryani', 2, 600, '2026-01-17', 'Mumbai'),
(109, 'Arjun', 'Burger Hub', 'Cheese Burger', 3, 250, '2026-01-18', 'Surat'),
(110, 'Pooja', 'Pizza Corner', 'Farmhouse Pizza', 2, 700, '2026-01-19', 'Delhi');

select * from food_orders;

/*
Write a query to retrieve all orders placed in the city of 'Mumbai', sorted by price_per_item in
descending order.
*/
select * from food_orders where city = "Mumbai" order by price_per_item desc;

/*
Write a query to return all distinct restaurant names that have received at least one order.
*/

select 
	distinct restaurant_name as restaurant_name,
    count(order_id)as total_orders
from food_orders
group by restaurant_name;

/*
- Write a query to list the top 5 most expensive individual orders using ORDER BY and LIMIT.
*/
select * from food_orders order by price_per_item desc limit 5;

#=====================================================================================================================================================================
#============================================= Task 2: Restaurant Revenue Summary ====================================================================================
#=====================================================================================================================================================================

/*
Use aggregate functions and GROUP BY with HAVING to produce a restaurant-level revenue
and order-count summary from a delivery orders table.
*/

use assignmentpractice;

/*
- Create a table named delivery_orders with columns: order_id, restaurant_name, city,total_amount, order_status, and order_date. Insert at least 10 rows covering at least 4
different restaurants.
*/
drop table if exists delivery_orders;
CREATE TABLE delivery_orders (
    order_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    city VARCHAR(50),
    total_amount DECIMAL(10,2),
    order_status VARCHAR(30),
    order_date DATE
);

INSERT INTO delivery_orders
(order_id, restaurant_name, city, total_amount, order_status, order_date)
VALUES
(101, 'Mehfil', 'Mumbai', 2500, 'Delivered', '2026-01-01'),
(102, 'Mehfil', 'Mumbai', 3000, 'Delivered', '2026-01-02'),
(103, 'Mehfil', 'Mumbai', 1800, 'Delivered', '2026-01-03'),

(104, 'Spice Garden', 'Pune', 1500, 'Delivered', '2026-01-04'),
(105, 'Spice Garden', 'Pune', 2000, 'Delivered', '2026-01-05'),
(106, 'Spice Garden', 'Pune', 2500, 'Delivered', '2026-01-06'),

(107, 'Food Palace', 'Surat', 4000, 'Delivered', '2026-01-07'),
(108, 'Food Palace', 'Surat', 3500, 'Delivered', '2026-01-08'),
(109, 'Food Palace', 'Surat', 3000, 'Cancelled', '2026-01-09'),

(110, 'Burger Hub', 'Delhi', 1200, 'Delivered', '2026-01-10'),
(111, 'Burger Hub', 'Delhi', 1800, 'Delivered', '2026-01-11'),
(112, 'Burger Hub', 'Delhi', 1000, 'Delivered', '2026-01-12'),

(113, 'Pizza Corner', 'Mumbai', 5000, 'Delivered', '2026-01-13'),
(114, 'Pizza Corner', 'Mumbai', 6000, 'Delivered', '2026-01-14'),
(115, 'Pizza Corner', 'Mumbai', 2500, 'Delivered', '2026-01-15');

select * from delivery_orders;

/*
- Write a query using SUM, COUNT, and AVG to calculate total revenue, total orders, and average order value per restaurantAdd a HAVING clause to return only restaurants
 whose total revenue exceeds Rs 5,000.
*/
select
	distinct restaurant_name,
	 SUM(total_amount) AS total_revenue,
    COUNT(order_id) AS total_orders,
    round(AVG(total_amount),2) AS average_order_value
from delivery_orders group by restaurant_name;

/*
- Add a HAVING clause to return only restaurants whose total revenue exceeds Rs 5,000
*/
select
	distinct restaurant_name,
	 SUM(total_amount) AS total_revenue,
    COUNT(order_id) AS total_orders,
    round(AVG(total_amount),2) AS average_order_value
from delivery_orders group by restaurant_name
having total_revenue > 5000;

/*
- Extend the SELECT list with a CASE WHEN expression that labels each qualifying restaurant as
'High Revenue' if total revenue is above Rs 10,000, or 'Moderate Revenue' otherwise.
*/
select
	distinct restaurant_name,
	SUM(total_amount) AS total_revenue,
    COUNT(order_id) AS total_orders,
    round(AVG(total_amount),2) AS average_order_value,
    case 
		when SUM(total_amount) > 10000 then "High Revenue"
        else "Moderate Revenue"
    end as revenue_type
from delivery_orders group by restaurant_name
having total_revenue > 5000;

#===============================================================================================================================================
#============================= Task 3: Customer–Order–Restaurant Joined Report ===================================================================
#================================================================================================================================================
/*
Write JOIN queries across three related tables — customers, restaurants, and orders — to
produce a combined order report that handles missing records gracefully
*/

use assignmentpractice;

/*
Create three tables: customers (customer_id, name, city, phone), restaurants (restaurant_id,
name, cuisine_type, city), and orders (order_id, customer_id, restaurant_id, amount,
order_date). Insert at least 6 rows per table and intentionally include at least 2 customers who
have placed no orders.
*/

-- Customers table
drop table if exists new_customers;
CREATE TABLE new_customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    phone VARCHAR(15)
);

-- Restaurants table
drop table if exists new_restaurants;
CREATE TABLE new_restaurants (
    restaurant_id INT PRIMARY KEY,
    name VARCHAR(100),
    cuisine_type VARCHAR(50),
    city VARCHAR(50)
);

-- Orders table
drop table if exists new_orders;
CREATE TABLE new_orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id)
        REFERENCES new_customers(customer_id),
    FOREIGN KEY (restaurant_id)
        REFERENCES new_restaurants(restaurant_id)
);

INSERT INTO new_customers VALUES
(1, 'Rahul', 'Mumbai', '9876543210'),
(2, 'Priya', 'Pune', '9876543211'),
(3, 'Amit', 'Surat', '9876543212'),
(4, 'Sneha', 'Delhi', '9876543213'),
(5, 'Karan', 'Mumbai', '9876543214'),
(6, 'Neha', 'Pune', '9876543215'),
(7, 'Vikas', 'Delhi', '9876543216'),
(8, 'Riya', 'Surat', '9876543217');

INSERT INTO new_restaurants VALUES
(101, 'Mehfil', 'Biryani', 'Mumbai'),
(102, 'Spice Garden', 'Indian', 'Pune'),
(103, 'Food Palace', 'Chinese', 'Surat'),
(104, 'Royal Kitchen', 'North Indian', 'Delhi'),
(105, 'Burger Hub', 'Fast Food', 'Mumbai'),
(106, 'Pizza Corner', 'Italian', 'Pune');

INSERT INTO new_orders(order_id,customer_id,restaurant_id,amount,order_date)values
(1001, 1, 101, 850, '2026-01-10'),
(1002, 2, 102, 650, '2026-01-11'),
(1003, 3, 103, 1200, '2026-01-12'),
(1004, 4, 104, 950, '2026-01-13'),
(1005, 5, 102, 750, '2026-01-14'),
(1006, 1, 105, 500, '2026-01-15'),
(1007, 6, 106, 1100, '2026-01-16'),
(1008, 7, 101, 900, '2026-01-17');

select * from new_customers;
select * from new_restaurants;
select * from new_orders;

/*
Write an INNER JOIN query to list each order alongside the placing customer's name and the
fulfilling restaurant's name
*/
select 
	o.order_id,
    c.name as customer_name,
    r.name as restaurant_name,
    o.amount,
    o.order_date
from new_orders as o
inner join new_customers as c
on c.customer_id = o.customer_id
inner join new_restaurants as r
on r.restaurant_id = o.restaurant_id
order by o.order_id;

/*
- Write a LEFT JOIN query to list all customers — including those with no orders — with NULL
appearing in order columns where no order exists.
*/
select 
	o.order_id,
    c.name as customer_name,
    o.amount,
    o.order_date
from new_customers as c
left join new_orders as o
on c.customer_id = o.customer_id;

/*
Add a WHERE condition to the joined result to show only orders where both the customer and
the restaurant belong to the same city.
*/

select 
	o.order_id,
    c.city as customer_city,
    c.name as customer_name,
    r.name as restaurant_name,
    o.amount,
    r.city as restaurant_city,
    o.order_date
from new_orders as o
inner join new_customers as c
on c.customer_id = o.customer_id
inner join new_restaurants as r
on r.restaurant_id = o.restaurant_id
where c.city = r.city
order by o.order_id;


#=============================================================================================================================================================
#================================ Task 4: Delivery Agent Performance Ranking =================================================================================
#=============================================================================================================================================================
/*
- Use a CTE, window functions, and a subquery together to rank delivery agents by speed and
flag those performing below the platform average.
*/

use assignmentpractice;

/*
- Create a table named deliveries with columns: delivery_id, agent_name, restaurant_name,
delivery_time_mins, and order_date. Insert at least 10 rows across at least 4 delivery agents,
with varied delivery times.
*/

drop table if exists deliveries; 
CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY,
    agent_name VARCHAR(100),
    restaurant_name VARCHAR(100),
    delivery_time_mins INT,
    order_date DATE
);

INSERT INTO deliveries
(delivery_id, agent_name, restaurant_name,
 delivery_time_mins, order_date)
VALUES
(101, 'Aarav', 'Mehfil', 25, '2026-01-01'),
(102, 'Aarav', 'Spice Garden', 30, '2026-01-02'),
(103, 'Aarav', 'Food Palace', 20, '2026-01-03'),

(104, 'Diya', 'Mehfil', 35, '2026-01-04'),
(105, 'Diya', 'Burger Hub', 40, '2026-01-05'),
(106, 'Diya', 'Pizza Corner', 30, '2026-01-06'),

(107, 'Kabir', 'Spice Garden', 20, '2026-01-07'),
(108, 'Kabir', 'Food Palace', 22, '2026-01-08'),
(109, 'Kabir', 'Mehfil', 18, '2026-01-09'),

(110, 'Neha', 'Burger Hub', 28, '2026-01-10'),
(111, 'Neha', 'Pizza Corner', 32, '2026-01-11'),
(112, 'Neha', 'Spice Garden', 26, '2026-01-12');

select * from deliveries;

/*
- Write a CTE named agent_stats that calculates each agent's average delivery time across all
their deliveries.
*/


with cte_agent_stats as (
	select
		agent_name,
        count(delivery_id)as total_delivery,
        avg(delivery_time_mins)as agent_average_delivery_time
	from deliveries
    group by agent_name
)
select * from  cte_agent_stats;


/*
- Using the CTE result, apply RANK() OVER (ORDER BY avg_delivery_time ASC) to rank agents
from fastest to slowest.
*/
with cte_agent_stats as (
	select
		agent_name,
        count(delivery_id)as total_delivery,
        avg(delivery_time_mins)as agent_average_delivery_time
	from deliveries
    group by agent_name
)
select 
	agent_name,
	total_delivery,
	 ROUND(agent_average_delivery_time, 2) AS agent_average_delivery_time,
    RANK() OVER (
        ORDER BY agent_average_delivery_time ASC
    ) AS agent_rank
    from cte_agent_stats; 
    
/*
-  Add a scalar subquery to compute the overall platform average delivery time, then use CASE
WHEN in the final SELECT to label each agent 'On Track' if their average is at or below the
platform average, or 'Needs Improvement' if it is above.
*/
with cte_agent_stats as (
	select
		agent_name,
        count(delivery_id)as total_delivery,
        round(avg(delivery_time_mins),2)as agent_average_delivery_time
	from deliveries
    group by agent_name
),

cte_ranked_agent as(
	select
		agent_name,
		total_delivery,
		agent_average_delivery_time,
		rank()over(order by agent_average_delivery_time)as agent_rank,
        round((select avg(delivery_time_mins) from deliveries),2)as overall_average_delivery
	from cte_agent_stats
)
select
	agent_name,
	total_delivery,
	agent_average_delivery_time,
    agent_rank,
    overall_average_delivery,
	case
		when agent_average_delivery_time < overall_average_delivery then "On Track"
        else  "Needs Improvement"
	end as performance_status
from cte_ranked_agent;

#=================================================================================================================================================================================
#================================================= Section C — Mini Capstone Project =============================================================================================
#================================================= Mini Project: Food Delivery Analytics — SQL Backend ===========================================================================

/*
Objective:
Build a complete SQL backend for a food delivery analytics system by designing a multi-table
schema and writing a suite of queries that combines JOINs, aggregations, window functions,
CASE WHEN classification, CTEs, and a saved View to answer real business questions.
*/
use assignmentpractice;
/*
-  Design a schema with at least four related tables: customers, restaurants, orders, and
delivery_agents. Define appropriate PRIMARY KEY and FOREIGN KEY constraints and insert at
least 10 rows per table with realistic food delivery data across at least 3 cities.
*/

drop table if exists customers_2;
CREATE TABLE customers_2 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    phone VARCHAR(15),
    registration_date DATE
);

drop table if exists restaurants_2;
CREATE TABLE restaurants_2 (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1)
);

drop table if exists delivery_agents_2;
CREATE TABLE delivery_agents_2 (
    agent_id INT PRIMARY KEY,
    agent_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    joining_date DATE
);

drop table if exists orders_2;
CREATE TABLE orders_2 (
    order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    agent_id INT,
    order_date DATETIME,
    order_amount DECIMAL(10,2),
    delivery_time_mins INT,
    order_status VARCHAR(30),

    FOREIGN KEY (customer_id)
        REFERENCES customers_2(customer_id),

    FOREIGN KEY (restaurant_id)
        REFERENCES restaurants_2(restaurant_id),

    FOREIGN KEY (agent_id)
        REFERENCES delivery_agents_2(agent_id)
);

INSERT INTO customers_2 VALUES
(1, 'Rahul Sharma', 'Mumbai', '9876543210', '2025-01-10'),
(2, 'Priya Patel', 'Pune', '9876543211', '2025-02-15'),
(3, 'Amit Verma', 'Hyderabad', '9876543212', '2025-03-20'),
(4, 'Sneha Joshi', 'Mumbai', '9876543213', '2025-04-12'),
(5, 'Karan Mehta', 'Pune', '9876543214', '2025-05-18'),
(6, 'Neha Singh', 'Hyderabad', '9876543215', '2025-06-22'),
(7, 'Rohit Kumar', 'Mumbai', '9876543216', '2025-07-10'),
(8, 'Anjali Desai', 'Pune', '9876543217', '2025-08-14'),
(9, 'Vikas Rao', 'Hyderabad', '9876543218', '2025-09-19'),
(10, 'Pooja Shah', 'Mumbai', '9876543219', '2025-10-25');

INSERT INTO restaurants_2 VALUES
(101, 'Spice Garden', 'Mumbai', 'Indian', 4.5),
(102, 'Pizza Palace', 'Mumbai', 'Italian', 4.2),
(103, 'Burger Hub', 'Mumbai', 'Fast Food', 4.0),
(104, 'Tandoori House', 'Pune', 'North Indian', 4.6),
(105, 'South Spice', 'Pune', 'South Indian', 4.3),
(106, 'Cafe Delight', 'Pune', 'Cafe', 4.1),
(107, 'Biryani Express', 'Hyderabad', 'Biryani', 4.7),
(108, 'Paradise Kitchen', 'Hyderabad', 'Indian', 4.5),
(109, 'Dosa Corner', 'Hyderabad', 'South Indian', 4.2),
(110, 'Chinese Wok', 'Mumbai', 'Chinese', 4.0);

INSERT INTO delivery_agents_2 VALUES
(201, 'Suresh Patil', 'Mumbai', '2024-01-10'),
(202, 'Ramesh Kumar', 'Pune', '2024-02-15'),
(203, 'Ajay Singh', 'Hyderabad', '2024-03-20'),
(204, 'Vijay Sharma', 'Mumbai', '2024-04-12'),
(205, 'Manoj Verma', 'Pune', '2024-05-18'),
(206, 'Deepak Rao', 'Hyderabad', '2024-06-22'),
(207, 'Nitin Shah', 'Mumbai', '2024-07-10'),
(208, 'Arjun Mehta', 'Pune', '2024-08-14'),
(209, 'Kishore Reddy', 'Hyderabad', '2024-09-19'),
(210, 'Sameer Joshi', 'Mumbai', '2024-10-25');

INSERT INTO orders_2 VALUES
(1001, 1, 101, 201, NOW() - INTERVAL 1 DAY, 1200, 32, 'Delivered'),
(1002, 2, 104, 202, NOW() - INTERVAL 2 DAY, 1800, 40, 'Delivered'),
(1003, 3, 107, 203, NOW() - INTERVAL 3 DAY, 2500, 35, 'Delivered'),
(1004, 4, 102, 204, NOW() - INTERVAL 4 DAY, 900, 28, 'Delivered'),
(1005, 5, 105, 205, NOW() - INTERVAL 5 DAY, 1500, 42, 'Delivered'),

(1006, 1, 101, 207, NOW() - INTERVAL 6 DAY, 2200, 30, 'Delivered'),
(1007, 6, 108, 206, NOW() - INTERVAL 7 DAY, 3000, 38, 'Delivered'),
(1008, 7, 103, 201, NOW() - INTERVAL 8 DAY, 700, 25, 'Delivered'),
(1009, 8, 104, 208, NOW() - INTERVAL 9 DAY, 1600, 45, 'Delivered'),
(1010, 9, 107, 209, NOW() - INTERVAL 10 DAY, 2800, 33, 'Delivered'),

(1011, 2, 104, 202, NOW() - INTERVAL 11 DAY, 2100, 37, 'Delivered'),
(1012, 3, 107, 203, NOW() - INTERVAL 12 DAY, 1900, 31, 'Delivered'),
(1013, 4, 101, 204, NOW() - INTERVAL 13 DAY, 1400, 29, 'Delivered'),
(1014, 5, 105, 205, NOW() - INTERVAL 14 DAY, 2500, 41, 'Delivered'),
(1015, 6, 108, 206, NOW() - INTERVAL 15 DAY, 1800, 36, 'Delivered'),

(1016, 7, 101, 207, NOW() - INTERVAL 16 DAY, 1300, 27, 'Delivered'),
(1017, 8, 104, 208, NOW() - INTERVAL 17 DAY, 1700, 39, 'Delivered'),
(1018, 9, 107, 209, NOW() - INTERVAL 18 DAY, 2200, 34, 'Delivered'),
(1019, 10, 102, 210, NOW() - INTERVAL 19 DAY, 1100, 30, 'Delivered'),
(1020, 1, 101, 201, NOW() - INTERVAL 20 DAY, 2000, 32, 'Delivered'),

(1021, 2, 104, 202, NOW() - INTERVAL 21 DAY, 1900, 43, 'Delivered'),
(1022, 3, 107, 203, NOW() - INTERVAL 22 DAY, 2600, 35, 'Delivered'),
(1023, 4, 102, 204, NOW() - INTERVAL 23 DAY, 1500, 29, 'Delivered'),
(1024, 5, 105, 205, NOW() - INTERVAL 24 DAY, 2300, 40, 'Delivered'),
(1025, 6, 108, 206, NOW() - INTERVAL 25 DAY, 2100, 37, 'Delivered');
select * from customers_2;
select * from restaurants_2;
select * from orders_2;
select * from delivery_agents_2;

/*
-Write a revenue report query using GROUP BY, HAVING, and aggregate functions (SUM, COUNT,
AVG) that returns total orders and total revenue per restaurant, filtered to include only
restaurants with more than 3 orders.
*/
select 
	r.restaurant_id,
    r.restaurant_name,
    count(o.order_id)as total_orders,
    round(sum(o.order_amount),2)as total_revenue,
    round(avg(o.order_amount),2)as avg_revenue
from restaurants_2 as r
inner join orders_2 as o
on r.restaurant_id = o.restaurant_id
where o.order_status = "Delivered"
group by r.restaurant_id,r.restaurant_name
having total_orders > 3
order by total_revenue desc;
    
/*
-  Write a customer segmentation query using CASE WHEN to classify each customer as
'Platinum' (spend above Rs 5,000), 'Gold' (Rs 2,000–Rs 5,000), or 'Standard' (below Rs 2,000)
based on their total spend, ordered from highest to lowest spender.
*/
select * from orders_2;
select * from customers_2;

with cte_cst_spent as (
select
	c.customer_id,
	c.customer_name,
	count(o.order_id)as total_order,
    sum(o.order_amount) as total_spent
from customers_2 as c
left join orders_2 as o
on c.customer_id = o.customer_id
group by c.customer_id,
c.customer_name
)

select 
	customer_id,
    customer_name,
    total_order,
    total_spent,
    case total_spent
		when total_spent > 5000 then "Platinum"
        when total_spent between 2000 and 5000 then "Gold"
        else "Standard"
	end as revenue_report
    from cte_cst_spent;
		
/*
Write a window function query using DENSE_RANK() OVER (PARTITION BY city ORDER BY
total_revenue DESC) to identify the top 3 performing restaurants in each city, and a separate
query using ROW_NUMBER() to find each customer's single most recent order.
*/  
select * from restaurants_2;
select * from orders_2;

with cte_restaurant_revenue as (
	select
		r.restaurant_id,
		r.restaurant_name,
		r.city,
		r.cuisine,
		count(o.order_id)as total_orders,
		sum(o.order_amount) as total_revenue
	from restaurants_2 as r
	left join orders_2 as o
	on r.restaurant_id = o.restaurant_id
	group by r.restaurant_id,
		r.restaurant_name,
		r.city
),
cte_restaurant_ranking  as (
	select
		restaurant_id,
		city,
        restaurant_name,
        cuisine,
        total_orders,
        total_revenue,
        dense_rank()over(partition by city order by total_revenue desc)as revenue_rank
        from cte_restaurant_revenue
)
select * from cte_restaurant_ranking where  revenue_rank <= 3 order by city, revenue_rank;

#a separate query using ROW_NUMBER() to find each customer's single most recent order.
select * from orders_2;
select * from customers_2;

with cte_cst_orders as(
	select
		c.customer_id,
		c.customer_name,
		o.order_id,
		o.order_date,
		o.order_amount,
		o.order_status,
		row_number()over(partition by c.customer_id order by o.order_date desc,o.order_id desc)as rn
	from customers_2 as c
	inner join orders_2 as o
	on c.customer_id = o.customer_id
)

select 
	customer_id, 
    order_id,
    customer_name,
    order_date,
    order_amount,
    order_status,
    rn
	from cte_cst_orders where rn = 1
    order by order_date desc;
    
/*
- Create a SQL VIEW named vw_daily_order_summary that JOINs all four tables and returns:
order_date, customer_name, restaurant_name, agent_name, order_amount, and
delivery_time_mins. Query the view to display only orders placed in the last 7 days.
*/

 create view vw_daily_order_summary as 
	select
		o.order_date,
		c.customer_name,
        r.restaurant_name,
        da.agent_name,
        o.order_amount,
        o.delivery_time_mins
		
        from orders_2 as o
        inner join customers_2 as c
        on c.customer_id = o.customer_id
        inner join restaurants_2 as r
        on o.restaurant_id = r.restaurant_id
        inner join delivery_agents_2 as da
        on o.agent_id = da.agent_id;
        

SELECT *
FROM vw_daily_order_summary
WHERE order_date >= NOW() - INTERVAL 7 DAY
  AND order_date <= NOW()
ORDER BY order_date DESC;

#=============================================================================================================================================================
#==================================================== Section D — AI-Augmented Learning ======================================================================
#=============================================================================================================================================================

#=============================================================================================================================================================
#==================================================== Section D — AI-Augmented Learning ======================================================================
#=============================================================================================================================================================

/*
STEP 1 · BUILD WITH AI
Use an AI tool of your choice (ChatGPT, Claude, GitHub Copilot, etc.) to help you write a SQL query
that:
Finds the top 3 delivery agents per city for a food delivery platform, ranked by number of
completed orders, using window functions.
Includes a column showing each agent's average delivery time alongside their rank.
Filters the result to include only agents who have completed more than 5 orders in that city.
Returns the final output sorted by city name alphabetically, then by rank ascending.

STEP 2 · TEST & DEBUG (WITHOUT AI)
Then, working without AI, test the query against your own schema. Find at least one bug, logical
error, or edge-case gap in the AI's solution — common issues include: applying the
HAVING/WHERE filter after ranking instead of before (causing wrong ranks), using the wrong
PARTITION BY column, or failing to handle NULL delivery times. Fix it yourself.
*/

select * from restaurants_2;
select * from orders_2;
select * from customers_2;
select * from delivery_agents_2;

with cte_agents_stats as (
select
	da.agent_id,
    da.agent_name,
    da.city,
    count(o.order_id)as total_orders,
    round(avg(o.delivery_time_mins),2)as avg_delivery_time
    from delivery_agents_2 as da
    inner join orders_2 as o
    on da.agent_id = o.agent_id
    where o.order_status = "Delivered"
    group by 
    da.agent_id,
    da.agent_name,
    da.city
    having total_orders >= 2 # I am using 2 in place of 5 orders
),cte_agent_ranking as (
	select
	agent_id,
    agent_name,
    city,
    total_orders,
    avg_delivery_time,
    dense_rank()over(partition by city order by avg_delivery_time desc )as agent_rank
    from cte_agents_stats
)
select 
	agent_id,
    agent_name,
    city,
    total_orders,
    avg_delivery_time,
    agent_rank
    from cte_agent_ranking
     where agent_rank <= 3
     order by city asc, agent_rank asc;
    
    


