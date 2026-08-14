-- 4. How many Orders are there in each Order Status?
SELECT
	order_status,
	COUNT(order_id) AS orders_count
FROM orders
GROUP BY order_status
ORDER BY orders_count DESC;