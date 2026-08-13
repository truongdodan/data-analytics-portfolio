SELECT 
	ROUND(
		100.0 * COUNT(payment_type) FILTER(WHERE payment_type = 'credit_card') / COUNT(*)
		, 2
	) AS credit_card_payment_percentage,
	ROUND(
		100.0 * COUNT(*) FILTER(WHERE payment_type <> 'credit_card') / COUNT(*)
		, 2
	) AS orthers_payment_percentage
FROM order_payments;