-- View: public.v_avg_basket_size_per_customer

-- DROP VIEW public.v_avg_basket_size_per_customer;

CREATE OR REPLACE VIEW public.v_avg_basket_size_per_customer
 AS
 SELECT o.customer_id,
    count(DISTINCT oi.order_id) AS total_orders,
    sum(oi.price) AS total_spent,
    round(sum(oi.price)::numeric / count(DISTINCT oi.order_id)::numeric, 2) AS avg_basket_value
   FROM olist_order_items oi
     JOIN olist_orders o ON oi.order_id = o.order_id
  GROUP BY o.customer_id
  ORDER BY (round(sum(oi.price)::numeric / count(DISTINCT oi.order_id)::numeric, 2)) DESC;

ALTER TABLE public.v_avg_basket_size_per_customer
    OWNER TO postgres;
