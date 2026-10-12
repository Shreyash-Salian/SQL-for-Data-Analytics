/*
2. Open MySQL Workbench or DB Browser, connect to your local MySQL server, and create a new database called music_streaming_db.
*/
drop database if exists music_streaming_db;
create database music_streaming_db;
use music_streaming_db;

/*
3. Write the SQL command to create a new database named food_delivery_db
 and execute it in your SQL Workbench or DB Browser.<br><br><em><strong>Hint:</strong> Use the CREATE DATABASE statement.</em>
*/
drop database if exists food_delivery_db ;
create database food_delivery_db;
use food_delivery_db; 

/*
List 3 differences between MySQL and PostgreSQL in terms of features or use cases, and give one example of a popular app or company that uses each.

Mysql:
1. Supports common types and has features such as JSON; generally emphasizes a straightforward relational database experience.
2. Supports joins, subqueries, CTEs, and window functions in modern versions.
3. Frequently used for web applications, content management systems, and read-heavy applications.

Postgres:
1. Supports a broader range of advanced types, including arrays, custom types, and JSONB, plus extensibility.
2. Offers rich SQL capabilities, including advanced queries, custom functions, and extensive indexing options.
3. Often chosen for complex queries, data-intensive applications, geospatial data, and systems with sophisticated data requirements.

*/


