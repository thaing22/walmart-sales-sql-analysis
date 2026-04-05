SELECT * FROM sales
------------------------------------------------------------------
#SALES

#Number of sales made in each time of the day per weekday
SELECT time_of_day, COUNT(*) AS total_sales
FROM sales
WHERE day_name = "Monday"
GROUP BY time_of_day
ORDER BY total_sales DESC

#Which of the customer types brings the most revenue?
ALTER TABLE sales
CHANGE `Customer type` customer_type VARCHAR(50);

SElECT customer_type, SUM(TOTAL) AS total_rev 
FROM sales
GROUP BY customer_type
ORDER BY total_rev DESC

#Which city has the largest tax percent/ VAT (Value Added Tax)?

ALTER TABLE sales ADD VAT DECIMAL(10,2);
UPDATE sales SET VAT = 0.05 * Total; 

SELECT City, AVG(VAT) AS VAT
FROM sales
GROUP BY City
ORDER BY VAT DESC;
------------------------------------------------------
#CUSTOMERS

#How many unique customer types does the data have?
SELECT DISTINCT customer_type
FROM sales;

#How many unique payment methods does the data have?
SELECT DISTINCT Payment
FROM sales;

#Which customer type buys the most?
SELECT customer_type, COUNT(*) cstm_cnt
FROM  sales
GROUP BY customer_type

#What is the gender of most of the customers?
SELECT Gender, COUNT(*) AS gender_cnt
FROM sales
GROUP BY Gender
ORDER BY gender_cnt DESC

#What is the gender distribution per branch?
SELECT Gender, COUNT(*) AS gender_cnt
FROM sales
WHERE Branch = "A" 
GROUP BY Gender
ORDER BY gender_cnt DESC

#Which time of the day do customers give most ratings?
SELECT time_of_day, AVG(Rating) AS avg_rating
FROM sales
GROUP BY time_of_day
ORDER BY avg_rating DESC

#Which day fo the week has the best avg ratings?
SELECT day_name, AVG(Rating) AS avg_rating
FROM sales
GROUP BY day_name
ORDER BY avg_rating DESC

#Which day of the week has the best average ratings per branch?
SELECT day_name, AVG(Rating) AS avg_rating
FROM sales
WHERE Branch = "A"
GROUP BY day_name
ORDER BY avg_rating DESC


