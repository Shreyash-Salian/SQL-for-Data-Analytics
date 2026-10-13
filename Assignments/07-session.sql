#-------------------------------------------------------------------------------------------------------------------------------------------------------------
#------------------------------------------- SESSION 7 --------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
1. Write an SQL query to display the total number of orders placed by each user in a 'food_orders' table, grouped by user_id.
*/
SELECT * FROM FOOD_ORDERS;

SELECT USER_ID,
COUNT(ORDER_ID)AS TOTAL_ORDERS
FROM FOOD_ORDERS
GROUP BY USER_ID
ORDER BY USER_ID;


/*2. 
Using a 'transactions' table with columns (transaction_id, user_id, amount, payment_method), 
write an SQL query to show the total amount spent by each payment_method.
*/
CREATE TABLE IF NOT EXISTS transactions (
    transaction_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(50)
);

INSERT INTO transactions
(transaction_id, user_id, amount, payment_method)
VALUES
(1, 101, 500.00, 'UPI'),
(2, 102, 1200.00, 'Credit Card'),
(3, 101, 250.00, 'UPI'),
(4, 103, 800.00, 'Debit Card'),
(5, 102, 450.00, 'Cash'),
(6, 104, 1500.00, 'Credit Card'),
(7, 103, 300.00, 'UPI'),
(8, 101, 700.00, 'Cash'),
(9, 104, 900.00, 'Debit Card'),
(10, 102, 600.00, 'UPI'),
(11, 105, 1100.00, 'Credit Card'),
(12, 105, 350.00, 'Cash');

SELECT PAYMENT_METHOD,
COUNT(AMOUNT)AS AMOUNT_SPENT
FROM TRANSACTIONS
GROUP BY PAYMENT_METHOD
ORDER BY PAYMENT_METHOD;

/*3.Given a 'movies' table with columns (movie_id, genre, box_office_collection), write an SQL query to display each genre and its
 total box_office_collection, but only show genres where the total
 collection is above 10 crore.<br><br><em><strong>Hint:</strong> Use GROUP BY and HAVING together to filter the aggregated results.</em>

*/

CREATE TABLE IF NOT EXISTS movies2 (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(100),
    genre VARCHAR(50),
    box_office_collection DECIMAL(10,2)
);

INSERT INTO movies2
(movie_id, movie_name, genre, box_office_collection)
VALUES
(1, 'Jawan', 'Action', 11.50),
(2, 'Pathaan', 'Action', 10.50),
(3, 'Dangal', 'Drama', 8.00),
(4, '3 Idiots', 'Comedy', 6.00),
(5, 'KGF Chapter 2', 'Action', 12.00),
(6, 'Taare Zameen Par', 'Drama', 3.50),
(7, 'Housefull 4', 'Comedy', 5.00),
(8, 'Gadar 2', 'Action', 7.00),
(9, 'Andhadhun', 'Thriller', 4.00),
(10, 'Drishyam 2', 'Thriller', 5.50),
(11, 'Chennai Express', 'Comedy', 4.50),
(12, 'Bajrangi Bhaijaan', 'Drama', 9.00);

SELECT GENRE,
SUM(BOX_OFFICE_COLLECTION)AS TOTAL_INCOME
FROM MOVIES2
GROUP BY GENRE
HAVING TOTAL_INCOME > 10.00;

/*
4.
Suppose you have a 'playlist' table with columns (playlist_id, user_id, song_id, duration). Write an SQL query to find users who have created playlists
 with a combined song duration of more than 2 hours (7200 seconds), showing user_id and total duration.
*/

CREATE TABLE IF NOT EXISTS playlist2 (
    playlist_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    duration INT NOT NULL
);

INSERT INTO playlist2 (playlist_id, user_id, song_id, duration)
VALUES
(1, 101, 501, 2400),
(2, 101, 502, 2100),
(3, 101, 503, 3000),
(4, 102, 504, 1800),
(5, 102, 505, 2000),
(6, 102, 506, 1500),
(7, 103, 507, 3600),
(8, 103, 508, 4000),
(9, 104, 509, 2200),
(10, 104, 510, 2600),
(11, 104, 511, 2800),
(12, 105, 512, 1900),
(13, 105, 513, 1700);

SELECT * FROM PLAYLIST2;

SELECT USER_ID,
SUM(DURATION)AS TOTAL_DURATION
FROM PLAYLIST2
GROUP BY USER_ID
HAVING TOTAL_DURATION > 7200
ORDER BY USER_ID;

#-------------------------------------------------------------------------------------------------------------------------------------------------------
