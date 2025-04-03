-- View: v_high_value_late_orders
CREATE OR REPLACE VIEW v_high_value_late_orders AS
SELECT o.order_id,
    o.customer_id,
    sum(oi.price) AS total_price,
    o.order_estimated_delivery_date,
    o.order_delivered_customer_date,
        CASE
            WHEN (o.order_delivered_customer_date > o.order_estimated_delivery_date) THEN true
            ELSE false
        END AS is_late
   FROM (olist_orders o
     JOIN olist_order_items oi ON ((o.order_id = oi.order_id)))
  WHERE (o.order_status = 'delivered'::text)
  GROUP BY o.order_id, o.customer_id, o.order_estimated_delivery_date, o.order_delivered_customer_date;;

-- View: v_repeat_customers_summary
CREATE OR REPLACE VIEW v_repeat_customers_summary AS
SELECT customer_unique_id,
    count(*) AS occurrences
   FROM olist_customers
  GROUP BY customer_unique_id
 HAVING (count(*) > 1);;

-- View: v_geographic_delivery_delays
CREATE OR REPLACE VIEW v_geographic_delivery_delays AS
SELECT c.customer_city,
    c.customer_state,
    avg(date_part('day'::text, (o.order_delivered_customer_date - o.order_estimated_delivery_date))) AS avg_delay_days,
    count(*) AS total_orders
   FROM (olist_orders o
     JOIN olist_customers c ON ((o.customer_id = c.customer_id)))
  WHERE ((o.order_delivered_customer_date IS NOT NULL) AND (o.order_estimated_delivery_date IS NOT NULL))
  GROUP BY c.customer_city, c.customer_state;;

-- View: v_payment_type_preferences
CREATE OR REPLACE VIEW v_payment_type_preferences AS
SELECT payment_type,
    count(*) AS total_transactions,
    round((((count(*))::numeric * 100.0) / (( SELECT count(*) AS count
           FROM olist_order_payments olist_order_payments_1))::numeric), 2) AS percentage_share
   FROM olist_order_payments
  GROUP BY payment_type
  ORDER BY (count(*)) DESC;;

-- View: v_high_value_transactions
CREATE OR REPLACE VIEW v_high_value_transactions AS
SELECT p.order_id,
    o.customer_id,
    p.payment_type,
    p.payment_value,
    o.order_purchase_timestamp
   FROM (olist_order_payments p
     JOIN olist_orders o ON ((p.order_id = o.order_id)))
  WHERE (p.payment_value > (500)::double precision)
  ORDER BY p.payment_value DESC;;

-- View: v_avg_basket_size_per_customer
CREATE OR REPLACE VIEW v_avg_basket_size_per_customer AS
SELECT o.customer_id,
    count(DISTINCT oi.order_id) AS total_orders,
    sum(oi.price) AS total_spent,
    round(((sum(oi.price))::numeric / (count(DISTINCT oi.order_id))::numeric), 2) AS avg_basket_value
   FROM (olist_order_items oi
     JOIN olist_orders o ON ((oi.order_id = o.order_id)))
  GROUP BY o.customer_id
  ORDER BY (round(((sum(oi.price))::numeric / (count(DISTINCT oi.order_id))::numeric), 2)) DESC;;

-- View: v_overall_avg_basket_size
CREATE OR REPLACE VIEW v_overall_avg_basket_size AS
SELECT round(avg(order_total), 2) AS overall_avg_basket_value
   FROM ( SELECT olist_order_items.order_id,
            (sum(olist_order_items.price))::numeric AS order_total
           FROM olist_order_items
          GROUP BY olist_order_items.order_id) sub;;

-- View: v_payment_type_by_location
CREATE OR REPLACE VIEW v_payment_type_by_location AS
SELECT c.customer_state,
    c.customer_city,
    p.payment_type,
    count(*) AS total_transactions,
    round((((count(*))::numeric * 100.0) / sum(count(*)) OVER ()), 2) AS percentage_share
   FROM ((olist_order_payments p
     JOIN olist_orders o ON ((p.order_id = o.order_id)))
     JOIN olist_customers c ON ((o.customer_id = c.customer_id)))
  GROUP BY c.customer_state, c.customer_city, p.payment_type;;

-- View: v_order_status_summary
CREATE OR REPLACE VIEW v_order_status_summary AS
SELECT order_status,
    count(*) AS order_count
   FROM olist_orders
  GROUP BY order_status
  ORDER BY (count(*)) DESC;;

-- View: v_top_customer_cities
CREATE OR REPLACE VIEW v_top_customer_cities AS
SELECT c.customer_city,
    sum(p.payment_value) AS total_spent
   FROM ((olist_orders o
     JOIN olist_customers c ON ((o.customer_id = c.customer_id)))
     JOIN olist_order_payments p ON ((o.order_id = p.order_id)))
  GROUP BY c.customer_city
  ORDER BY (sum(p.payment_value)) DESC;;

