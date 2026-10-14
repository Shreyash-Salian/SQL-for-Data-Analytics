#================================================ SESSION 16 STRING FUNCTION=====================================================================================
#================================================================================================================================================================
/*
1. Write an SQL query using CONCAT to combine first_name and last_name columns from a users table into a single full_name column and display the result.
*/
DROP TABLE IF EXISTS USERS;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

INSERT INTO users (user_id, first_name, last_name)
VALUES
(1, 'Rahul', 'Sharma'),
(2, 'Priya', 'Patel'),
(3, 'Amit', 'Verma'),
(4, 'Neha', 'Desai'),
(5, 'Shreyash', 'Salian'),
(6, 'Anjali', 'Mehta'),
(7, 'Vikas', 'Joshi'),
(8, 'Pooja', 'Shah');

SELECT 
USER_ID,
CONCAT(FIRST_NAME," ",LAST_NAME)AS FULL_NAME
FROM USERS;

/*2
Given a table called playlists with a column song_title, write a query to display all song titles in uppercase using the UPPER function.
*/

DROP TABLE IF EXISTS playlists;
CREATE TABLE playlists (
    song_id INT PRIMARY KEY,
    song_title VARCHAR(100)
);

INSERT INTO playlists (song_id, song_title)
VALUES
(1, 'Tum Hi Ho'),
(2, 'Kesariya'),
(3, 'Apna Bana Le'),
(4, 'Heeriye'),
(5, 'Channa Mereya');

SELECT
SONG_ID,
UPPER(SONG_TITLE)AS SONG_TITLE
FROM PLAYLISTS;

/*3.
You have a table food_items with a column item_code that sometimes contains extra spaces at the beginning or end. 
Write an SQL query to select item_code values after removing all leading and trailing spaces using TRIM.
*/
DROP TABLE IF EXISTS food_items;
CREATE TABLE food_items (
    item_id INT PRIMARY KEY,
    item_code VARCHAR(50)
);

INSERT INTO food_items (item_id, item_code)
VALUES
(1, '  FOOD101'),
(2, 'FOOD102  '),
(3, '  FOOD103  '),
(4, 'FOOD104'),
(5, '   FOOD105   ');


SELECT ITEM_ID,
TRIM(ITEM_CODE)AS ITEM_CODE
FROM FOOD_ITEMS;

/*
4. In a table called movies, the column imdb_id contains codes like 'tt1234567'. Write a query to extract just the numeric part (the last 7 characters) 
using RIGHT and display it as movie_number.<br><br><em><strong>Hint:</strong> Use RIGHT(imdb_id, 7) to get the numeric part.</em>
*/

DROP TABLE IF EXISTS MOVIES;
CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    imdb_id VARCHAR(20)
);

INSERT INTO movies (movie_id, imdb_id)
VALUES
(1, 'tt1234567'),
(2, 'tt7654321'),
(3, 'tt9876543'),
(4, 'tt1122334'),
(5, 'tt5566778');

SELECT
MOVIE_ID,
IMDB_ID,
RIGHT(IMDB_ID,7)
FROM MOVIES;

/*
5. A products table has a column sku_code where some entries use dashes (e.g. 'MOB-123-XY').
 Write an SQL query to replace all dashes '-' with underscores '_' in sku_code using the REPLACE function and display the updated codes.
*/
DROP TABLE IF EXISTS PRODUCTS;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    sku_code VARCHAR(50)
);

INSERT INTO products (product_id, sku_code)
VALUES
(1, 'MOB-123-XY'),
(2, 'LAP-456-AB'),
(3, 'KEY-789-CD'),
(4, 'MOU-321-EF'),
(5, 'TAB-654-GH');

SELECT
PRODUCT_ID,
SKU_CODE,
REPLACE(SKU_CODE,"-","_")AS UPDATED_SKU_CODE
FROM PRODUCTS;


#=================================================================================================================================================================
