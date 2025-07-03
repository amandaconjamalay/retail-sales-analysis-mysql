
# Calculating total monthly sales
# Made the most sales in February and the least amount of sales in April.
SELECT MONTHNAME(order_date), SUM(total_amount)
FROM orders
GROUP BY MONTHNAME(order_date)
;

# 2. Identify top-selling products
# Wireless mouse made the most money, even though the pen pack was ordered the most it was sold at a lower price therefore is not a top selling product.
SELECT product_name, quantity, (quantity * price) AS total_revenue 
FROM orderdetails od
JOIN products p
	ON od.product_id = p.product_id
ORDER BY total_revenue DESC
;

# 3. Analyse customer order frequency 
# Alice Smith has ordered the most frequently, the rest of the customers have only ordered once so are most likely one time buyers.
SELECT name, COUNT(order_id) AS No_of_orders
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
GROUP BY name;

# 4. Calculate average order value - AVG amount of money spent per order 
SELECT ROUND((SUM(total_amount) / COUNT(order_id)), 2) AS avg_order_value
FROM orders;

# 5. Compare product performance by category
# Electronics makes the most money out of all the categories and accessories makes the least most likely because the items in this category are priced lower.
# Electronics are the highest priced items compared to any other products in the other categories.
SELECT p.category, SUM(o.total_amount)
FROM products p
JOIN orderdetails od
	ON p.product_id = od.product_id
JOIN orders o 
	ON o.order_id = od.order_id
GROUP BY p.category;

# 6. Identify high-value customers
# Alice Smith has spent the most money whereas David Lee has spent the least amount. 
# But David Lee could be a new customer as he was the most recent order.
# Alice was the first customer to make an order and has ordered multiple times so they are a loyal customer. 
SELECT name, sum(total_amount)
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
GROUP BY name;

SELECT name, order_date
FROM customers c 
JOIN orders o
	ON c.customer_id = o.customer_id
ORDER BY order_date DESC;

# Conclusion
# Identified that Alice Smith is a high value and loyal customer and David Lee could be identified as a new customer, need to keep monitoring to understand more.
# Should add incentives for loyal/ frequent customers which could increase number of sales for each customer.