-- View: v_repeat_customers_rate
CREATE OR REPLACE VIEW v_repeat_customers_rate AS
SELECT c.customer_unique_id,
    count(DISTINCT o.order_id) AS total_orders_r
   FROM (olist_customers c
     JOIN olist_orders o ON ((c.customer_id = o.customer_id)))
  GROUP BY c.customer_unique_id
 HAVING (count(DISTINCT o.order_id) > 1);;

-- View: v_cusotmer_cohort
CREATE OR REPLACE VIEW v_cusotmer_cohort AS
SELECT c.customer_unique_id,
    min(date_trunc('month'::text, o.order_purchase_timestamp)) AS cohort_month
   FROM (olist_customers c
     JOIN olist_orders o ON ((c.customer_id = o.customer_id)))
  GROUP BY c.customer_unique_id;;

-- View: v_customer_cohort
CREATE OR REPLACE VIEW v_customer_cohort AS
SELECT c.customer_unique_id,
    min(date_trunc('month'::text, o.order_purchase_timestamp)) AS cohort_month
   FROM (olist_customers c
     JOIN olist_orders o ON ((c.customer_id = o.customer_id)))
  GROUP BY c.customer_unique_id;;

-- View: v_customer_orders_with_cohort
CREATE OR REPLACE VIEW v_customer_orders_with_cohort AS
SELECT c.customer_unique_id,
    date_trunc('month'::text, o.order_purchase_timestamp) AS order_month,
    cohort.cohort_month
   FROM ((olist_customers c
     JOIN olist_orders o ON ((c.customer_id = o.customer_id)))
     JOIN v_customer_cohort cohort ON ((cohort.customer_unique_id = c.customer_unique_id)));;

-- View: v_customer_order_dates
CREATE OR REPLACE VIEW v_customer_order_dates AS
SELECT c.customer_unique_id,
    (o.order_purchase_timestamp)::date AS purchase_date
   FROM (olist_customers c
     JOIN olist_orders o ON ((c.customer_id = o.customer_id)))
  ORDER BY c.customer_unique_id, ((o.order_purchase_timestamp)::date);;

-- View: v_customer_value_by_customer_location
CREATE OR REPLACE VIEW v_customer_value_by_customer_location AS
SELECT c.customer_id,
    c.customer_unique_id,
    c.customer_city,
    c.customer_state,
    sum(p.payment_value) AS total_payment_value
   FROM ((olist_customers c
     JOIN olist_orders o ON ((c.customer_id = o.customer_id)))
     JOIN olist_order_payments p ON ((o.order_id = p.order_id)))
  GROUP BY c.customer_id, c.customer_unique_id, c.customer_city, c.customer_state
  ORDER BY (sum(p.payment_value)) DESC;;

-- View: v_top_categories
CREATE OR REPLACE VIEW v_top_categories AS
SELECT pr.product_category_name,
    count(oi.order_id) AS total_orders,
    sum(oi.price) AS total_revenue,
    avg(oi.price) AS av_price
   FROM (olist_order_items oi
     JOIN olist_products pr ON ((oi.product_id = pr.product_id)))
  GROUP BY pr.product_category_name
  ORDER BY (sum(oi.price)) DESC;;

-- View: v_sales_seasonality
CREATE OR REPLACE VIEW v_sales_seasonality AS
SELECT date_trunc('month'::text, o.order_purchase_timestamp) AS order_month,
    count(DISTINCT o.order_id) AS total_orders,
    sum(oi.price) AS total_sales
   FROM (olist_orders o
     JOIN olist_order_items oi ON ((o.order_id = oi.order_id)))
  GROUP BY (date_trunc('month'::text, o.order_purchase_timestamp))
  ORDER BY (date_trunc('month'::text, o.order_purchase_timestamp));;

-- View: v_delivery_timeliness
CREATE OR REPLACE VIEW v_delivery_timeliness AS
SELECT order_id,
    order_estimated_delivery_date,
    order_delivered_customer_date,
    order_purchase_timestamp,
    date_part('day'::text, (order_delivered_customer_date - order_purchase_timestamp)) AS actual_delivery_days,
    date_part('day'::text, (order_estimated_delivery_date - order_purchase_timestamp)) AS estimated_delivery_days,
    date_part('day'::text, (order_delivered_customer_date - order_estimated_delivery_date)) AS delivery_diff_days
   FROM olist_orders
  WHERE ((order_delivered_customer_date IS NOT NULL) AND (order_estimated_delivery_date IS NOT NULL));;
