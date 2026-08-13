-- 8. Average freight-to-price ratio by seller state
WITH ratio_per_order AS (
	SELECT
		seller_state,
		freight_value::DECIMAL / NULLIF(price, 0) AS freight_to_price_ratio
	FROM order_items
	JOIN sellers ON sellers.seller_id = order_items.seller_id
)
SELECT
 seller_state,
 ROUND(AVG(freight_to_price_ratio), 2) AS freight_to_price_ratio
FROM ratio_per_order
GROUP BY seller_state;