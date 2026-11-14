#==========================================================================================================================================================================
#======================================================= SESSION 12: COMMON TABLE EXPRESSION (CTE)==============================================================================
#==========================================================================================================================================================================
use assignmentpractice;

/*
1. Write an SQL query using the WITH clause to create a temporary result set called TopArtists that selects the top 3 most-followed artists
 from a table SpotifyArtists (columns: artist_id, name, followers), then select all rows from TopArtists.
*/

DROP TABLE IF EXISTS SpotifyArtists;

CREATE TABLE SpotifyArtists
(
    artist_id INT PRIMARY KEY,
    name VARCHAR(100),
    followers BIGINT
);

INSERT INTO SpotifyArtists (artist_id, name, followers)
VALUES
(1, 'Arijit Singh', 85000000),
(2, 'Taylor Swift', 120000000),
(3, 'Ed Sheeran', 110000000),
(4, 'Justin Bieber', 95000000),
(5, 'The Weeknd', 105000000),
(6, 'Shreya Ghoshal', 45000000),
(7, 'Ariana Grande', 90000000),
(8, 'Diljit Dosanjh', 30000000),
(9, 'Drake', 115000000),
(10, 'Atif Aslam', 40000000);

with topArtistsCTE as
(
	select
    artist_id,
    name,
    followers
    from SpotifyArtists order by followers desc limit 3
)
select * from topArtistsCTE;

/*
2. Using a table named FlipkartOrders (columns: order_id, user_id, order_date, total_amount), write a query with a 
CTE called MonthlyTotals that calculates the total sales amount for each month in 2023, then select
 the month with the highest total sales from MonthlyTotals.Hint Use EXTRACT(MONTH FROM order_date) 
or DATE_FORMAT(order_date, '%m') depending on your SQL dialect.
*/
DROP TABLE IF EXISTS FlipkartOrders;
CREATE TABLE FlipkartOrders
(
    order_id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);
INSERT INTO FlipkartOrders
(order_id, user_id, order_date, total_amount)
VALUES
(1, 101, '2023-01-05', 15000),
(2, 102, '2023-01-15', 25000),
(3, 103, '2023-02-10', 18000),
(4, 104, '2023-02-20', 22000),
(5, 105, '2023-03-12', 30000),
(6, 106, '2023-03-25', 35000),
(7, 107, '2023-04-08', 12000),
(8, 108, '2023-04-18', 28000),
(9, 109, '2023-05-11', 45000),
(10, 110, '2023-05-22', 40000),
(11, 111, '2023-06-09', 50000),
(12, 112, '2023-06-19', 55000),
(13, 113, '2023-07-05', 25000),
(14, 114, '2023-07-15', 30000),
(15, 115, '2023-08-10', 60000),
(16, 116, '2023-08-20', 65000),
(17, 117, '2023-09-12', 35000),
(18, 118, '2023-09-22', 40000),
(19, 119, '2023-10-08', 75000),
(20, 120, '2023-10-18', 80000),
(21, 121, '2023-11-11', 90000),
(22, 122, '2023-11-21', 95000),
(23, 123, '2023-12-05', 110000),
(24, 124, '2023-12-15', 120000);

with MonthlyTotalsCTE as (
		select
		date_format(order_date,"%b")as orderDate,
        month(order_date)as orderMonth,
        sum(total_amount) as totalAmt
		from FlipkartOrders
        WHERE YEAR(order_date) = 2023
        group by date_format(order_date,"%b"),orderMonth
        order by orderMonth
)

select * from MonthlyTotalsCTE;

/*
3. Create a recursive CTE to generate a list of dates for the next 7 days starting from today in a table called CalendarDays (columns: day_date).
Hint:Use UNION ALL inside your CTE and limit recursion to 7 levels.
*/

DROP TABLE IF EXISTS CalendarDays;

CREATE TABLE CalendarDays
(
    day_date DATE
);

