SELECT 
    payment_type,
    SUM(payment_value) AS total_payment_value,
    ROUND(
        (100.0 * SUM(payment_value) / SUM(SUM(payment_value)) OVER ())::numeric,
        2
    ) AS percentage_of_total
FROM 
    olist_order_payments
GROUP BY 
    payment_type
ORDER BY 
    total_payment_value DESC;
