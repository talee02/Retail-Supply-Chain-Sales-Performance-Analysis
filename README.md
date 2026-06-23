# Retail Supply Chain Sales Analysis 

## Project Dataset
This project used public dataset provided by [Kaggle](https://www.kaggle.com/datasets/shandeep777/retail-supply-chain-sales-dataset), for learning and better understanding in tools required for Data Analyst
### Key Columns:
- **Order ID, Order Date, Ship Date, Ship Mode** – Details about individual orders and shipment schedules
- **Customer ID, Customer Name, Segment** – Information on customers and their purchasing categories
- **Product ID, Category, Sub-Category, Product Name** – Information on the products sold
- **Sales, Quantity, Discount, Profit** – Key performance metrics for each order
- **Region, State, City, Postal Code** – Geographic details
- **Returned** – Indicates if the product was returned
- **Retail Sales People** – Relevant personnel involved in the sales process

### DAX Measures:
#### Key Metrics and Formulas:

- **Total Revenue:** Sum of sales revenue for the selected period.
  - **Formula:** `SUM(fact_sales[sales])`
    
- **Total Profit:** Sum of total profit earned.
  - **Formula:** `SUM(fact_sales[profit])`
    
- **Total Orders:** Total number of distinct orders placed.
  - **Formula:** `DISTINCTCOUNT(fact_sales[order_id])`
    
- **Profit Margin %:** Percentage of profit generated from total revenue.
  - **Formula:** `DIVIDE([Total Profit], [Total Revenue], 0)`
    
- **Return Rate %:** Percentage of returned orders.
  - **Formula:**`DIVIDE([Total Returns], [Total Orders], 0)`
    
- **Average Order Value:** Average revenue generated per order.
  - **Formula:** `DIVIDE([Total Revenue], [Total Orders], 0)`
    
- **Average Days to Ship:** Average number of days between order date and ship date.
  - **Formula:** `AVERAGE(fact_sales[days_to_ship`
    
- **Average Discount:** Average discount applied across all transactions.
  - **Formula:** `AVERAGE(fact_sales[discount])`
    
- **Revenue YoY %:** Year-over-Year revenue growth percentage.
  - **Formula:** `DIVIDE([Total Revenue] - [Revenue PY], [Revenue PY], 0)`

## Installation & Usage

### Software Requirements
To explore, reproduce, or modify this project, install the following software:
- **MySQL Workbench**: Used to execute SQL scripts and manage the database. Install from [MySQL Official Website](https://dev.mysql.com/downloads/workbench/)
- **Power BI Desktop**: Used to open and interact with the dashboard. Install from [Microsoft Official Website](https://www.microsoft.com/en-us/power-platform/products/power-bi/desktop)
    
### Clone the Repository
```bash
git clone https://github.com/talee02/Retail-Supply-Chain-Sales-Performance-Analysis.git
cd Retail-Supply-Chain-Sales-Performance-Analysis
```
### Import the Dataset into MySQL
1. Open MySQL Workbench.
2. Create a new database.
3. Import the raw dataset: `Retail-Supply-Chain-Sales-Dataset.csv`
5. After import the raw dataset, run the queries to create the Dimensional and Fact Table:
- `dim_date.sql`
- `dim_customer.sql`
- `dim_product.sql`
- `dim_location.sql`
- `dim_salesperson.sql`
- `fact_sales.sql`

These tables form a Star Schema data model that will be used in Power BI.

### Connect Power BI to MySQL
1. Open Power BI Desktop.
2. Select **Get Data → MySQL Database**.
3. Connect to your local database.
4. Load the following tables:
- `fact_sales`
- `dim_date`
- `dim_customer`
- `dim_product`
- `dim_location`
- `dim_salesperson`
5. Create the relationships shown in the data model or refresh the existing `.pbix` file if provided.

The dashboard uses the dimension tables for filtering and slicing data, while `fact_sales` serves as the central transaction table for all calculations and visualizations.
 
## Business Questions Answered
- Which product categories are most/least profitable?
- How do discounts affect profit margins?
- Which regions and sales reps are underperforming? 
 
## Tech Stack
MySQL 8 · Power BI Desktop · DAX · Star Schema 
 
## Key Findings
- Identified **Technology** as the most profitable category and **Office Supplies** as the least profitable category.
- Discovered that the **Central** region consistently underperformed in profitability compared to other regions.
- Revealed that **Kelly Williams** generated strong revenue but delivered the lowest profit margin, indicating potential pricing or discounting issues.
- Determined that **20% discount** is the profitability threshold, discounts above this level result in negative average profit margins.
- Demonstrated that revenue growth alone is not a reliable indicator of business performance, as profitability varies significantly across regions, sales representatives, and discount levels.

## Dashboard Components
The dashboard includes the following components:

- **Year & Region Filters:** Interactive slicers to filter performance by year and region.
- **KPIs:** Total Revenue, Total Profit, Profit Margin %, Total Orders, and Revenue YoY %.
- **Revenue & Profit Trend:** Line chart showing monthly revenue and profit performance over time.
- **Revenue by Customer Segment:** Donut chart displaying revenue contribution from Consumer, Corporate, and Home Office segments.
- **Top Performing Sub-Categories:** Bar chart highlighting the most profitable product sub-categories.
- **Profit by State:** Map visualization showing profit distribution across U.S. states.
- **Category & Sub-Category Performance:** Matrix visual comparing Revenue, Profit, Profit Margin %, and Return Rate % across product categories.
- **Discount Impact Analysis:** Scatter plot and bar chart showing the relationship between discount levels and profitability.
- **Revenue Distribution by Product Category:** Treemap visualizing revenue contribution by category and sub-category.
- **Sales Representative Performance:** Leaderboard table showing orders, revenue, profit, margin, and average shipping days for each sales representative.
- **Shipping Mode Analysis:** Bar chart comparing average shipping time across different shipping methods.
- **Order Trend Analysis:** Line chart displaying monthly order trends and overall sales activity.
- **Operational KPIs:** Average Order Value, Average Days to Ship, and Return Rate %.

## Glimpse of Dashboard

https://github.com/user-attachments/assets/7377df50-c1c6-4bcd-a503-b2d7364b271f




