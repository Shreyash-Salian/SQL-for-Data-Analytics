#==========================================================================================================================================================================
#======================================================= SESSION 09: ADVANCED JOIN ========================================================================================
#==========================================================================================================================================================================
use assignmentpractice;
/*
1. Create two tables, influencers and brands, with at least 3 sample rows each. Use a FULL OUTER JOIN to list all influencers and brands,
 showing influencer_name and brand_name, matching on city. If there is no match, display NULL for the missing side.
 Hint:Use LEFT JOIN, RIGHT JOIN, and UNION if your SQL dialect does not support FULL OUTER JOIN directly.
*/
DROP TABLE IF EXISTS influencers;
CREATE TABLE influencers (
    influencer_id INT PRIMARY KEY,
    influencer_name VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO influencers (influencer_id, influencer_name, city)
VALUES
(1, 'Rahul Sharma', 'Mumbai'),
(2, 'Priya Patel', 'Delhi'),
(3, 'Aarav Mehta', 'Pune'),
(4, 'Sneha Kapoor', 'Bangalore'),
(5, 'Rohan Singh', 'Jaipur');

DROP TABLE IF EXISTS brands;
CREATE TABLE brands (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(100),
    city VARCHAR(50)
);


INSERT INTO brands (brand_id, brand_name, city)
VALUES
(101, 'Nike', 'Mumbai'),
(102, 'Adidas', 'Delhi'),
(103, 'Puma', 'Hyderabad'),
(104, 'Zara', 'Chennai'),
(105, 'H&M', 'Pune');

SELECT 
i.influencer_name,
i.city,
b.brand_name
from influencers as i
left join brands as b
on i.city = b.city
union
SELECT 
i.influencer_name,
i.city,
b.brand_name
from influencers as i
right join brands as b
on i.city = b.city;


/*
2. Given a table called playlists with columns (id, playlist_name, parent_playlist_id), 
write a SELF JOIN query to display each playlist alongside its parent playlist's name, similar to how Spotify might nest playlists.
*/
DROP TABLE IF EXISTS playlists;
CREATE TABLE playlists (
    id INT PRIMARY KEY,
    playlist_name VARCHAR(100),
    parent_playlist_id INT,
    FOREIGN KEY (parent_playlist_id) REFERENCES playlists(id)
);

INSERT INTO playlists (id, playlist_name, parent_playlist_id)
VALUES
(1, 'My Music', NULL),
(2, 'Workout Music', 1),
(3, 'Relaxing Music', 1),
(4, 'Gym Motivation', 2),
(5, 'Running Songs', 2),
(6, 'Peaceful Instrumentals', 3),
(7, 'Morning Music', NULL),
(8, 'Morning Motivation', 7);

select
p.id,
p.playlist_name as playlist_name,
p.parent_playlist_id,
parent.playlist_name as parent_playlist_name
from playlists as p
left join playlists as parent
ON p.parent_playlist_id = parent.id;

/*
3. Create two tables: users and offers. Write a CROSS JOIN query to generate all possible combinations of users and offers, 
displaying user_name and offer_title. Explain in a comment how this could be used for a Flipkart-style personalized offer campaign.
*/
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO users (user_id, user_name, city)
VALUES
(1, 'Rahul Sharma', 'Mumbai'),
(2, 'Priya Patel', 'Delhi'),
(3, 'Aarav Mehta', 'Pune'),
(4, 'Sneha Kapoor', 'Bangalore'),
(5, 'Rohan Singh', 'Jaipur');

DROP TABLE IF EXISTS offers;
CREATE TABLE offers (
    offer_id INT PRIMARY KEY,
    offer_title VARCHAR(100),
    discount_percentage INT
);

INSERT INTO offers (offer_id, offer_title, discount_percentage)
VALUES
(101, 'Diwali Sale', 50),
(102, 'New User Discount', 20),
(103, 'Mega Electronics Sale', 40),
(104, 'Fashion Special Offer', 30);

select
u.user_id,
u.user_name,
u.city,
o.offer_title,
o.discount_percentage
from users as u
cross join offers as o;

-- Business Application:
-- Generate every possible user-offer combination.
-- The marketing team can use these combinations
-- to evaluate which offers should be targeted to which users.

/*
4.
You have an employees table with columns (id, name, manager_id). Write a SELF JOIN to display each employee's name along with their manager's name.
 Then, modify your query to only show employees who do not have a manager (i.e., top-level managers).
*/
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(id)
);


INSERT INTO employees (id, name, manager_id)
VALUES
(1, 'Amit', NULL),
(2, 'Rahul', 1),
(3, 'Priya', 1),
(4, 'Sneha', 2),
(5, 'Karan', 2),
(6, 'Rohit', 3),
(7, 'Neha', 3),
(8, 'Vikas', NULL);

select 
e.id,
e.name as employee_name,
e.manager_id,
m.name as manager_name
from employees as e
left join employees as m
on e.manager_id = m.id;

/*
4.
Use ChatGPT or Copilot to help you write a SQL query that finds all pairs of users from a users table who live in the same city
 (excluding pairs where the user is compared with themselves). Paste the query and briefly describe how the AI helped you improve or debug it.
*/
drop table if exists users;
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO users (user_id, user_name, city)
VALUES
(1, 'Rahul Sharma', 'Mumbai'),
(2, 'Priya Patel', 'Delhi'),
(3, 'Amit Verma', 'Mumbai'),
(4, 'Sneha Kapoor', 'Delhi'),
(5, 'Karan Singh', 'Pune'),
(6, 'Neha Sharma', 'Mumbai'),
(7, 'Rohan Mehta', 'Pune'),
(8, 'Pooja Shah', 'Bangalore');


SELECT
    u1.user_id AS user1_id,
    u1.user_name AS user1_name,
    u2.user_id AS user2_id,
    u2.user_name AS user2_name,
    u1.city
FROM users AS u1
INNER JOIN users AS u2
    ON u1.city = u2.city
    AND u1.user_id < u2.user_id;
    
    
/*
- I used ChatGPT to understand how to find pairs of users living in the same city using a SELF JOIN.
- AI helped me identify that joining the users table with itself allows us to compare different users. Initially, 
	I needed to avoid duplicate pairs and prevent users from being compared with themselves.
- ChatGPT suggested using the condition `u1.user_id < u2.user_id` along with matching cities. This helped me eliminate duplicate combinations and self-comparisons.
- As a result, I learned how SELF JOIN works and how it can be used to solve real-world SQL problems.
*/
