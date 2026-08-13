-- 12. Segment customers into 4 spending tiers
WITH customer_spent AS (
	SELECT 
		customers.customer_id,
		SUM(price + freight_value) AS total_spent
	FROM customers
	JOIN orders ON orders.customer_id = customers.customer_id
	JOIN order_items ON order_items.order_id = orders.order_id
	GROUP BY customers.customer_id
)
SELECT 
	*,
	NTILE(4) OVER(ORDER BY total_spent DESC) AS tier_num,
	CASE NTILE(4) OVER(ORDER BY total_spent DESC)
		WHEN 1 THEN 'Top Spender'
		WHEN 2 THEN 'High Spender'
		WHEN 3 THEN 'Medium Spender'
		WHEN 4 THEN 'Low Spender'
	END AS tier
FROM customer_spent;