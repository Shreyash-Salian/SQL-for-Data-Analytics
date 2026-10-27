
/*
==============================================================================================================================================
=================================== SESSION 18 : VIEWS =======================================================================================
==============================================================================================================================================
*/


create database if not exists assignmentPractice;

use assignmentPractice;

/*
1. Create a SQL view named TopRatedRestaurants that selects the restaurant name, 
   average rating, and total number of reviews from a table of Zomato-style restaurant reviews, 	
   showing only restaurants with an average rating above 4.0.
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

CREATE VIEW TopRatedRestaurant As
SELECT
	RESTAURANT_NAME,
    ROUND(AVG(RATING),2)AS AVERAGE_RATING,
    COUNT(*)AS TOTAL_RATING
    FROM RestaurantReviews
    GROUP BY RESTAURANT_NAME
    HAVING AVERAGE_RATING > 4.0;
    
SELECT * FROM TopRatedRestaurant;
    
    
/*2. 
Update the TopRatedRestaurants view to also include the city column from the original restaurants table by joining the relevant tables.
Hint:Use an INNER JOIN to combine data from both tables in your view definition.
.*/

DROP TABLE IF EXISTS Restaurants;
CREATE TABLE Restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100) NOT NULL,
    city VARCHAR(100)
);

INSERT INTO Restaurants (restaurant_id, restaurant_name, city)
VALUES
(1, 'The Spice House', 'Mumbai'),
(2, 'Pizza Palace', 'Pune'),
(3, 'Burger Point', 'Delhi'),
(4, 'Indian Tadka', 'Bengaluru'),
(5, 'Cafe Coffee Time', 'Mumbai');

SELECT * FROM RESTAURANTS;    
SELECT * FROM RestaurantReviews;

SELECT
R.RESTAURANT_NAME,
R.CITY,
ROUND(AVG(RR.RATING),2)AS AVERAGE_RATING,
COUNT(*) AS TOTAL_RATING
FROM RESTAURANTS AS R
INNER JOIN RESTAURANTREVIEWS AS RR
ON R.RESTAURANT_NAME = RR.RESTAURANT_NAME
GROUP BY R.RESTAURANT_NAME,R.RESTAURANT_ID;

CREATE OR REPLACE VIEW TopRatedRestaurant AS
SELECT
	R.RESTAURANT_NAME,
	R.CITY,
	ROUND(AVG(RR.RATING),2)AS AVERAGE_RATING,
	COUNT(*) AS TOTAL_RATING
	FROM RESTAURANTS AS R
	INNER JOIN RESTAURANTREVIEWS AS RR
	ON R.RESTAURANT_NAME = RR.RESTAURANT_NAME
	GROUP BY R.RESTAURANT_NAME,R.RESTAURANT_ID
	HAVING AVERAGE_RATING > 4.0;
    
SELECT * FROM TopRatedRestaurant;


/*
3.Try to update the average rating column directly through the TopRatedRestaurants view and observe what error or limitation occurs. 
Write down the exact error message and explain why this happens based on SQL view limitations.
*/

# STEP 1: TRY TO UPDATE THE VIEW
UPDATE TopRatedRestaurant SET AVERAGE_RATING = 4.9 WHERE RESTAURANT_NAME = "Indian Tadka";

# BELOW IS THE ERROR
#	Error Code: 1288. The target table TopRatedRestaurant of the UPDATE is not updatable
/*
There are following reasons:-
- average_rating is calculated from multiple rows in restaurantreviews. It is not a stored column that can be updated directly.
-  Multiple review records are combined into one row per restaurant, so the database cannot automatically determine which underlying review should change.
- Multiple review records are combined into one row per restaurant, so the database cannot automatically determine which underlying review should change.
*/
#===========================================================================================================================
/*
4. Create a view called DailyOrderSummary that shows, for each date, the total number of food orders
 and the total revenue from a Swiggy-style orders table. Ensure the view only includes dates from the last 30 days.
 Constraint: Use WHERE and GROUP BY clauses in your view definition
*/
DROP TABLE IF EXISTS ORDERS;
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    restaurant_name VARCHAR(100),
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

INSERT INTO Orders
(order_id, customer_name, restaurant_name, order_date, total_amount)
VALUES
(1, 'Rahul', 'Pizza Palace', CURRENT_DATE, 450.00),
(2, 'Priya', 'Burger Point', CURRENT_DATE, 250.00),
(3, 'Amit', 'The Spice House', CURRENT_DATE, 600.00),
(4, 'Sneha', 'Pizza Palace', CURRENT_DATE - INTERVAL 1 DAY, 350.00),
(5, 'Rohan', 'Burger Point', CURRENT_DATE - INTERVAL 1 DAY, 200.00),
(6, 'Neha', 'Indian Tadka', CURRENT_DATE - INTERVAL 2 DAY, 500.00),
(7, 'Karan', 'Pizza Palace', CURRENT_DATE - INTERVAL 5 DAY, 400.00),
(8, 'Pooja', 'Indian Tadka', CURRENT_DATE - INTERVAL 10 DAY, 550.00),
(9, 'Vikas', 'Burger Point', CURRENT_DATE - INTERVAL 20 DAY, 300.00),
(10, 'Anjali', 'Pizza Palace', CURRENT_DATE - INTERVAL 35 DAY, 700.00);

CREATE VIEW DAILYORDERSUMMARY AS
SELECT
ORDER_DATE,
COUNT(ORDER_ID)AS TOTAL_ORDERS
FROM ORDERS
WHERE ORDER_DATE > current_date - interval 29 day
AND ORDER_DATE <= current_date
GROUP BY ORDER_DATE;

SELECT(date_sub(current_date(),interval 29 day));

SELECT * FROM DAILYORDERSUMMARY;

#==============================================================================================
/*
5. List 3 good practices you should follow when creating SQL views for analytics dashboards,
 and for each, give a one-line example related to a Flipkart sales reporting scenario

ANSWER:-
- Uses meaningful columns name:- Choose clear, descriptive column aliases so dashboard users can understand the data easily.
- Filter data appropriately:- Use "where" to include only the data required for the report, improving relevance and potentially reducing the amount of data processed.
- Avoid unnecessary complexity and duplicate calculations:- Keep views focused on a specific reporting purpose and calculate aggregated metrics consistently.

*/

#======================================================#==============#===============#========================#======================#+======================================
#================#===================================#+===================#+===================#=======#=====================================================================

