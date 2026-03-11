# Walmart Sales Data Analysis (SQL)

## Project Overview
This project analyzes Walmart sales transactions using SQL to identify revenue trends, product performance, and customer purchasing behavior.

The dataset contains over 9,000 retail transactions including product lines, branch locations, payment methods, sales revenue, and customer ratings.

## Tools Used
- SQL
- MySQL
- Data Analysis
- Exploratory Data Analysis (EDA)

## Feature Engineering
Additional analytical features were created using SQL:

- time_of_day (Morning, Afternoon, Evening)
- day_name
- month_name

These features enable time-based sales analysis.

## Key Business Questions Addressed

This project explores several business analytics questions:

- Which product line generates the highest revenue?
- Which branch produces the highest total sales?
- Which month generates the most revenue?
- Which city generates the highest revenue?
- What payment method is most commonly used by customers?
- Which product lines receive the highest customer ratings?
- Which product line is purchased the most?
- Which product lines generate the highest VAT?
- Which branch sells more products than the overall average?
- What product lines are most commonly purchased by each gender?

## SQL Techniques Used
- CASE statements
- GROUP BY
- HAVING
- Aggregate functions (SUM, AVG, COUNT)
- Subqueries
- Data transformation

## Example Query

```sql
SELECT product_line, SUM(Total) AS total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;
