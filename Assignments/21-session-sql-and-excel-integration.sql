#===================================================================================================================================================================
#================================================= SESSION 21 : SQL + EXCEL INTEGRATION ============================================================================
#====================================================================================================================================================================
/*
Task 1:
Create a workbook `recharge_dashboard.xlsx` and use Power Query (Data > Get Data > From MySQL Database, Advanced options)
 with a native SQL statement that returns circle, number of subscribers and churned subscribers from `subscribers`
 grouped by circle. Load it to a sheet named `circle_summary`. The table must have 4 rows
*/

#=---------------------------------------===============================
# NOTE: I had also attached the screenshot of my excel sheet with the name session-21-sql-excel-Q1.png
#====================================================================

#Step 1 :- Select the database
use assignmentpractice;

#Step 2:- Drop the table if already exists and create the table.
drop table if exists subscribers;
CREATE TABLE subscribers (
    subscriber_id INT PRIMARY KEY,
    subscriber_name VARCHAR(100),
    circle VARCHAR(50),
    recharge_amount DECIMAL(10,2),
    churn_status VARCHAR(10)
);

#Step 3:- Insert the record in the table.
INSERT INTO subscribers
(subscriber_id, subscriber_name, circle, recharge_amount, churn_status)
VALUES
(1, 'Rahul', 'Mumbai', 299, 'No'),
(2, 'Amit', 'Mumbai', 499, 'Yes'),
(3, 'Priya', 'Mumbai', 399, 'No'),
(4, 'Sneha', 'Delhi', 299, 'No'),
(5, 'Karan', 'Delhi', 599, 'Yes'),
(6, 'Neha', 'Delhi', 399, 'Yes'),
(7, 'Rohit', 'Gujarat', 199, 'No'),
(8, 'Pooja', 'Gujarat', 299, 'No'),
(9, 'Vikas', 'Gujarat', 499, 'Yes'),
(10, 'Anjali', 'Karnataka', 399, 'No'),
(11, 'Suresh', 'Karnataka', 599, 'Yes'),
(12, 'Meera', 'Karnataka', 299, 'No');

#Step 4: Check that the record are inserted in the table successfully or not.
select * from subscribers;

#step 5: Write the required aggregation query.This is the SQL query you will enter in Power Query's Advanced options → SQL statement
SELECT
    circle,
    COUNT(subscriber_id) AS total_subscribers,
    SUM(
        CASE
            WHEN churn_status = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_subscribers
FROM subscribers
GROUP BY circle
ORDER BY circle;

#step 6: Check the result is properly or not.

/*
step 7:
	- Open Excel.
	- Go to Data → Get Data → From Database → From MySQL Database.
	- Enter your MySQL server and database name.
	- Expand Advanced options.
	- Paste the SQL query from Step 4 into the SQL statement box.
	- Click OK.
	- Click Load To.
	- Select Table → New Worksheet.
	- Rename the worksheet to circle_summary.
	- Save the workbook as recharge_dashboard.xlsx
*/

/*
Task 2:
Create a Power Query parameter named `selected_circle` with the value 'Gujarat' and use it to filter the `subscribers` query to that circle only, 
then load the result to a sheet named `circle_detail`. Change the parameter to 'Maharashtra',
refresh, and check the rows change. Hint: In the Advanced Editor use `Table.SelectRows(Source, each [circle] = selected_circle)`
*/

#Step 1: Add the Maharashtra records in MySQL
INSERT INTO subscribers
(subscriber_id, subscriber_name, circle, recharge_amount, churn_status)
VALUES
(13, 'Akash', 'Maharashtra', 299, 'No'),
(14, 'Riya', 'Maharashtra', 499, 'Yes'),
(15, 'Varun', 'Maharashtra', 399, 'No');

#Step 2: Check the result
select * from subscribers;

#step 3: Open Excel
/*
	- Go to Data.
    - Select get Data.
    - Now select the order source, now select from odbc.
    - The pop will open. In Data source name, select your created odbc name from the list.
    - After selecting the odbc, select your database from the list and select the table.
    - After selecting table click on transform data. Now the power query editor will open.

step 4: 
- In power query editor go to home, select the Manage parameters option
- Create the selected_circle parameter (in Power Query Editor: Home - Manage Parameters - New Parameter):Name: selected_circle,Type: Text,
	Suggested Values: Any value, 	Current Value: Gujarat

Step 5:
- Now select the Advanced Editor option
- Write the M code in Advanced Editor (select subscribers in the Queries pane - Home - Advanced Editor):
#================================================= 
let
    Source = MySQL.Database("localhost", "assignmentpractice", [ReturnSingleDatabase=true]),
    subscribers_Table = Source{[Schema="assignmentpractice",Item="subscribers"]}[Data],
    FilteredRows = Table.SelectRows(subscribers_Table, each [circle] = selected_circle)
in
    FilteredRows
#==================================
 - Table.SelectRows filters rows.
 - [circle] refers to the circle column.
 - selected_circle refers to the parameter.	
- If the parameter is Gujarat, only Gujarat records appear.

Step 6: Load the result into circle_detail
1. Click Done.
2. Check the filtered records.
3. Click Home → Close & Load To.
4. Select Table.
5. Select New Worksheet.
6. Click OK.
7. Rename the worksheet to:


Step 7: Change the parameter to Maharashtra
Now let's test whether the parameter works.
1. Go to Data → Get Data → Launch Power Query Editor (or open Queries & Connections and edit the query).
2. In Power Query Editor, select Home → Manage Parameters.
3. Select selected_circle.
4. Change Current Value from Gujarat to Maharashtra.
5. Click OK.
6. Click Home → Close & Load.

Step 8: Refresh and verify
- Go back to Excel.
= Click:
  - Data → Refresh All


*/
