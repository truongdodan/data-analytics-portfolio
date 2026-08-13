-- 9. Rank sellers by revenue within each state
SELECT 
	sellers.seller_id,
	sellers.seller_state,
	SUM(order_items.price) AS total_revenue,
	DENSE_RANK() OVER (
		PARTITION BY sellers.seller_state
		ORDER BY SUM(order_items.price) DESC
	) AS seller_rank
FROM sellers
JOIN order_items ON sellers.seller_id = order_items.seller_id
JOIN orders ON orders.order_id = order_items.order_id
WHERE orders.order_status = 'delivered'
GROUP BY sellers.seller_id, sellers.seller_state;