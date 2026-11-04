
#==========================================================================================================================================================================
#======================================================= SESSION 14: WINDOW FUNCTION PART 2 ===============================================================================
#==========================================================================================================================================================================

/*
1.Given a table Orders with columns (order_id, user_id, order_date, total_amount), write an SQL query using ROW_NUMBER() 
to assign a unique sequential number to each order per user, ordered by order_date descending.
*/

use assignmentpractice;
DROP TABLE IF EXISTS ORDERS;
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO Orders (order_id, user_id, order_date, total_amount)
VALUES
(101, 1, '2025-01-10', 2500.00),
(102, 1, '2025-02-15', 4500.00),
(103, 1, '2025-03-20', 3200.00),
(104, 2, '2025-01-05', 1500.00),
(105, 2, '2025-02-18', 5500.00),
(106, 3, '2025-01-12', 2000.00),
(107, 3, '2025-03-25', 7000.00),
(108, 3, '2025-04-10', 3500.00),
(109, 4, '2025-02-05', 1800.00),
(110, 4, '2025-04-15', 6000.00);

SELECT
ORDER_ID,
USER_ID,
ORDER_DATE,
TOTAL_AMOUNT,
ROW_NUMBER() OVER(PARTITION BY USER_ID ORDER BY ORDER_DATE DESC)AS ORDER_RANK
FROM ORDERS;

/*
2.Suppose you have a table called Songs with columns (song_id, artist, streams). 
Write an SQL query using RANK() to list each song along with its rank based on streams within each artist.
*/
DROP TABLE IF EXISTS SONGS;
CREATE TABLE Songs (
    song_id INT PRIMARY KEY,
    artist VARCHAR(100),
    streams BIGINT
);

INSERT INTO Songs (song_id, artist, streams)
VALUES
(1, 'Arijit Singh', 5000000),
(2, 'Arijit Singh', 8000000),
(3, 'Arijit Singh', 3000000),
(4, 'Arijit Singh', 8000000),
(5, 'Shreya Ghoshal', 6000000),
(6, 'Shreya Ghoshal', 9000000),
(7, 'Shreya Ghoshal', 4000000),
(8, 'Armaan Malik', 7000000),
(9, 'Armaan Malik', 5000000),
(10, 'Armaan Malik', 9000000);

SELECT
SONG_ID,
ARTIST,
STREAMS,
RANK()OVER(PARTITION BY ARTIST ORDER BY STREAMS DESC)AS SONG_RANK
FROM SONGS;


/*
3.For a table named Movies with columns (movie_id, genre, rating), 
write an SQL query using DENSE_RANK() to assign a rank to each movie within its genre based on rating, with the highest rating getting rank 1.
*/
DROP TABLE IF EXISTS MOVIES;
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    genre VARCHAR(50),
    rating DECIMAL(3,1)
);

INSERT INTO Movies (movie_id, genre, rating)
VALUES
(1, 'Action', 8.5),
(2, 'Action', 9.2),
(3, 'Action', 8.5),
(4, 'Action', 7.8),
(5, 'Comedy', 7.5),
(6, 'Comedy', 8.8),
(7, 'Comedy', 8.0),
(8, 'Comedy', 8.8),
(9, 'Drama', 9.0),
(10, 'Drama', 8.5),
(11, 'Drama', 7.5),
(12, 'Drama', 9.5);

SELECT
MOVIE_ID,
GENRE,
RATING,
DENSE_RANK()OVER(PARTITION BY GENRE ORDER BY RATING DESC)AS MOVIE_RATING
FROM MOVIES;

/*
4.Imagine a table named Influencers with columns (id, platform, followers). Write an SQL query to display the top 3 influencers per platform using ROW_NUMBER(),
 showing id, platform, followers, and their row number.<br><br><em><strong>Hint:</strong> Use a subquery or CTE to filter for row numbers less than or equal to 3.</em>
*/
DROP TABLE IF EXISTS Influencers;
CREATE TABLE Influencers (
    id INT PRIMARY KEY,
    platform VARCHAR(50),
    followers BIGINT
);

INSERT INTO Influencers (id, platform, followers)
VALUES
(1, 'Instagram', 500000),
(2, 'Instagram', 900000),
(3, 'Instagram', 750000),
(4, 'Instagram', 1200000),
(5, 'Instagram', 300000),
(6, 'YouTube', 2500000),
(7, 'YouTube', 5000000),
(8, 'YouTube', 3500000),
(9, 'YouTube', 1500000),
(10, 'YouTube', 4200000),
(11, 'Facebook', 800000),
(12, 'Facebook', 600000),
(13, 'Facebook', 1500000),
(14, 'Facebook', 2000000),
(15, 'Facebook', 1100000);


WITH RankedInfluencers AS (
    SELECT
        id,
        platform,
        followers,
        ROW_NUMBER() OVER (
            PARTITION BY platform
            ORDER BY followers DESC
        ) AS row_num
    FROM Influencers
)
SELECT
    id,
    platform,
    followers,
    row_num
FROM RankedInfluencers
WHERE row_num <= 3
ORDER BY platform, row_num;
