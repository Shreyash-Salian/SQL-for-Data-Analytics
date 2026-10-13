#------------------------------------------- SESSION PART 3----------------------------------------------------------------
/*
1.Write an SQL query to select all restaurants from a table named 'restaurants' where the rating is greater than or equal to 4.5.

*/
SELECT * FROM RESTAURANTS WHERE RATING >= 4.5;

/*
2. In a table called 'movies', filter and display only the movies released after 2020 and with genre 'Action' using the WHERE clause and AND operator.
*/
SELECT * FROM MOVIES WHERE RELEASE_YEAR > 2020 AND GENRE = 'Action';


CREATE TABLE IF NOT EXISTS Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    brand VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

INSERT INTO Products
(product_id, product_name, category, brand, price, stock)
VALUES
(1, 'Wireless Mouse', 'Electronics', 'Logitech', 799.00, 50),
(2, 'Bluetooth Headphones', 'Electronics', 'boAt', 1499.00, 30),
(3, 'Smartphone', 'Electronics', 'Samsung', 14999.00, 20),
(4, 'Running Shoes', 'Fashion', 'Nike', 2499.00, 15),
(5, 'Cotton T-Shirt', 'Fashion', 'Roadster', 599.00, 100),
(6, 'Backpack', 'Accessories', 'Skybags', 999.00, 40),
(7, 'Wrist Watch', 'Accessories', 'Fastrack', 1299.00, 25),
(8, 'Keyboard', 'Electronics', 'HP', 1199.00, 35),
(9, 'Water Bottle', 'Home & Kitchen', 'Milton', 499.00, 60),
(10, 'Power Bank', 'Electronics', 'Ambrane', 1399.00, 45),
(11, 'Office Chair', 'Furniture', 'Green Soul', 4999.00, 10),
(12, 'Sunglasses', 'Fashion', 'Vincent Chase', 899.00, 20),
(13, 'Laptop Stand', 'Accessories', 'Portronics', 699.00, 30),
(14, 'Table Lamp', 'Home & Kitchen', 'Philips', 1499.00, 18),
(15, 'Earphones', 'Electronics', 'Realme', 549.00, 55);


/*
3. Given a table 'products' with columns (id, name, price, category), 
write a query to find all products not in the 'Electronics' category or with a price less than 500.
*/
SELECT * FROM PRODUCTS WHERE CATEGORY != 'Electronics' or price < 500;  

/*
4. Write an SQL query for a table 'users' to show all users who are NOT from 'Ahmedabad'
 and have more than 1000 followers.<br><br><em><strong>Hint:</strong> Use the NOT operator combined with AND.</em>
*/

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    followers INT
);
INSERT INTO users (user_id, username, city, followers)
VALUES
(1, 'Rahul', 'Surat', 2500),
(2, 'Priya', 'Ahmedabad', 5000),
(3, 'Amit', 'Vadodara', 800),
(4, 'Neha', 'Mumbai', 1500),
(5, 'Karan', 'Ahmedabad', 2000),
(6, 'Sneha', 'Bardoli', 1200),
(7, 'Vikas', 'Pune', 900),
(8, 'Pooja', 'Surat', 3500),
(9, 'Rohit', 'Delhi', 1100),
(10, 'Anjali', 'Ahmedabad', 700);

SELECT * FROM USERS WHERE NOT CITY = 'Ahmedabad' AND FOLLOWERS  > 1000;

#------------------------------------------------------------------------------------------------------
