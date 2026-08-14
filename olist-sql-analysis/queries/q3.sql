SELECT 
	products.product_category_name,
	category_translation.product_category_name_english,
	COUNT(order_reviews.review_id) AS reviews_count,
	ROUND(AVG(order_reviews.review_score), 2) AS avg_score
FROM products
JOIN category_translation ON category_translation.product_category_name = products.product_category_name
JOIN order_items ON order_items.product_id = products.product_id
JOIN order_reviews ON order_reviews.order_id = order_items.order_id
GROUP BY products.product_category_name, category_translation.product_category_name_english
ORDER BY reviews_count DESC, avg_score;