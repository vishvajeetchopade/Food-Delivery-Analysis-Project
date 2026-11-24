Food Delivery Data Analytics Project
This project analyses food delivery records to understand order demand, sales activity, delivery performance,
customer behaviour, restaurant performance, ratings, and payment preferences.
Objectives
● Clean and prepare the raw food delivery dataset.
● Analyse orders, calculated sales, customers, restaurants, delivery times, ratings, and payment methods.
● Create charts that communicate important patterns.
● Use SQL queries and a BI dashboard to explore and present results.
● Prepare clear business insights and an executive summary.
Dataset Columns
order_id, customer_id, restaurant, city, order_date, delivery_time_minutes, item, quantity, price, discount,
payment_method, rating.
Technology
Python, Pandas, NumPy, Matplotlib, Seaborn, MySQL / MySQL Workbench, and Power BI or Tableau.
Suggested Project Structure
Food_Delivery_Project/
■■■ Dataset/
■ ■■■ Food_Delivery.csv
■ ■■■ Food_Delivery_Cleaned.csv
■■■ Python/
■ ■■■ food_delivery_analysis.ipynb
■■■ SQL/
■ ■■■ food_delivery_queries.sql
■■■ PowerBI/
■ ■■■ food_delivery_dashboard.pbix
■■■ Tableau/
■ ■■■ food_delivery_dashboard.twb
■■■ Output/
■ ■■■ Food_Delivery_Analysis_Report.pdf
■ ■■■ Business_Insights_Report.pdf
■ ■■■ Executive_Summary.pdf
■ ■■■ Charts/
■■■ README.pdf
Workflow
● Load the CSV dataset into Python.
● Inspect columns, data types, missing values, duplicates, and invalid records.
● Clean the data and save a separate cleaned CSV file.
● Calculate order, sales, delivery, customer, restaurant, rating, and payment metrics.
● Create charts and run supporting SQL queries.
● Build a dashboard in Power BI or Tableau.
● Export the reports and add the project files to this repository.
Important Notes
The dataset does not include order_status or food_category. Cancellation, completion, return, and category-level
analysis should not be claimed unless additional data is added. Confirm what the discount column represents before
calculating net revenue. When counting orders, use distinct order IDs so multiple item rows do not inflate the order
count.
How to Run
Install the required Python packages:
python3 -m pip install pandas numpy matplotlib seaborn jupyter
Open the notebook and update the CSV file path to match the location of your dataset. Run the notebook cells in
order. Store generated charts and cleaned data in the Output and Dataset folders respectively.
Repository Contents
Upload the dataset if you have permission to share it, the analysis notebook, SQL scripts, dashboard files, generated
charts, and the PDF reports. Do not upload private customer information, credentials, or confidential business data.
