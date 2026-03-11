# FEATURE ENGINEERING
#time_of_day
SELECT 
    Time,
    CASE
        WHEN TIME BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN TIME BETWEEN '12:00:01' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END AS time_of_day
FROM sales;
ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

UPDATE sales
SET time_of_day = (
   CASE
        WHEN TIME BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN TIME BETWEEN '12:00:01' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END 
);
              ---------------------------------------------
#day_name
SELECT Date, DAYNAME(Date)   
FROM sales;
 
ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);

UPDATE sales
SET day_name = DAYNAME(Date);
                -------------------------------------------------
#month_name
SELECT Date, MONTHNAME(Date)
FROM sales;

ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

UPDATE sales
SET month_name = MONTHNAME(date);
---------------------------------------------------------------------------------------
# GENERIC QUESTIONS
#HOW MANY UNIQUES CITY DOES THE DATA HAVE
SELECT DISTINCT city
FROM sales;
                     ---------------------------
#In which city is each branch?
SELECT DISTINCT branch
FROM sales;

SELECT DISTINCT city, branch
FROM sales;
-----------------------------------------------------------------------------------------
# PRODUCT
#How many unique product lines does the data have?
ALTER TABLE sales
CHANGE PRODUCT_LINE Product_line TEXT;

SELECT COUNT(distinct Product_Line)
FROM sales; 
               -----------------------------------------------------------
#What is the most common payment method?
SELECT Payment, COUNT(Payment)  AS most_common_payment
FROM sales
GROUP BY Payment
ORDER BY most_common_payment DESC;
               -----------------------------------------------------------
#What is the most selling product line?
SELECT Product_line, COUNT(Product_line) AS cnt
FROM sales
GROUP BY Product_line
ORDER BY cnt DESC;
			  ------------------------------------------------------------
#What is the total revenue by month?
SELECT month_name AS month, SUM(Total) AS total_revenue
FROM sales
GROUP BY month_name
ORDER BY total_revenue DESC;
              ----------------------------------------------------------------
#What month had the largest COGS?
SELECT month_name AS month,
SUM(cogs) AS cogs
FROM sales
GROUP BY month_name
ORDER BY cogs DESC;
             ----------------------------------------------------------------
#What product line had the largest revenue?
SELECT product_line, SUM(Total) AS total_revenue
FROM sales 
GROUP BY Product_line
ORDER BY total_revenue DESC;
              ---------------------------------------------------------------
#What is the city with the largest revenue?
SELECT branch, city, SUM(Total) AS total_revenue
FROM sales
GROUP BY city, branch
ORDER BY total_revenue DESC;
             --------------------------------------------------------------
#What product line had the largest VAT?
SELECT Product_line, AVG(`Tax 5%`) AS avg_tax
FROM sales
GROUP BY Product_line
ORDER BY avg_tax DESC;
	         ------------------------------------------------------------------------
#Which branch sold more products than average product sold?
SELECT branch, SUM(Quantity) AS qty
FROM sales
GROUP BY branch
HAVING SUM(Quantity) > (SELECT AVG(Quantity) FROM sales);
		    ----------------------------------------------------------------------------
#What is the most common product line by gender?
SELECT Gender, Product_line, COUNT(Gender) AS total_cnt
FROM sales
GROUP BY Gender, Product_line
ORDER BY total_cnt DESC; 
            -------------------------------------------------------------------------
#What is the average rating of each product line?
SELECT ROUND(AVG(Rating), 2) AS avg_rating, Product_line
FROM sales
GROUP BY Product_line
ORDER BY avg_rating DESC;
