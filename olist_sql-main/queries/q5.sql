-- 5. What % of delivered orders arrived late?
WITH delivered_orders AS (
	SELECT * 
	FROM orders 
	WHERE order_status = 'delivered'
)
SELECT 
	ROUND(
		100.0 *
		COUNT(*) FILTER(WHERE order_delivered_customer_date > order_estimated_delivery_date) /
		COUNT(*)
		, 2
	)
FROM delivered_orders;