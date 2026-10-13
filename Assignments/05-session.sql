#---------------------------------------------------------------- SESSION - 5 - PART -----------------------------------------------------------------------------
#-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
1. Write an SQL query using the DISTINCT keyword to find all unique payment methods used in the orders table of a food delivery app database.
*/
CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    restaurant_name VARCHAR(100),
    total_amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    order_status VARCHAR(30)
);
INSERT INTO orders
(order_id, customer_name, restaurant_name, total_amount, payment_method, order_status)
VALUES
(1, 'Rahul', 'Pizza Palace', 450.00, 'UPI', 'Delivered'),
(2, 'Priya', 'Burger Hub', 300.00, 'Cash', 'Delivered'),
(3, 'Amit', 'Spice Garden', 650.00, 'Credit Card', 'Pending'),
(4, 'Neha', 'Dominos', 550.00, 'UPI', 'Delivered'),
(5, 'Karan', 'McDonalds', 250.00, 'Cash', 'Cancelled'),
(6, 'Sneha', 'Subway', 400.00, 'Debit Card', 'Delivered'),
(7, 'Vikas', 'Pizza Palace', 700.00, 'Credit Card', 'Delivered'),
(8, 'Pooja', 'Burger Hub', 350.00, 'UPI', 'Pending'),
(9, 'Rohit', 'Spice Garden', 500.00, 'Wallet', 'Delivered'),
(10, 'Anjali', 'Dominos', 600.00, 'Debit Card', 'Delivered');

SELECT DISTINCT PAYMENT_METHOD FROM ORDERS;

/*
2. Query the users table to list all cities where users have registered, 
but display each city only once and sort the result in alphabetical order (A-Z).

*/
SELECT * FROM USERS ORDER BY CITY;

/*
3. Write an SQL query to select the top 5 most recent movie bookings from the bookings table, ordered by booking_date in descending order.
*/

CREATE TABLE IF NOT EXISTS bookings (
    booking_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    movie_name VARCHAR(100),
    booking_date TIMESTAMP,
    number_of_tickets INT,
    total_amount DECIMAL(10,2)
);
INSERT INTO bookings
(booking_id, customer_name, movie_name, booking_date,
 number_of_tickets, total_amount)
VALUES
(1, 'Rahul', 'Jawan', '2026-10-01 10:30:00', 2, 500.00),
(2, 'Priya', 'Pathaan', '2026-10-05 14:15:00', 3, 750.00),
(3, 'Amit', 'Dangal', '2026-10-03 18:45:00', 2, 400.00),
(4, 'Neha', '3 Idiots', '2026-10-08 12:00:00', 4, 1000.00),
(5, 'Karan', 'Inception', '2026-10-10 20:30:00', 2, 600.00),
(6, 'Sneha', 'Interstellar', '2026-10-12 09:15:00', 3, 900.00),
(7, 'Vikas', 'Drishyam', '2026-10-07 16:20:00', 2, 450.00),
(8, 'Pooja', 'Animal', '2026-10-11 19:00:00', 3, 900.00),
(9, 'Rohit', 'Bhool Bhulaiyaa 3', '2026-10-09 11:45:00', 2, 500.00),
(10, 'Anjali', 'Kalki 2898 AD', '2026-10-13 08:30:00', 4, 1200.00);

SELECT * FROM BOOKINGS ORDER BY BOOKING_DATE DESC LIMIT 5;

/*
4. From a products table containing Flipkart-style product data (id, name, category, sold_count), 
write an SQL query to retrieve the 10 products with the highest sold_count, displaying only product name and sold_count, 
sorted from highest to lowest.<br><br><em><strong>Hint:</strong> Use ORDER BY and LIMIT together to achieve this.</em>
*/

CREATE TABLE products2 (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    sold_count INT
);

INSERT INTO products2 (id, name, category, sold_count)
VALUES
(1, 'Samsung Galaxy Smartphone', 'Electronics', 9500),
(2, 'Wireless Bluetooth Earbuds', 'Electronics', 8200),
(3, 'Men Running Shoes', 'Fashion', 7500),
(4, 'Laptop Backpack', 'Accessories', 6800),
(5, 'Smart LED TV', 'Electronics', 6200),
(6, 'Cotton T-Shirt', 'Fashion', 5900),
(7, 'Wireless Mouse', 'Electronics', 5400),
(8, 'Stainless Steel Water Bottle', 'Home & Kitchen', 4800),
(9, 'Power Bank 20000mAh', 'Electronics', 4500),
(10, 'Digital Wrist Watch', 'Accessories', 4100),
(11, 'Mechanical Keyboard', 'Electronics', 3900),
(12, 'Travel Suitcase', 'Luggage', 3500),
(13, 'Office Chair', 'Furniture', 3200),
(14, 'Electric Kettle', 'Home & Kitchen', 2800),
(15, 'Men Casual Shirt', 'Fashion', 2500);

SELECT NAME,SOLD_COUNT FROM PRODUCTS2 ORDER BY SOLD_COUNT DESC LIMIT 10;
#----------------------------------------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------------------------------------
