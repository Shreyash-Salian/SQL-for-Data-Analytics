#-------------------------------------------------------------------------------------------------------------------------------------------------------
#============================================================ SESSION 15- DATE FUNCTION ===================================================================
#1. Write an SQL query using the NOW() function to display the current date and time as 'CurrentDateTime' in your result set.
SELECT NOW() AS CurrentDateTime;

/*2. Suppose you have a table called Orders with a column order_date (DATE type). 
	Write a query to display each order's order_date, the year, month, and day as separate columns using YEAR(), MONTH(), and DAY().
*/
DROP TABLE IF EXISTS ORDERS;
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE
);
INSERT INTO Orders (order_id, order_date)
VALUES
(1, '2026-01-15'),
(2, '2026-03-22'),
(3, '2025-11-08'),
(4, '2026-07-04'),
(5, '2024-12-31');

SELECT
YEAR(ORDER_DATE)AS ORDER_YEAR,
MONTH(ORDER_DATE)AS ORDER_MONTH,
DAY(ORDER_DATE)AS ORDER_DAY
FROM ORDERS;

SELECT 
DATE_FORMAT(ORDER_DATE,"%b-%y")as orderMonth,
COUNT(*)AS TOTAL_ORDERS
FROM ORDERS
GROUP BY orderMonth
ORDER BY orderMonth;

/*3.Imagine you are building a feature like Zomato's order delivery estimate. Given a table Deliveries with a column delivery_date,
 write a query to show delivery_date and a new column expected_pickup_date which is 2 days before delivery_date using DATE_SUB().
*/
DROP TABLE IF EXISTS Deliveries;
CREATE TABLE Deliveries (
    delivery_id INT PRIMARY KEY,
    delivery_date DATE
);
INSERT INTO Deliveries (delivery_id, delivery_date)
VALUES
(1, '2026-10-20'),
(2, '2026-10-22'),
(3, '2026-10-25'),
(4, '2026-11-01'),
(5, '2026-11-05');

SELECT
DELIVERY_DATE,
DATE_SUB(DELIVERY_DATE,INTERVAL 2 DAY)AS EXPECTED_PICK_UP_DATE
FROM DELIVERIES;

/*
4. You have a table called Subscriptions with columns user_id, start_date, and end_date.
 Write a query to display user_id, start_date, end_date, and the total number of days of each subscription
 using DATEDIFF().<br><br><em><strong>Hint:</strong> Use DATEDIFF(end_date, start_date) to get the duration.</em>
*/

DROP TABLE IF EXISTS SUBSCRIPTIONS;

CREATE TABLE Subscriptions (
    user_id INT PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

INSERT INTO Subscriptions (user_id, start_date, end_date)
VALUES
(101, '2026-01-01', '2026-02-01'),
(102, '2026-03-10', '2026-03-25'),
(103, '2026-04-01', '2026-07-01'),
(104, '2026-06-15', '2026-06-30'),
(105, '2026-09-01', '2026-10-01');


SELECT 
USER_ID,
START_DATE,
END_DATE,
DATEDIFF(END_DATE,START_DATE)AS DURATION
FROM Subscriptions;

/*
5. Create an SQL query for a table named AppLogins (columns: user_id, last_login_date) to find all users who haven't logged in for more than 30 days from today. 
Use NOW() and DATEDIFF() in your query. Constraint: Only select user_id and last_login_date for users who meet the criteria.
*/
DROP TABLE IF EXISTS AppLogins;
CREATE TABLE AppLogins (
    user_id INT PRIMARY KEY,
    last_login_date DATETIME
);

INSERT INTO AppLogins (user_id, last_login_date)
VALUES
(101, NOW() - INTERVAL 10 DAY),
(102, NOW() - INTERVAL 25 DAY),
(103, NOW() - INTERVAL 35 DAY),
(104, NOW() - INTERVAL 60 DAY),
(105, NOW() - INTERVAL 30 DAY),
(106, NOW() - INTERVAL 45 DAY);


SELECT user_id, last_login_date
FROM AppLogins
WHERE DATEDIFF(NOW(), last_login_date) > 30;

#----------------------------------------------------------------------------------------------------------------------------------------------------------------
