#===================================================================================================================================================================
#================================================= SESSION 22 : SQL + PYTHON INTEGRATION ============================================================================
#====================================================================================================================================================================
/*
Tasks
1. Create a notebook `recharge_python.ipynb` that connects to `recharge_usage_db` using the method taught in class and loads `SELECT circle,
 plan_inr, data_gb_used, churned FROM subscribers` into a DataFrame named `df` with `pd.read_sql()`. Print `df.shape` 
 (it must match the MySQL row count, 220 if you finished the last session) and `df.head()`. Hint: Close the connection when finished.</p>
 
2. In `recharge_python.ipynb`, load the SQL magic extension and write a `%%sql` cell that returns churned subscribers per circle, 
then convert that result to a DataFrame named `churn_by_circle`. Print it. It must have one row per circle. Hint: The `%%sql` result has a `.DataFrame()` method.</p>

3. Write a SQL query that returns churn rate per circle (as a percentage, rounded to 1 decimal) into a DataFrame, 
plot it as a bar chart with a title and axis labels, and save it as `churn_by_circle.png`. Add it to `recharge_python.ipynb`. 
Hint: Call `plt.savefig()` before `plt.show()`, or the file can be blank.

4. Finish `recharge_python.ipynb` with a second chart: a SQL query using MONTH(recharge_date) to count recharges per month,
 loaded with `pd.read_sql()` and plotted as a line chart saved as `recharges_by_month.png`. Run Restart & Run All, confirm both charts 
 are visible, and submit. Constraint: Use SQL for all aggregation, and use pandas only to load and plot.

/*
