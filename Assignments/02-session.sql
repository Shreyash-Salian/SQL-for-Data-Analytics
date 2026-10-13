
/*
1. Open your SQL editor and run a query to select all columns from a table named restaurants using SELECT * FROM restaurants;.

*/
DROP TABLE restaurants;
CREATE TABLE IF NOT EXISTS restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100) NOT NULL,
    cuisine VARCHAR(50),
    city VARCHAR(50),
    rating DECIMAL(2,1),
    price_range VARCHAR(20)
);

INSERT INTO restaurants
(restaurant_id, restaurant_name, cuisine, city, rating, price_range)
VALUES
(1, 'Spice Garden', 'Indian', 'Mumbai', 4.5, 'Medium'),
(2, 'Pizza Palace', 'Italian', 'Surat', 4.2, 'Medium'),
(3, 'Dragon House', 'Chinese', 'Ahmedabad', 4.0, 'Low'),
(4, 'Royal Thali', 'Gujarati', 'Vadodara', 4.7, 'Low'),
(5, 'Burger Hub', 'Fast Food', 'Pune', 3.9, 'Medium'),
(6, 'Tandoori Nights', 'North Indian', 'Delhi', 4.4, 'High'),
(7, 'South Spice', 'South Indian', 'Chennai', 4.3, 'Low'),
(8, 'Pasta Corner', 'Italian', 'Bengaluru', 4.1, 'High'),
(9, 'Curry House', 'Indian', 'Jaipur', 4.6, 'Medium'),
(10, 'Sushi World', 'Japanese', 'Mumbai', 4.2, 'High');

SELECT * FROM RESTAURANTS;

/*
2. Write an SQL query to display only the name and rating columns from the table zomato_reviews.
*/
CREATE TABLE IF NOT EXISTS zomato_reviews (
    review_id INT PRIMARY KEY,
    name VARCHAR(100),
    rating DECIMAL(2,1),
    restaurant_name VARCHAR(100),
    city VARCHAR(50),
    review TEXT
);

INSERT INTO zomato_reviews
(review_id, name, rating, restaurant_name, city, review)
VALUES
(1, 'Rahul', 4.5, 'Spice Garden', 'Surat', 'Excellent food and service'),
(2, 'Priya', 4.0, 'Pizza Palace', 'Mumbai', 'Good pizza'),
(3, 'Amit', 3.5, 'Dragon House', 'Ahmedabad', 'Average experience'),
(4, 'Neha', 4.8, 'Royal Thali', 'Vadodara', 'Amazing Gujarati thali'),
(5, 'Vikas', 2.5, 'Burger Hub', 'Pune', 'Slow service'),
(6, 'Sneha', 4.2, 'South Spice', 'Chennai', 'Delicious dosa'),
(7, 'Karan', 3.9, 'Pasta Corner', 'Bengaluru', 'Good pasta'),
(8, 'Pooja', 4.7, 'Curry House', 'Jaipur', 'Tasty food'),
(9, 'Rohit', 3.0, 'Sushi World', 'Mumbai', 'Could be better'),
(10, 'Anjali', 4.4, 'Tandoori Nights', 'Delhi', 'Great food');

SELECT NAME,RATING FROM zomato_reviews;

/*
3. Write an SQL query to select the movie_name and release_year columns
 from a table called movies, but rename movie_name as 'Title' and release_year as 'Year Released' in the output using the AS keyword.
*/

CREATE TABLE IF NOT EXISTS movies (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(100) NOT NULL,
    release_year INT,
    genre VARCHAR(50),
    rating DECIMAL(3,1)
);

INSERT INTO movies
(movie_id, movie_name, release_year, genre, rating)
VALUES
(1, '3 Idiots', 2009, 'Comedy-Drama', 8.4),
(2, 'Dangal', 2016, 'Sports-Drama', 8.3),
(3, 'Inception', 2010, 'Sci-Fi', 8.8),
(4, 'Interstellar', 2014, 'Sci-Fi', 8.7),
(5, 'Jawan', 2023, 'Action', 7.0),
(6, 'Pathaan', 2023, 'Action', 5.8),
(7, 'Taare Zameen Par', 2007, 'Drama', 8.3),
(8, 'Drishyam', 2015, 'Thriller', 8.2),
(9, 'Lagaan', 2001, 'Sports-Drama', 8.1),
(10, 'The Dark Knight', 2008, 'Action', 9.0);

SELECT * FROM MOVIES;

SELECT
    movie_name AS "Title",
    release_year AS "YearReleased"
FROM movies;

/*
4. 
In a table called products, write an SQL query that selects all columns and add a comment in your SQL code explaining what the query 
does.<br><br><em><strong>Hint:</strong> Use -- to write a single-line comment above your query.</em>
*/

select * from movies;
#--This query will list all the fields from the movies table-----
