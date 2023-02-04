/* Write a query to display for each order, the account ID, total amount of the order, and the
level of the order - ‘Large’ or ’Small’ - depending on if the order is $3000 or more, or
smaller than $3000. */
SELECT a.id, o.total_amt_usd, CASE WHEN o.total_amt_usd >= 3000 THEN 'Large' ELSE 'Small' END AS
order_level
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id;

/* Write a query to display the number of orders in each of three categories, based on the
total number of items in each order. The three categories are: 'At Least 2000', 'Between
1000 and 2000' and 'Less than 1000'. */
SELECT CASE WHEN total >= 2000 THEN 'At Least 2000'
			WHEN total >= 1000 AND total < 2000 THEN 'Between 1000 and 2000'
            WHEN total < 1000 THEN 'Less than 1000' END AS category_total, COUNT(*) order_count
FROM orders
GROUP BY category_total
ORDER BY order_count;

/* We would like to understand 3 different levels of customers based on the amount associated with their purchases.
The top level includes anyone with a Lifetime Value (total sales of all orders) greater than 200,000 usd. The second
level is between 200,000 and 100,000 usd. The lowest level is anyone under 100,000 usd. Provide a table that includes
the level associated with each account. You should provide the account name, the total sales of all orders for the
customer, and the level. Order with the top spending customers listed first. */
SELECT account, total_sales,
	   CASE WHEN total_sales >= 200000 THEN 'top'
	        WHEN total_sales >= 100000 AND total_sales < 200000 THEN 'middle'
            WHEN total_sales < 100000 THEN 'low' END AS account_level
FROM (SELECT a.name AS account, SUM(o.total_amt_usd) AS total_sales
      FROM accounts AS a
      JOIN orders AS o
      ON a.id = o.account_id
      GROUP BY account
      ORDER BY total_sales DESC) AS table1;
      
/* We would now like to perform a similar calculation to the first, but we want to obtain the total amount spent by
customers only in 2016 and 2017. Keep the same levels as in the previous question. Order with the top spending customers
listed first. */
SELECT a.name AS account, SUM(o.total_amt_usd) AS total_amount,
       CASE WHEN SUM(o.total_amt_usd) >= 200000 THEN 'top'
            WHEN SUM(o.total_amt_usd) >= 100000 AND SUM(o.total_amt_usd) < 200000 THEN 'middle'
            WHEN SUM(o.total_amt_usd) < 100000 THEN 'low' END AS account_level
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id AND o.occurred_at BETWEEN '2016-01-01' AND '2017-01-01'
GROUP BY account
ORDER BY total_amount DESC;

/* We would like to identify top performing sales reps, which are sales reps associated with more than 200 orders.
Create a table with the sales rep name, the total number of orders, and a column with top or not depending on if they
have more than 200 orders. Place the top sales people first in your final table. */
SELECT s.name AS rep, COUNT(o.id) AS total_orders, CASE WHEN COUNT(o.id) > 200 THEN 'top' ELSE 'not' END AS level
FROM sales_reps AS s
JOIN accounts AS a
ON s.id = a.sales_rep_id
JOIN orders o
ON a.id = o.account_id
GROUP BY rep
ORDER BY total_orders DESC;

/* The previous didn't account for the middle, nor the dollar amount associated with the sales. Management decides they
want to see these characteristics represented as well. We would like to identify top performing sales reps, which are
sales reps associated with more than 200 orders or more than 750000 in total sales. The middle group has any rep with
more than 150 orders or 500000 in sales. Create a table with the sales rep name, the total number of orders, total sales 
across all orders, and a column with top, middle, or low depending on this criteria. Place the top sales people based
on dollar amount of sales first in your final table. You might see a few upset sales people by this criteria! */
SELECT s.name AS rep, COUNT(o.id) AS total_orders, SUM(o.total_amt_usd) AS total_sales,
       CASE WHEN COUNT(o.id) > 200 OR SUM(o.total_amt_usd) > 750000 THEN 'top'
            WHEN (COUNT(o.id) > 150 AND COUNT(o.id) <= 200) OR (SUM(o.total_amt_usd) > 500000 AND SUM(o.total_amt_usd) <= 750000) THEN 'middle'
            ELSE 'low' END AS level
FROM sales_reps AS s
JOIN accounts AS a
ON s.id = a.sales_rep_id
JOIN orders AS o
ON a.id = o.account_id
GROUP BY rep
ORDER BY total_sales DESC;