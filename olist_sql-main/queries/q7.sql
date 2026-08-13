-- 7. Monthly order volume: 2017 vs 2018 side by side
WITH orders_2017_2018 AS (
	SELECT
		order_id,
		EXTRACT (MONTH FROM order_purchase_timestamp::DATE) AS month,
		EXTRACT (YEAR FROM order_purchase_timestamp::DATE) AS year
	FROM orders
)
SELECT 
	month,
	COUNT(*) FILTER (WHERE year = 2017) AS volume_2017,
	COUNT(*) FILTER (WHERE year = 2018) AS volume_2018
FROM orders_2017_2018
GROUP BY month
ORDER BY month;