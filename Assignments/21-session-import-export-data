#==========================================================================================================================================================================
#======================================================= SESSION 20: IMPORT / EXPORT DATA ===============================================================================
#==========================================================================================================================================================================

/*
1.Download a sample IPL match data CSV file and load it into a new SQL table called ipl_matches using your preferred SQL tool (MySQL Workbench, DBeaver, or Azure Data Studio).

ANSWEER:-
- First I downloaded the matches.csv file from kaggle.
- Then click on the database(assignmentpractice)=> Right click on it.
- Then select the table data import wizard,
- Then select the file from the option and click next
- Now select the destination table and additional options like create new table or use existing option
- Now configure the import setting. Check for the fields and its data type. Then click on next.
- Now click next to execute => It will prepare import and import data file. Then click next.
- Now the data will be uploaded in the table named "iplmatches"
*/
select * from iplmatches;

/*
2. Write a SQL query to select all matches where the team 'Mumbai Indians' played, then export the query results as a CSV file named mi_matches.csv.
*/
select * from iplmatches where team1 = "Mumbai Indians" or team2 = "Mumbai Indians";
/*
steps:-
- Execute the SQL query.
- In the Result Grid, click Export recordset to an external file.
- Choose CSV as the file format.
- Set the filename to mi_matches.csv.
- Select your destination folder.
- Click Save.
*/

/*
3.Connect Microsoft Excel to your SQL database and import the ipl_matches table. Create a simple table in Excel that shows the total matches played by each team.
Steps:-
Step 1. Configure MySQL ODBC Connector
- Open Windows Search.
- Search for ODBC Data Sources (64-bit).
- Open it.
- Select the System DSN tab (or User DSN).
- Click Add.
- Select MySQL ODBC 8.0 Unicode Driver (or the installed MySQL ODBC driver).
- Click Finish.
- Enter the following details like Data Source Name, TCP/IP Server, Port, User, Password, Database
- Click Test to check the connection.
- Click OK to save the DSN.

Step 2. Connect Excel to MySQL using ODBC
- Open Microsoft Excel.
- Select the Data tab.
- Click Get Data.
- Select From Other Sources → From ODBC.
- Select the DSN: IPL_MySQL.
- Click OK.
- Enter your MySQL credentials if prompted.
- In Navigator, select ipl_matches.
- Click Load.
- Your MySQL table should now appear in Excel.

Step 3. Create team-wise match count using SQL
- For this analysis, we need to count both team1 and team2.
- Open MySQL Workbench and execute:
*/

SELECT
    team,
    COUNT(*) AS total_matches
FROM (
    SELECT team1 AS team
    FROM iplmatches

    UNION ALL

    SELECT team2 AS team
    FROM iplmatches
) AS all_teams
GROUP BY team
ORDER BY total_matches DESC;

/*
- This query counts each team's appearances, regardless of whether it played as team1 or team2.
- Step 4. Import the summary into Excel through ODBC.

You can import the query result directly instead of manually copying it.
1. In Excel, go to Data → Get Data → From Other Sources → From ODBC.
2. Select IPL_MySQL.
3. If the connection dialog provides a SQL statement or Advanced options field, paste the query above.
4. Click OK and then Load.
*/


/*
4.Connect Power BI Desktop to your SQL database, import the ipl_matches table, and create a pivot chart showing the number of wins for each team.
*/

/*
Steps:-
Step 1: Prepare your MySQL database

Step 2: Install MySQL Connector

Step 3: Connect Power BI Desktop to MySQL
	- Open Power BI Desktop.
	- Click Home.
	- Select Get Data.
	- Choose Database.
	- Select MySQL Database.
	- Click Connect.
	- Click OK.
	- Select Database authentication.
	- Enter your MySQL username and password.
	- Click Connect.
    
Step 4: Import the ipl_matches table.
	- After connecting, the Navigator window will appear.
	- Find your database ipl_db.
	- Expand the database.
	- Select the checkbox beside ipl_matches.
	- Click Load.
    
Step 5: Create a measure to calculate total wins
	- Select the ipl_matches table in the Fields pane.
	- Right-click the table.
	- Select New measure.
	- Write the following DAX formula: Total Wins = COUNTROWS('ipl_matches')
Step 6: Create a chart showing wins by team

Follow these steps:
	1. Go to Report view.
	2. Select the Clustered column chart visual from Visualizations.
	3. Drag the winner column into the X-axis.
	4. Drag the Total Wins measure into the Y-axis.
	5. Add a visual-level filter on winner to exclude blank values.
    
Step 7: Format your chart    
Customize your chart:
- Chart title: IPL Team-wise Total Wins
- X-axis title: IPL Teams
- Y-axis title: Number of Wins
- Turn on data labels.
- Sort by Total Wins in descending order.

Step 8: Save your Power BI report
	- Click File.
	- Select Save As.
	- Save the file as IPL_Team_Wins_Analysis.pbix.
Step 9: Verify the result using MySQL
*/
SELECT
    winner,
    COUNT(*) AS total_wins
