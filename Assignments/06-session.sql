#----------------------------------------------------------------------------------------------------------------------------------------
#------------------------------ SESSION - 6 -------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------------------------------------------
/*
1.Write an SQL query using the SUM() function to calculate the total amount spent by users on
 food orders in a table food_orders (columns: order_id, user_id, amount) — imagine it's like Zomato's order history.
*/

CREATE TABLE IF NOT EXISTS food_orders (
    order_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL
);

INSERT INTO food_orders (order_id, user_id, amount)
VALUES
(1, 101, 250.00),
(2, 102, 400.00),
(3, 101, 150.00),
(4, 103, 300.00),
(5, 104, 550.00),
(6, 102, 200.00),
(7, 105, 350.00),
(8, 101, 450.00),
(9, 103, 180.00),
(10, 104, 600.00);

SELECT SUM(AMOUNT)AS TOTAL_AMOUNT_SPENT FROM FOOD_ORDERS;

/*
2. Using the COUNT() function, find out how many songs a user has 
added to their playlist in a table spotify_playlists (columns: playlist_id, user_id, song_id).
*/

CREATE TABLE IF NOT EXISTS spotify_playlists (
    playlist_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    song_id INT NOT NULL
);

INSERT INTO spotify_playlists (playlist_id, user_id, song_id)
VALUES
(1, 101, 501),
(2, 101, 502),
(3, 101, 503),
(4, 102, 504),
(5, 102, 505),
(6, 103, 506),
(7, 103, 507),
(8, 103, 508),
(9, 103, 509),
(10, 104, 510),
(11, 101, 511),
(12, 102, 512),
(13, 105, 513),
(14, 105, 514),
(15, 105, 515);

SELECT USER_ID,
COUNT(*)AS TOTAL_SONGS
FROM spotify_playlists
GROUP BY USER_ID
ORDER BY USER_ID;


/*
3. Write an SQL query to get the average rating given to a movie in a table bookmyshow_reviews (columns: review_id, movie_id, rating), 
and round the result to 1 decimal place using the ROUND() function.<br><br><em><strong>Hint:</strong> Use AVG() with ROUND() to format the output.</em>
*/

CREATE TABLE IF NOT EXISTS bookmyshow_reviews (
    review_id INT PRIMARY KEY,
    movie_id INT NOT NULL,
    rating DECIMAL(3,1)
);

INSERT INTO bookmyshow_reviews (review_id, movie_id, rating)
VALUES
(1, 101, 4.5),
(2, 101, 3.8),
(3, 102, 4.2),
(4, 101, 4.7),
(5, 103, 3.5),
(6, 102, 4.8),
(7, 101, 4.0),
(8, 103, 4.5),
(9, 102, 3.9),
(10, 101, 4.3);

SELECT ROUND(AVG(RATING),2)AS AVG_RATING FROM bookmyshow_reviews;

/*
4.Find the minimum and maximum transaction values 
for a user from a table paytm_transactions (columns: txn_id, user_id, amount) — show both the smallest and largest transaction amounts.
*/

CREATE TABLE IF NOT EXISTS paytm_transactions (
    txn_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL
);

INSERT INTO paytm_transactions (txn_id, user_id, amount)
VALUES
(1, 101, 500.00),
(2, 101, 1200.00),
(3, 102, 250.00),
(4, 101, 75.00),
(5, 103, 2500.00),
(6, 102, 800.00),
(7, 101, 3500.00),
(8, 103, 150.00),
(9, 102, 1800.00),
(10, 101, 450.00);

SELECT MIN(AMOUNT)AS MINIMUM_AMT, MAX(AMOUNT)AS MAXIMUM_AMOUNT FROM paytm_transactions;

SELECT user_id,
MIN(AMOUNT)AS MINIMUM_AMT,
MAX(AMOUNT)AS MAXIMUM_AMOUNT 
FROM paytm_transactions
GROUP BY user_id;


/*
5. Given a table myntra_orders (columns: order_id, user_id, total_price), write an SQL query to display the total number of orders,
 the average order value (rounded to 2 decimals),
 and the highest order value for each user_id.<br><br><em><strong>Constraint:</strong> Use GROUP BY to get results per user.</em>
*/

CREATE TABLE IF NOT EXISTS myntra_orders (
    order_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    total_price DECIMAL(10,2) NOT NULL
);

INSERT INTO myntra_orders (order_id, user_id, total_price)
VALUES
(1, 101, 1500.00),
(2, 101, 2500.00),
(3, 102, 800.00),
(4, 101, 1200.00),
(5, 102, 3000.00),
(6, 103, 4500.00),
(7, 102, 1600.00),
(8, 103, 2000.00),
(9, 104, 999.00),
(10, 104, 1999.00),
(11, 101, 3500.00),
(12, 103, 3200.00);

SELECT USER_ID,
COUNT(*)AS TOTAL_ORDERS,
ROUND(AVG(TOTAL_PRICE),2)AS AVG_PRICE,
ROUND(SUM(TOTAL_PRICE),2)AS TOTAL_PRICE,
ROUND(MAX(TOTAL_PRICE),2)AS MAX_PRICE,
ROUND(MIN(TOTAL_PRICE),2)AS MIN_PRICE
FROM myntra_orders
GROUP BY USER_ID
ORDER BY USER_ID;

#-------------------------------------------------------------------------------------------------------------------------------------------------------------
