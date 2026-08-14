SELECT 
	products.product_category_name,
	category_translation.product_category_name_english,
	COUNT(order_items.product_id) AS total_items_sold,
	SUM(order_items.price + order_items.freight_value) AS total_revenue
FROM products
LEFT JOIN category_translation ON category_translation.product_category_name = products.product_category_name
JOIN order_items ON order_items.product_id = products.product_id
GROUP BY products.product_category_name, category_translation.product_category_name_english
ORDER BY total_revenue DESC
LIMIT 10;