FROM iplmatches
WHERE winner IS NOT NULL
  AND winner <> ''
GROUP BY winner
ORDER BY total_wins DESC;

/*
The results should match your Power BI chart
*/

/*
5. Use Python (with pandas and sqlalchemy) to read the mi_matches.csv file, filter matches where 'Mumbai Indians' won, and insert those rows into a new SQL table called mi_wins.
<br><br><em><strong>Hint:</strong> Use pandas.read_csv(), DataFrame filtering, and to_sql() for this task.</em>
*/
use assignmentpractice;
SELECT *
FROM iplmatches
WHERE team1 = 'Mumbai Indians'
   OR team2 = 'Mumbai Indians';
   
select * from mi_wins;

/*
- Let's complete your IPL Python + MySQL project step by step using VS Code. Follow these steps in order.

Step 1: Create your project folder
1. Open Visual Studio Code.
2. Click File → Open Folder.
3. Create a folder named IPL_Python_Project.
4. Open that folder in VS Code.

Step 2: Add your CSV file
- Copy your previously exported mi_matches.csv file into the IPL_Python_Project folder.

Step 3: Create a Python file
1. In VS Code, click New File.
2. Name it main.py.
3. Open the VS Code terminal using Terminal → New Terminal.

- Run this command to check Python: python --version

- Then install the required libraries: python -m pip install pandas sqlalchemy pymysql

step 4: Check your CSV file
Before connecting to MySQL, let's check whether Python can read your CSV.

- Write this code in main.py:
	import pandas as pd
	df = pd.read_csv("mi_matches.csv")

	print(df.head())
	print(df.columns)
	print("Total records:", len(df))
    
- Run: python main.py

- Step 5: Filter Mumbai Indians wins
- Write the below code. This will display the results
*/
import pandas as pd
from sqlalchemy import create_engine, URL

# ==========================================
# STEP 1: READ CSV FILE
# ==========================================

df = pd.read_csv("mi_matches.csv")

print("CSV file loaded successfully!")
print("Total matches:", len(df))


# ==========================================
# STEP 2: FILTER MUMBAI INDIANS WINS
# ==========================================

mi_wins = df[
    df["winner"].astype("string").str.strip()
    == "Mumbai Indians"
].copy()

print("Mumbai Indians wins:", len(mi_wins))


# ==========================================
# STEP 3: MYSQL CONNECTION
# ==========================================

connection_url = URL.create(
    drivername="mysql+pymysql",
    username="root",
    password="root",
    host="localhost",
    port=3306,
    database="assignmentpractice"
)

engine = create_engine(connection_url)


# ==========================================
# STEP 4: TEST MYSQL CONNECTION
# ==========================================

try:
    with engine.connect() as conn:
        result = conn.exec_driver_sql("SELECT 1").scalar()
        print("MySQL connected successfully!")

except Exception as e:
    print("MySQL connection failed!")
    print(e)
    raise SystemExit


# ==========================================
# STEP 5: INSERT DATA INTO MYSQL
# ==========================================

try:
    mi_wins.to_sql(
        name="mi_wins",
        con=engine,
        if_exists="replace",
        index=False
    )

    print("Data inserted successfully!")
    print("Total rows inserted:", len(mi_wins))

except Exception as e:
    print("Error inserting data:")
    print(e)


# ==========================================
# STEP 6: VERIFY INSERTED DATA
# ==========================================

try:
    result_df = pd.read_sql(
        "SELECT * FROM mi_wins",
        con=engine
    )

    print("\nInserted Data:")
    print(result_df.head(10))

    print("\nTotal records in mi_wins:", len(result_df))

except Exception as e:
    print("Error verifying data:")
    print(e)


# ==========================================
# STEP 7: CLOSE CONNECTION
# ==========================================

engine.dispose()

print("\nIPL project completed!")

/**/

-- EXPLAIN ANALYZE
-- SELECT *
-- FROM orders
-- WHERE user_id = 105;

#==========================================================================================================================================================================
#==========================================================================================================================================================================
