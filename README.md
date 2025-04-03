# ECommerce_Customer_Retention_Analysis_with_SQL
To explore, analyse, and visualise customer behaviour within an e-commerce marketplace, focusing on purchasing patterns, customer churn, delivery trends, and segment performance. 

## Project Summary
This project is an independent case study focused on analyzing customer retention within the Brazilian e-commerce marketplace. Using PostgreSQL for data analysis and Power BI for visualisation, the study explores patterns in customer behavior, satisfaction, and churn. Techniques such as cohort analysis, geospatial mapping, and RFM segmentation were applied to uncover key insights into high-value customer segments and retention drivers. These findings support actionable recommendations for marketing, logistics, and retention strategy teams.

## Tools Used:

<img src="https://raw.githubusercontent.com/wallmaden/ECommerce-Customer-Retention-Analysis-with-SQL/main/assets/icons/PostgreSQL_logo_PNG3.png" alt="PostgreSQL" width="300"/>
<img src="https://raw.githubusercontent.com/wallmaden/ECommerce-Customer-Retention-Analysis-with-SQL/main/assets/icons/power-bi-microsoft-seeklogo.png" alt="Power BI" width="180"/>

## Objective

To explore and visualize customer behavior within an e-commerce marketplace (Olist Brazil) — focusing on:
- Purchasing patterns
- Delivery experience
- Payment behaviors
- Customer churn
- Product category performance
- Retention strategies

## Tools & Technologies

- SQL (PostgreSQL via pgAdmin 4) – Data prep, transformation, CTEs, JOINs, Window Functions
- Power BI – Data model + dashboarding
- Python – For early cleaning (null handling, parsing, merging)
- ERD Tool – For schema visualization

## Dataset Information

### Source: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

### ERD/Model Files:

![Customer Retention Model](https://github.com/wallmaden/ECommerce-Customer-Retention-Analysis-with-SQL/raw/main/04%20Analysis%20%26%20Visualisations/Model.docx-1.png)

## Customer Retention Model

### Power BI Visualisation: 

## Data Preparation

1. **Create database & Tables**

- **Create Tables:** Created multiple SQL views in PostgreSQL based on the original 8 datasets from the Olist e-commerce database. These views were designed using structured CREATE VIEW queries to join,transform, and enrich the raw tables — optimizing them for analysis and seamless integration into Power BI. Each view included relevant columns, calculated fields, and appropriate data    types to support key business questions and visualizations.

- **List of Tables:** The following 8 base tables were used from the Olist e-commerce dataset:

  - `olist_customers` – Contains customer IDs and location information.
  - `olist_geolocation` – Maps zip codes to geographical coordinates (lat/lng).
  - `olist_order_items` – Includes details about items in each order.
  - `olist_order_payments` – Captures payment types and values per order.
  - `olist_orders` – Master order table with status and timestamp metadata.
  - `olist_products` – Product-level metadata including category and dimensions.
  - `olist_sellers` – Seller IDs and their location details.
  - `product_category_name_translation` – English translations of product category names.

- **List of Views:** To prepare the data for Power BI analysis, 19 SQL views were created in PostgreSQL. These views joined, cleaned, and aggregated the original tables to support specific business questions related to customer behavior, retention, delivery performance, and sales trends.

  - `v_avg_basket_size_per_customer` – Calculates the average basket size per customer.
  - `v_customer_cohort` – Assigns customers to monthly signup cohorts for retention analysis.
  - `v_customer_order_dates` – Extracts first and last order dates for each customer.
  - `v_customer_orders_with_cohort` – Combines customer orders with their cohort labels.
  - `v_customer_value_by_customer_location` – Summarizes revenue per customer by city and state.
  - `v_delivery_timeliness` – Compares actual vs. estimated delivery times.
  - `v_geographic_delivery_delays` – Maps late deliveries by region.
  - `v_high_value_late_orders` – Flags orders that were both high-value and delayed.
  - `v_high_value_transactions` – Filters transactions above a certain revenue threshold.
  - `v_order_status_summary` – Summarizes the distribution of order statuses.
  - `v_overall_avg_basket_size` – Computes average basket size across all customers.
  - `v_payment_type_by_location` – Analyzes payment preferences by geography.
  - `v_payment_type_preferences` – Shows overall payment type usage.
  - `v_repeat_customers_rate` – Calculates the rate of repeat vs. one-time customers.
  - `v_repeat_customers_summary` – Summarizes repeat purchase behavior.
  - `v_sales_seasonality` – Aggregates sales by month to detect seasonality.
  - `v_top_categories` – Lists top-selling product categories.
  - `v_top_customer_cities` – Identifies cities with the highest customer value.

2. **Importing the Data**

- **Data Cleaning Summary (using Python):**
  - Dropped nulls and duplicates
  - Converted timestamp fields
  - Standardized product category names
  - Joined zipcodes to geolocation data
  - Merged fields like city/state
  - Created derived columns: delivery time, time to review, etc.

- **Importing Data into Power BI:**
  After creating SQL views in PostgreSQL, the data was imported directly into Power BI via the PostgreSQL connector, ready for visualization without additional transformation.

3. **Model Relationship:**
  [Image]

## SQL Analysis: Key Business Questions

1. **Customer Segmentation**
- Which cities/states have highest revenue?
- Who are high-LTV or repeat customers?

2. **Sales & Product Trends**
- Top-performing product categories
- Monthly sales trends

3. **Delivery Experience**
- Avg. delivery time vs. estimated
- Delays by region

4. **Payment Behaviour**
- Credit vs. voucher usage
- Avg. basket size

5. **Churn & Retention**
- What % of customers reorder?
- Where is churn highest?

## Power BI Dashboards

Customer Heatmap
- Geospatial visualization of customer concentration and spending

Order Funnel
- Visual: Orders → Delivered → Reviewed (Stages with count)

Product Trends Dashboard
- Top Categories
- Avg. Review Scores
- Return rates by category

Payment & Revenue Insights
- Basket size by payment type
- Transaction size trends

Churn & Retention
- Retention Curve by cohort (signup/order month)
- Churn Map – customers not returning after X days
- CLV Estimator: Based on AOV, frequency, duration

Delivery Experience Overview
- Avg. delivery time vs. estimated
- Delivery issues by location

## Project Deliverables

**Item**	                  **Description**

**SQL Scripts**	            CTEs, joins, views
**Power BI File**	          Interactive dashboards
**ERD Diagram**	            Entity Relationships
**Insights Summary**	      Business recommendations
**Cleaning Scripts**	      Python scripts

## Key Insights

- High-spend states: [fill from visuals]

- Delivery delays = lower satisfaction in [region]

- Most churn-prone customers in [X] areas

- Credit card users contribute highest AOV

- Repeat customers favor [category]

## Next Steps / Future Enhancements

- Incorporate time series forecasting

- Predictive model for churn risk

- More recent datasets

- Link to web analytics (if available)

## Learnings

- Real-world datasets contain messy fields and foreign characters
- Importance of combining geolocation with business logic
- Power BI’s slicers/filters enhance story-telling
- SQL window functions power cohort and ranking analysis
