/*
==============================================================================================================================================
=================================== SESSION 13 : WINDOW FUNCTION =======================================================================================
==============================================================================================================================================
*/

/*
1. Create a table called Orders with columns: order_id, user_id, order_amount, 
and app_name (e.g., 'Zomato', 'Swiggy', 'Flipkart'). Insert at least 10 sample records
 with different users and apps. Write an SQL query using the OVER() function to display each order's amount along with the total order amount for all orders.
 
*/
DROP TABLE IF EXISTS ORDERS;
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    order_amount DECIMAL(10, 2),
    app_name VARCHAR(50)
);
INSERT INTO Orders (order_id, user_id, order_amount, app_name)
VALUES
(1, 101, 250.00, 'Zomato'),
(2, 102, 450.00, 'Swiggy'),
(3, 101, 1200.00, 'Flipkart'),
(4, 103, 350.00, 'Zomato'),
(5, 104, 800.00, 'Swiggy'),
(6, 102, 1500.00, 'Flipkart'),
(7, 105, 600.00, 'Zomato'),
(8, 103, 950.00, 'Swiggy'),
(9, 106, 2000.00, 'Flipkart'),
(10, 104, 300.00, 'Zomato'),
(11, 107, 700.00, 'Swiggy'),
(12, 105, 1100.00, 'Flipkart');

SELECT
ORDER_ID,
USER_ID,
ORDER_AMOUNT,
SUM(ORDER_AMOUNT)OVER()AS TOTAL_ORDER_AMOUNT,
APP_NAME
FROM ORDERS;

/*
2. Using the Orders table, write an SQL query to show each user's order_id, order_amount, and the average order_amount 
for that user using the OVER(PARTITION BY user_id) clause .HinT: Use AVG(order_amount) OVER(PARTITION BY user_id) to get the per-user average.</em>
*/

SELECT 
USER_ID,
ORDER_ID,
ORDER_AMOUNT,
ROUND(AVG(ORDER_AMOUNT)OVER(partition by USER_ID),2)AS USER_AVG_ORDER_AMT
FROM ORDERS
ORDER BY USER_ID,ORDER_ID;

/*
3.Suppose you have a table called Playlist with columns: song_id, user_id, and duration_sec. Write an SQL query to display each song's duration, 
and the total duration of songs added by each user using SUM(duration_sec) OVER(PARTITION BY user_id).
*/
DROP TABLE IF EXISTS PLAYLIST;
CREATE TABLE Playlist (
    song_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    duration_sec INT NOT NULL
);

INSERT INTO Playlist (song_id, user_id, duration_sec)
VALUES
(1, 101, 180),
(2, 101, 240),
(3, 101, 200),
(4, 102, 150),
(5, 102, 300),
(6, 103, 210),
(7, 103, 180),
(8, 104, 250),
(9, 104, 220),
(10, 105, 190);

SELECT
USER_ID,
SONG_ID,
DURATION_SEC,
SUM(DURATION_SEC)OVER(partition by USER_ID)AS TOTAL_DURATION
FROM PLAYLIST
ORDER BY USER_ID;

/*
4.Given a table named MovieRatings with columns: rating_id, user_id, movie_name, 
and rating (1-5), write an SQL query to show each rating, the average rating per movie, 
and the difference between the user's rating and the movie's average rating using window functions.<br><br><em><strong>Hint:</strong>
 Use AVG(rating) OVER(PARTITION BY movie_name) and subtract it from the user's rating.</em>
*/

DROP TABLE IF EXISTS MOVIERATINGS;
CREATE TABLE MovieRatings (
    rating_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    movie_name VARCHAR(100) NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5)
);

INSERT INTO MovieRatings
    (rating_id, user_id, movie_name, rating)
VALUES
    (1, 101, 'Jawan', 5),
    (2, 102, 'Jawan', 4),
    (3, 103, 'Jawan', 3),
    (4, 104, 'Jawan', 4),
    (5, 101, 'Pathaan', 4),
    (6, 102, 'Pathaan', 5),
    (7, 103, 'Pathaan', 3),
    (8, 104, 'Pathaan', 4),
    (9, 105, '3 Idiots', 5),
    (10, 106, '3 Idiots', 4),
    (11, 107, '3 Idiots', 5),
    (12, 108, '3 Idiots', 3);

SELECT
    rating_id,
    user_id,
    movie_name,
    rating,
    ROUND(
        AVG(rating) OVER (
            PARTITION BY movie_name
        ), 2
    ) AS avg_movie_rating,
    ROUND(
        rating - AVG(rating) OVER (
            PARTITION BY movie_name
        ), 2
    ) AS rating_difference
FROM MovieRatings
ORDER BY movie_name, rating_id;
