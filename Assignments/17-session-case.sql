#=================================================== SESSION 16 - CASE ===========================================================================================
#================================================================================================================================================================
/*
1. Write an SQL query using CASE WHEN to classify orders in a 'FoodOrders' table as 'Small', 'Medium', or 'Large' based on the total_amount:
 'Small' for less than 300, 'Medium' for 300 to 999, and 'Large' for 1000 and above.
*/
DROP TABLE IF EXISTS FOODORDERS;
CREATE TABLE FoodOrders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    total_amount DECIMAL(10,2)
);

INSERT INTO FoodOrders (order_id, customer_name, total_amount)
VALUES
(1, 'Rahul', 250),
(2, 'Priya', 500),
(3, 'Amit', 999),
(4, 'Neha', 1200),
(5, 'Vikas', 150),
(6, 'Pooja', 300),
(7, 'Karan', 2500);


SELECT 
ORDER_ID,
CUSTOMER_NAME,
TOTAL_AMOUNT,
CASE
	WHEN TOTAL_AMOUNT < 300 THEN "SMALL"
    WHEN TOTAL_AMOUNT BETWEEN 300 AND 999 THEN "MEDIUM"
    WHEN TOTAL_AMOUNT > 1000 THEN "LARGE"
END AS ORDER_CATEGORY
FROM FOODORDERS;

/*
2. Given a 'Movies' table with a 'rating' column (out of 10), write an SQL query that adds a new column 'popularity' which shows 'Blockbuster' for ratings 8 and above, 
'Hit' for 5 to 7.9, and 'Average' for below 5 using CASE WHEN ELSE END.
*/
DROP TABLE IF EXISTS MOVIES;
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(100),
    rating DECIMAL(3,1)
);

INSERT INTO Movies (movie_id, movie_name, rating)
VALUES
(1, 'Dangal', 8.4),
(2, 'Pathaan', 7.2),
(3, '3 Idiots', 8.4),
(4, 'Race 3', 3.5),
(5, 'Jawan', 7.8),
(6, 'Housefull 4', 4.2),
(7, 'Baahubali 2', 9.0),
(8, 'Movie X', 5.0);

SELECT 
MOVIE_ID,
MOVIE_NAME,
RATING,
CASE 
	WHEN RATING >= 8 THEN "BLOCKBUSTER" 
    WHEN RATING >= 5 THEN "HIT"
    ELSE "AVERAGE"
END AS POPULARITY
FROM MOVIES;

/*
3. For a 'FlipkartProducts' table with a 'price' column, write an SQL query to create a 'price_category'
 column that bins prices as 'Budget' (below 500), 'Standard' (500 to 2000), and 'Premium' (above 2000) using CASE WHEN.
*/

DROP TABLE IF EXISTS FlipkartProducts;
CREATE TABLE FlipkartProducts (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

INSERT INTO FlipkartProducts (product_id, product_name, price)
VALUES
(1, 'Wireless Mouse', 399),
(2, 'Keyboard', 799),
(3, 'Headphones', 1500),
(4, 'Smartphone', 15000),
(5, 'USB Cable', 199),
(6, 'Power Bank', 2000),
(7, 'Laptop', 55000),
(8, 'Smart Watch', 499);

SELECT 
PRODUCT_ID,
PRODUCT_NAME,
PRICE,
CASE
	WHEN PRICE < 500 THEN "BUDGET"
    WHEN PRICE BETWEEN 500 AND 2000 THEN "STANDARD"
    ELSE "PREMIUM"
END AS PRICE_CATEGORY
FROM FLIPKARTPRODUCTS;

/*
4. Write an SQL query for a 'SpotifyTracks' table that uses CASE WHEN to assign a 'duration_label' 
column: 'Short' for tracks under 180 seconds, 'Medium' for 180-300 seconds, and 'Long' for over 300 seconds.
Hint: Use multiple WHEN conditions to cover all possible durations.
*/
DROP TABLE IF EXISTS SpotifyTracks;
CREATE TABLE SpotifyTracks (
    track_id INT PRIMARY KEY,
    track_name VARCHAR(100),
    duration_seconds INT
);

INSERT INTO SpotifyTracks (track_id, track_name, duration_seconds)
VALUES
(1, 'Tum Hi Ho', 240),
(2, 'Kesariya', 268),
(3, 'Heeriye', 178),
(4, 'Apna Bana Le', 252),
(5, 'Instrumental Track', 150),
(6, 'Live Concert Track', 360),
(7, 'Short Song', 179),
(8, 'Long Song', 301),
(9, 'Medium Song', 300);

SELECT 
TRACK_ID,
TRACK_NAME,
DURATION_SECONDS,
CASE
	WHEN DURATION_SECONDS < 180 THEN "SHORT"
    WHEN DURATION_SECONDS BETWEEN 180 AND 300 THEN "MEDIUM"
    ELSE "LONG"
END AS DURATION_LABEL
FROM SpotifyTracks;

#===================================================================================================================================