WITH RECURSIVE CalendarCTE AS
(
    -- Anchor member: Starting date
    SELECT
        CURDATE() AS day_date,
        1 AS day_number

    UNION ALL

    -- Recursive member: Add one day
    SELECT
        DATE_ADD(day_date, INTERVAL 1 DAY),
        day_number + 1
    FROM CalendarCTE
    WHERE day_number < 7
)
SELECT
    day_date
FROM CalendarCTE;

/*
4. Given a table called ZomatoRestaurants (columns: id, name, city, rating), use a CTE to 
find the average rating for each city, then select all restaurants in cities where the average rating is above 4.0.
*/
DROP TABLE IF EXISTS ZomatoRestaurants;

CREATE TABLE ZomatoRestaurants
(
    id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50),
    rating DECIMAL(3,1)
);

INSERT INTO ZomatoRestaurants
(id, name, city, rating)
VALUES
(1, 'Paradise Biryani', 'Hyderabad', 4.5),
(2, 'Bawarchi', 'Hyderabad', 4.3),
(3, 'Mehfil', 'Hyderabad', 3.8),
(4, 'Truffles', 'Bangalore', 4.6),
(5, 'Empire Restaurant', 'Bangalore', 4.2),
(6, 'A2B', 'Chennai', 3.9),
(7, 'Murugan Idli', 'Chennai', 4.1),
(8, 'Joey Pizza', 'Mumbai', 4.7),
(9, 'Pizza By The Bay', 'Mumbai', 4.5),
(10, 'Cafe Mondegar', 'Mumbai', 4.3);

WITH CityRatings AS
(
    SELECT
        city,
        AVG(rating) AS avg_rating
    FROM ZomatoRestaurants
    GROUP BY city
)
SELECT
    zr.id,
    zr.name,
    zr.city,
    zr.rating,
    cr.avg_rating
FROM ZomatoRestaurants AS zr
INNER JOIN CityRatings AS cr
    ON zr.city = cr.city
WHERE cr.avg_rating > 4.0;

/*
5. Use ChatGPT or Copilot to help you write an SQL query with a CTE that, given a table IPLMatches (columns: match_id, team, runs, match_year), 
calculates the total runs scored by each team in 2023 and lists only teams with more than 2000 runs.
*/

DROP TABLE IF EXISTS IPLMatches;

CREATE TABLE IPLMatches
(
    match_id INT PRIMARY KEY,
    team VARCHAR(100),
    runs INT,
    match_year INT
);

INSERT INTO IPLMatches
(match_id, team, runs, match_year)
VALUES
(1, 'Mumbai Indians', 210, 2023),
(2, 'Chennai Super Kings', 185, 2023),
(3, 'Royal Challengers Bangalore', 220, 2023),
(4, 'Mumbai Indians', 195, 2023),
(5, 'Chennai Super Kings', 215, 2023),
(6, 'Royal Challengers Bangalore', 180, 2023),
(7, 'Mumbai Indians', 230, 2023),
(8, 'Chennai Super Kings', 205, 2023),
(9, 'Royal Challengers Bangalore', 240, 2023),
(10, 'Mumbai Indians', 250, 2023),
(11, 'Chennai Super Kings', 190, 2023),
(12, 'Royal Challengers Bangalore', 210, 2023),
(13, 'Gujarat Titans', 220, 2023),
(14, 'Gujarat Titans', 200, 2023),
(15, 'Gujarat Titans', 180, 2023),
(16, 'Mumbai Indians', 215, 2022),
(17, 'Chennai Super Kings', 230, 2022);



with TeamTotalRunsCTE as
(
	select
		team,
		sum(runs)as total_runs
		from IPLMatches
    where match_year = 2023
    group by team
)

-- select
-- 	team,
--     total_runs
--     from TeamTotalRunsCTE where total_runs > 2000;
    
select
	team,
    total_runs
    from TeamTotalRunsCTE where total_runs > 800;

#==========================================================================================================================================================================
#==========================================================================================================================================================================
