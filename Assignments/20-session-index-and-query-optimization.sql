    
#==========================================================================================================================================================================
#======================================================= SESSION 19: INDEXING AND QUERY OPTIMIZATION TOPICS================================================================
#==========================================================================================================================================================================
use assignmentpractice;

/*
1. Run a SELECT query on a large 'orders' table (at least 10,000 rows) to find all orders for a specific user_id and measure the query execution time.
*/

DROP TABLE IF EXISTS orders;

CREATE TABLE orders
(
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_id INT,
    quantity INT,
    amount DECIMAL(10,2),
    order_date DATE,
    status VARCHAR(30)
);

SET SESSION cte_max_recursion_depth = 25000;

INSERT INTO orders
(user_id, product_id, quantity, amount, order_date, status)

WITH RECURSIVE numbers AS
(
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 20000
)

SELECT
    FLOOR(1 + RAND(n) * 1000),
    FLOOR(1 + RAND(n + 10) * 500),
    FLOOR(1 + RAND(n + 20) * 10),
    ROUND(100 + RAND(n + 30) * 5000, 2),
    DATE_ADD('2025-01-01', INTERVAL MOD(n, 365) DAY),
    CASE
        WHEN MOD(n, 3) = 0 THEN 'Delivered'
        WHEN MOD(n, 3) = 1 THEN 'Pending'
        ELSE 'Cancelled'
    END
FROM numbers;

SELECT COUNT(*) AS total_records
FROM orders;

SELECT *
FROM orders
WHERE user_id = 101;

/*
next steps:
Measure query execution time
Method 1: Using MySQL Workbench
1. Open a new SQL query tab.
2. Execute the SELECT query.
3. Look at the Action Output panel at the bottom.
4. Check the Duration / Fetch column.

Method 2: Using EXPLAIN ANALYZE

*/

EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE user_id = 101;

/*
This shows:
- Actual execution time.
- Number of rows returned.
- Number of loops.
- Query execution plan.

Improve query performance using an index
*/

CREATE INDEX idx_user_id
ON orders(user_id);

EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE user_id = 101;

SELECT *
FROM orders
WHERE user_id = 101;

/*
2. Create an index on the user_id column of the 'orders' table and re-run the same SELECT query to measure the new execution time.
Hint: Use CREATE INDEX idx_user_id ON orders(user_id); and compare the times before and after.
*/

SHOW INDEX FROM orders;

SELECT *
FROM orders
WHERE user_id = 101;

CREATE INDEX idx_user_id
ON orders(user_id);

EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE user_id = 101;

drop index idx_user_id on orders;

/*
3. Use the EXPLAIN PLAN command to analyze how your SELECT query runs before and after adding the index, and write down the key differences you observe in the output.
*/


# Step 1: Analyze the query before creating an index
drop index idx_user_id on orders;

#Now execute:
EXPLAIN
SELECT *
FROM orders
WHERE user_id = 101;

/*
Expected observations before indexing
- type: ALL
- possible_keys: NULL
- key: NULL
- rows: Approximately 20,000
- Extra: Using where

MySQL may examine the entire table because there is no index on user_id.
*/

#Step 2: Create the index
CREATE INDEX idx_user_id
ON orders(user_id);

#Step 3: Analyze the query after creating the index
EXPLAIN
SELECT *
FROM orders
WHERE user_id = 101;

#MySQL can now use idx_user_id to locate matching records instead of scanning the entire table.

#Step 4: Use EXPLAIN ANALYZE for actual execution details
#MySQL supports EXPLAIN ANALYZE, rather than Oracle-style EXPLAIN PLAN.

EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE user_id = 101;

#This provides actual execution timing and rows processed.

/*
My observations before index
	- Full table scan
	- There is no index used
    - Row examined are more
    - Query performance is slow
    - No storage is required

My observations after index
	- Index lookup
    - Used the index 
    - Row examined are few
    - Query performance is faster
    - Additional index storage is required
*/

/*
4. Write a query for a 'products' table that avoids a full table scan by using an index on the 'category' column to fetch all products in a specific category.
*/
DROP TABLE IF EXISTS products;
CREATE TABLE products
(
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

INSERT INTO products
(product_name, category, price, stock)
VALUES
('iPhone 16', 'Electronics', 75000, 20),
('Samsung S25', 'Electronics', 82000, 15),
('Dell Laptop', 'Electronics', 65000, 10),
('HP Laptop', 'Electronics', 58000, 25),
('Nike Shoes', 'Fashion', 4500, 50),
('Adidas Shoes', 'Fashion', 5500, 40),
('Puma T-Shirt', 'Fashion', 1200, 100),
('Levis Jeans', 'Fashion', 2500, 60),
('Wooden Table', 'Furniture', 12000, 8),
('Office Chair', 'Furniture', 8000, 12),
('Sofa Set', 'Furniture', 35000, 5),
('Dining Table', 'Furniture', 18000, 7),
('Samsung TV', 'Electronics', 45000, 18),
('Boat Headphones', 'Electronics', 2500, 35),
('Smart Watch', 'Electronics', 6000, 22);
	
select * from products;

#Step 1: Create an index on category
CREATE INDEX idx_category
ON products(category);

#Step 2: Retrieve products from a specific category
SELECT *
FROM products
WHERE category = 'Electronics';

#Step 3:Analyze query performance using EXPLAIN
EXPLAIN
SELECT *
FROM products
WHERE category = 'Electronics';

DROP INDEX idx_category ON products;

/*
6. Suppose your SELECT query on the 'orders' table is still slow even after adding an index. Use EXPLAIN PLAN and 
research at least one more optimization technique (other than indexing) 
using an AI tool like ChatGPT or Copilot, and describe how you would apply it.
*/

#Step 1: Analyze the current query using EXPLAIN
EXPLAIN
SELECT *
FROM orders
WHERE user_id = 101;

EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE user_id = 101;

#Step 2: Optimization technique 1 – Avoid SELECT *
#One reason queries can be slow is retrieving unnecessary columns.
SELECT
    order_id,
    user_id,
    amount,
    order_date
FROM orders
WHERE user_id = 101;

#Step 3: Optimization technique 2 – Avoid functions on indexed columns
#Suppose you want orders placed in January 2025.

#less optimized query
SELECT *
FROM orders
WHERE YEAR(order_date) = 2025
AND MONTH(order_date) = 1;

#optimized query
SELECT
    order_id,
    user_id,
    amount,
    order_date
FROM orders
WHERE order_date >= '2025-01-01'
AND order_date < '2025-02-01';

#This uses a date range instead of applying functions to every candidate row.

#If an index exists on order_date, MySQL can potentially use an index range scan.
#Step 4: Compare execution plans
EXPLAIN
SELECT *
FROM orders
WHERE YEAR(order_date) = 2025
AND MONTH(order_date) = 1;


EXPLAIN
SELECT
    order_id,
    user_id,
    amount,
    order_date
FROM orders
WHERE order_date >= '2025-01-01'
AND order_date < '2025-02-01';

/*
Performance analysis: I would use EXPLAIN and EXPLAIN ANALYZE before and after optimization to compare the execution plan, 
estimated rows, actual rows, and execution time.

Conclusion: Query optimization is not limited to creating indexes. Reducing unnecessary columns and
 writing efficient WHERE conditions can also improve database performance.
*/
#====================================================================================================================================================================
#====================================================================================================================================================================
