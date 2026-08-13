-- 10. Month-over-month revenue growth rate (%)
WITH revenue_by_month AS (
	SELECT 
		EXTRACT (MONTH FROM orders.order_purchase_timestamp) AS month,
		SUM(order_items.price) AS revenue,
		COALESCE(
			LAG(SUM(order_items.price)) OVER (
				ORDER BY EXTRACT (MONTH FROM orders.order_purchase_timestamp)
			),
			0
		) AS last_month_revenue
	FROM order_items
	JOIN orders ON orders.order_id = order_items.order_id
	WHERE orders.order_status = 'delivered'
	GROUP BY EXTRACT (MONTH FROM orders.order_purchase_timestamp) 
	ORDER BY month
)
SELECT 
	*, 
	ROUND(
		100.0 * (revenue - last_month_revenue) / NULLIF(last_month_revenue, 0)
		, 2
	) || '%'
	AS growth_rate
FROM revenue_by_month;