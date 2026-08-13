-- 11. Top 3 sellers per product category
WITH seller_rank_per_product_category AS (
	SELECT
		products.product_category_name,
		order_items.seller_id, 
		SUM(order_items.price) AS revenue,
		DENSE_RANK() OVER(
			PARTITION BY products.product_category_name
			ORDER BY SUM(order_items.price) DESC
		) AS rank_per_product_category
	FROM products
	JOIN order_items ON order_items.product_id = products.product_id
	GROUP BY products.product_category_name, order_items.seller_id
)
SELECT 
*
FROM seller_rank_per_product_category
WHERE rank_per_product_category <= 3;