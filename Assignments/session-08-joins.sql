#================================================ SESSION - 8 JOINS ================================================================
USE MUSIC_STREAMING_DB;
/*
1.Create two tables in your SQL database: Users (user_id, username, city) 
and Orders (order_id, user_id, product, amount). Insert at least 3 users and 5 orders, making sure some users have no orders.
*/
drop table if exists newUsers;
CREATE TABLE newUsers (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    city VARCHAR(50),
    segment_id INT,
	FOREIGN KEY (segment_id)
        REFERENCES CustomerSegments(segment_id)
);
drop table if exists newOrders;
CREATE TABLE newOrders (
    order_id INT PRIMARY KEY,
    user_id INT,
    product VARCHAR(100),
    amount DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

drop table if exists CustomerSegments;
CREATE TABLE CustomerSegments (
    segment_id INT PRIMARY KEY,
    segment_name VARCHAR(50) NOT NULL
);
#========================= INSERT QUERY =============================================
INSERT INTO newUsers (user_id, username, city,segment_id)
VALUES
(1, 'Rahul', 'Surat',1),	
(2, 'Priya', 'Mumbai',2),
(3, 'Amit', 'Bardoli',1),
(4, 'Neha', 'Ahmedabad',3);

#===================== INSERT QUERY================================================
INSERT INTO newOrders (order_id, user_id, product, amount)
VALUES
(101, 1, 'Laptop', 55000.00),
(102, 1, 'Mouse', 800.00),
(103, 2, 'Keyboard', 1500.00),
(104, 3, 'Monitor', 12000.00),
(105, 2, 'Headphones', 2500.00);

#===================== INSERT QUERY================================================
INSERT INTO CustomerSegments (segment_id, segment_name)
VALUES
(1, 'Regular'),
(2, 'Premium'),
(3, 'New Customer');

#======================= SELECT QUERY====================================
select 
u.user_id,
u.username,
u.city,
o.order_id,
o.product,
o.amount
from newusers as u
left join neworders as o
on u.user_id = o.user_id;

select 
u.user_id,
u.username,
u.city,
o.order_id,
o.product,
o.amount
from newusers as u
inner join neworders as o
on u.user_id = o.user_id;


/*
2.Write an SQL query using INNER JOIN to list all usernames and their ordered products, showing only users who have placed at least one order.
*/
select 
u.user_id,
u.username,
u.city,
o.order_id,
o.product,
o.amount
from newusers as u
inner join neworders as o
on u.user_id = o.user_id;

/*
3.Write an SQL query using LEFT JOIN to display all usernames along with their ordered products. For users who haven't placed any orders, show NULL for the product.
*/

select 
u.user_id,
u.username,
u.city,
o.order_id,
o.product,
o.amount
from newusers as u
left join neworders as o
on u.user_id = o.user_id;

/*
4.Write an SQL query using RIGHT JOIN to show all orders and the corresponding username for each order. If an order has a user_id that doesn't exist in the Users table, 
display NULL for the username.<Hint> deleting one user and keeping their order to test this case.
*/
SELECT
    o.order_id,
    o.user_id,
    o.product,
    o.amount,
    o.product,
    u.username
FROM newusers u
RIGHT JOIN neworders o
    ON u.user_id = o.user_id;

/*
5. Suppose you want to analyze food delivery data like Zomato. Create a CustomerSegments table (segment_id, segment_name),
 and link it to Users with a foreign key. Write an SQL query to show each username, their segment name, and total order amount (use JOINs as needed).
*/

SELECT
    u.username,
    cs.segment_name,
    SUM(o.amount) AS total_order_amount
FROM newUsers AS u
INNER JOIN CustomerSegments AS cs
    ON u.segment_id = cs.segment_id
LEFT JOIN neworders AS o
    ON u.user_id = o.user_id
GROUP BY
    u.user_id,
    u.username,
    cs.segment_id,
    cs.segment_name
ORDER BY total_order_amount DESC;

select * from orders;

#====================================================================================================================================
