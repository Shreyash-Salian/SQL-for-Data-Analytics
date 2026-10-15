#====================================================================================================================================================================
#=================================== SESSION 10 UNION AND UNION ALL==================================================================================================

/*
1. Create two tables: AppOrders (for orders placed via a food delivery app like Zomato) and InStoreOrders (for direct restaurant orders),
 each with columns: order_id, customer_name, amount, and order_date. Insert at least 3 sample records into each table
*/

DROP TABLE IF EXISTS APPORDERS;
CREATE TABLE IF NOT EXISTS AppOrders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO AppOrders (order_id, customer_name, amount, order_date)
VALUES
(1, 'Rahul Sharma', 450.00, '2026-10-10'),
(2, 'Priya Patel', 320.00, '2026-10-11'),
(3, 'Amit Verma', 650.00, '2026-10-12'),
(4, 'Neha Desai', 280.00, '2026-10-13');

DROP TABLE IF EXISTS INSTOREORDERS;
CREATE TABLE IF NOT EXISTS InStoreOrders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO InStoreOrders (order_id, customer_name, amount, order_date)
VALUES
(1, 'Rahul Sharma', 450.00, '2026-10-10'),
(2, 'Priya Patel', 320.00, '2026-10-11'),
(5, 'Karan Shah', 500.00, '2026-10-14'),
(6, 'Pooja Mehta', 350.00, '2026-10-15');


/*
2. Write a SQL query using UNION to combine all unique customer names from both AppOrders and InStoreOrders tables into a single list.
*/
SELECT * FROM AppOrders
UNION 
SELECT * FROM InStoreOrders ORDER BY customer_name;

/*
3. Write a SQL query using UNION ALL to display every order (including duplicates if any)
 from both AppOrders and InStoreOrders, showing order_id, customer_name, amount, and order_date.
*/
SELECT * FROM AppOrders
UNION ALL
SELECT * FROM InStoreOrders ORDER BY customer_name;

/*
4. Demonstrate the difference between UNION and UNION ALL by adding a duplicate customer_name in both tables,
 then running both queries and noting the difference in the result count. UNION removes duplicates, UNION ALL does not.
*/

SELECT * FROM AppOrders
UNION 
SELECT * FROM InStoreOrders ORDER BY customer_name;

SELECT * FROM AppOrders
UNION ALL
SELECT * FROM InStoreOrders ORDER BY customer_name;

/*
UNION => UNION WILL REMOVE THE DUPLICATE(REPEATING) VALUES FROM THE TABLE.
UNION ALL => IT WILL ADD THE DUPLICATE (REPEATING) RECORD FROM THE TABLE
*/


#===========================================================================================================================
