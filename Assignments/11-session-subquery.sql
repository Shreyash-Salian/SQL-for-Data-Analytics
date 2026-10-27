/*
==============================================================================================================================================
=================================== SESSION 11 : SUBQUERY =======================================================================================
==============================================================================================================================================
*/

/*
1. Write a SQL query to display the names and ratings of restaurants (from a table named Restaurants) where the rating 
is higher than the average rating of all restaurants in the table.
<Hint>Use a subquery in the WHERE clause to calculate the average rating.

*/
DROP TABLE IF EXISTS RestaurantReviews; 
CREATE TABLE RestaurantReviews (
    review_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100) NOT NULL,
    customer_name VARCHAR(100),
    rating DECIMAL(2,1),
    review_text VARCHAR(255),
    review_date DATE
);

INSERT INTO RestaurantReviews
(review_id, restaurant_name, customer_name, rating, review_text, review_date)
VALUES
(1, 'The Spice House', 'Rahul', 4.5, 'Excellent food', '2026-01-10'),
(2, 'The Spice House', 'Priya', 4.8, 'Great service', '2026-01-11'),
(3, 'The Spice House', 'Amit', 4.2, 'Delicious dishes', '2026-01-12'),

(4, 'Pizza Palace', 'Sneha', 4.2, 'Good pizza', '2026-01-13'),
(5, 'Pizza Palace', 'Rohan', 3.8, 'Average experience', '2026-01-14'),
(6, 'Pizza Palace', 'Neha', 4.0, 'Nice ambience', '2026-01-15'),

(7, 'Burger Point', 'Karan', 3.5, 'Average burger', '2026-01-16'),
(8, 'Burger Point', 'Pooja', 3.8, 'Could be better', '2026-01-17'),

(9, 'Indian Tadka', 'Vikas', 4.7, 'Amazing food', '2026-01-18'),
(10, 'Indian Tadka', 'Anjali', 4.9, 'Excellent taste', '2026-01-19'),
(11, 'Indian Tadka', 'Ravi', 4.6, 'Highly recommended', '2026-01-20'),

(12, 'Cafe Coffee Time', 'Meera', 4.1, 'Good coffee', '2026-01-21'),
(13, 'Cafe Coffee Time', 'Arjun', 4.3, 'Nice place', '2026-01-22');
SELECT * FROM RESTAURANTREVIEWS WHERE RATING > (SELECT AVG(RATING) FROM RESTAURANTREVIEWS);

/*
2.In a Flipkart-style Products table (columns: product_id, name, price, category), write a SQL query to list each product name 
along with the average price of its category as an additional column using a scalar subquery in the SELECT statement.
*/
DROP TABLE IF EXISTS PRODUCTS;
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    category VARCHAR(50)
);
INSERT INTO Products (product_id, name, price, category)
VALUES
(1, 'iPhone 17', 80000, 'Mobile'),
(2, 'Samsung Galaxy', 40000, 'Mobile'),
(3, 'OnePlus Nord', 60000, 'Mobile'),
(4, 'HP Laptop', 60000, 'Laptop'),
(5, 'Dell Laptop', 50000, 'Laptop'),
(6, 'Lenovo ThinkPad', 70000, 'Laptop'),
(7, 'Boat Headphones', 2000, 'Accessories'),
(8, 'Sony Headphones', 5000, 'Accessories'),
(9, 'JBL Earbuds', 3000, 'Accessories'),
(10, 'iPad', 45000, 'Tablet');


SELECT
    p.name,
    p.price,
    p.category,
    (
        SELECT ROUND(AVG(p2.price),2)
        FROM Products AS p2
        WHERE p2.category = p.category
    ) AS avg_category_price
FROM Products AS p;

/*
3.Given a Playlists table (playlist_id, user_id, playlist_name) and a Users table (user_id, username), 
write a SQL query using a subquery in the FROM clause to show each username and the number of playlists they have created, 
displaying only users who have created more playlists than the average number of playlists per user.<br><br><em><strong>Hint:</strong>
 Use a derived table (subquery in FROM) to count playlists per user, then filter with a subquery in WHERE
*/
CREATE TABLE IF NOT EXISTS USERS;
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(100) NOT NULL
);

INSERT INTO Users (user_id, username)
VALUES
(1, 'Rahul'),
(2, 'Priya'),
(3, 'Amit'),
(4, 'Sneha'),
(5, 'Rohan'),
(6, 'Neha'),
(7, 'Karan'),
(8, 'Pooja'),
(9, 'Vikas'),
(10, 'Anjali');


DROP TABLE IF EXISTS PLAYLISTS;
CREATE TABLE Playlists (
    playlist_id INT PRIMARY KEY,
    user_id INT,
    playlist_name VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Playlists (playlist_id, user_id, playlist_name)
VALUES
(1, 1, 'Bollywood Hits'),
(2, 1, 'Workout Music'),
(3, 1, 'Romantic Songs'),
(4, 2, 'Party Mix'),
(5, 2, 'Chill Vibes'),
(6, 3, 'Arijit Singh Hits'),
(7, 4, 'Travel Songs'),
(8, 4, '90s Classics'),
(9, 4, 'Study Music'),
(10, 4, 'Morning Motivation'),
(11, 5, 'English Pop'),
(12, 6, 'Relaxing Music'),
(13, 6, 'Gym Beats'),
(14, 7, 'Punjabi Hits'),
(15, 8, 'Indie Music');


SELECT
    u.username,
    pc.total_playlists
FROM Users AS u
INNER JOIN (
    SELECT
        user_id,
        COUNT(playlist_id) AS total_playlists
    FROM Playlists
    GROUP BY user_id
) AS pc
    ON u.user_id = pc.user_id
WHERE pc.total_playlists > (
    SELECT AVG(user_playlist_count)
    FROM (
        SELECT COUNT(playlist_id) AS user_playlist_count
        FROM Playlists
        GROUP BY user_id
    ) AS avg_counts
);

/*
4. Suppose you have an Orders table (order_id, user_id, total_amount) for a food delivery app. Write a query to find all user_ids who have placed at least one order with a 
total_amount greater than the average order amount, using a subquery in the WHERE clause.
*/
DROP TABLE IF EXISTS ORDERS;
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL
);

INSERT INTO Orders (order_id, user_id, total_amount)
VALUES
(1, 1, 250.00),
(2, 1, 800.00),
(3, 2, 350.00),
(4, 2, 600.00),
(5, 3, 1200.00),
(6, 3, 450.00),
(7, 4, 150.00),
(8, 4, 900.00),
(9, 5, 700.00),
(10, 6, 300.00),
(11, 6, 1100.00),
(12, 7, 400.00),
(13, 8, 650.00),
(14, 9, 200.00),
(15, 10, 1000.00);

SELECT 
DISTINCT(USER_ID)
FROM ORDERS WHERE TOTAL_AMOUNT > (SELECT AVG(TOTAL_AMOUNT) FROM ORDERS);

