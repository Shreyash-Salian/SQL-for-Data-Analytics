#------------------------------------------- SESSION PART 3--------------------------------------------------------------------------------------------------
#------------------------------------------------------------------------------------------------------------------------------------------------------------
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

#-------------------------------------------------------------------------------------------------------------------------------------------------------------
#---------------------------------- SESSION - 4 PART----------------------------------------------------------------------------------------------------------
/*
1. Write an SQL query to find all restaurants in a table called Restaurants whose names end with 'Cafe' using the LIKE operator.
*/
select * from restaurants where restaurant_name like 'Cafe%';
select * from restaurants where restaurant_name like '%se';

/*
2. In a Flipkart-style Products table, use the BETWEEN operator to select all products with a price between 500 and 1500 rupees.
*/
SELECT * FROM PRODUCTS WHERE PRICE BETWEEN 500 AND 1000;

/*
3. Write an SQL query to display all users from a Users table whose city is either 'Ahmedabad', 'Surat', or 'Vadodara' using the IN operator.
*/
SELECT * FROM USERS WHERE CITY IN("Surat","Ahmedabad","Vadodara");

/*
4. Given a table called Songs with columns song_name and artist_name,
 find all songs where the artist_name contains the letter sequence 'ar' anywhere in the name using the LIKE operator
 .<br><br><em><strong>Hint:</strong> Use wildcards on both sides of the pattern.</em>
*/
CREATE TABLE IF NOT EXISTS Songs (
    song_id INT PRIMARY KEY,
    song_name VARCHAR(100),
    artist_name VARCHAR(100)
);

INSERT INTO Songs (song_id, song_name, artist_name)
VALUES
(1, 'Shape of You', 'Ed Sheeran'),
(2, 'Perfect', 'Ed Sheeran'),
(3, 'Roar', 'Katy Perry'),
(4, 'Believer', 'Imagine Dragons'),
(5, 'Havana', 'Camila Cabello'),
(6, 'Love Story', 'Taylor Swift'),
(7, 'Blinding Lights', 'The Weeknd'),
(8, 'Levitating', 'Dua Lipa'),
(9, 'Faded', 'Alan Walker'),
(10, 'Counting Stars', 'OneRepublic');



SELECT * FROM SONGS WHERE ARTIST_NAME LIKE '%ar%';
SELECT * FROM SONGS WHERE ARTIST_NAME LIKE '%pu%';

#-------------------------------------------------------------------------------------------------------------------------------------------------------------
