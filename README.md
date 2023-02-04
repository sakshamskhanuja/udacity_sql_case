## CASE

### Questions

1. Write a query to display for each order, the account ID, total amount of the order, and the level of the order - ‘Large’ or ’Small’ - depending on if the order is $3000 or more, or smaller than $3000.

2. Write a query to display the number of orders in each of three categories, based on the ```total``` number of items in each order. The three categories are: 'At Least 2000', 'Between 1000 and 2000' and 'Less than 1000'.

3. We would like to understand 3 different levels of customers based on the amount associated with their purchases. The top level includes anyone with a Lifetime Value (total sales of all orders) ```greater than 200,000``` usd. The second level is between ```200,000 and 100,000``` usd. The lowest level is anyone ```under 100,000``` usd. Provide a table that includes the <b>level</b> associated with each <b>account</b>. You should provide the <b>account name</b>, the <b>total sales of all orders</b> for the customer, and the <b>level</b>. Order with the top spending customers listed first.

4. We would now like to perform a similar calculation to the first, but we want to obtain the total amount spent by customers only in ```2016``` and ```2017```. Keep the same <b>level</b>s as in the previous question. Order with the top spending customers listed first.

5. We would like to identify top performing sales reps, which are <b>sales reps</b> associated with more than 200 orders. Create a table with the <b>sales rep name</b>, the total number of orders, and a column with ```top``` or ```not``` depending on if they have more than 200 orders. Place the top sales people first in your final table.

6. The previous didn't account for the middle, nor the dollar amount associated with the sales. Management decides they want to see these characteristics represented as well. We would like to identify top performing sales reps, which are <b>sales reps</b> associated with more than ```200``` orders or more than ```750000``` in total sales. The ```middle``` group has any <b>rep</b> with more than 150 orders or ```500000``` in sales. Create a table with the <b>sales rep name</b>, the total number of orders, total sales across all orders, and a column with ```top```, ```middle```, or ```low``` depending on this criteria. Place the top sales people based on dollar amount of sales first in your final table. You might see a few upset sales people by this criteria!

[Entity Relationship Diagram](https://user-images.githubusercontent.com/122201501/216366555-d9a100f4-a9bf-4bba-b92d-9ce6c1c4a030.png)
