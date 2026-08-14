-- 6. How many customers are repeat buyers vs one-time?
WITH order_per_customer_count AS (
	SELECT 
		customers.customer_unique_id,
		COUNT(orders.order_id) AS orders_count
	FROM customers
	JOIN orders ON orders.customer_id = customers.customer_id
	GROUP BY customers.customer_unique_id
)

SELECT 
	COUNT(*) FILTER (WHERE orders_count = 1) AS one_timers,
	COUNT(*) FILTER (WHERE orders_count > 1) AS repeat_buyers
FROM order_per_customer_count;