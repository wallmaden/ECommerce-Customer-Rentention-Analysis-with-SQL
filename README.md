# ECommerce_Customer_Retention_Analysis
To explore, analyse, and visualize customer behaviour within an e-commerce marketplace, focusing on purchasing patterns, customer churn, delivery trends, and segment performance. 
This insight aims to help marketing, logistics, and retention strategy teams.
In this project, an analysis will be carried out using PostgreSQL and visualising the results using Power BI.

### Tools Used:

<img src="https://raw.githubusercontent.com/wallmaden/ECommerce_Customer_Retention_Analysis/main/assets/icons/postgresql.png" alt="PostgreSQL" width="50"/>
<img src="https://raw.githubusercontent.com/wallmaden/ECommerce_Customer_Retention_Analysis/main/assets/icons/powerbi.png" alt="Power BI" width="50"/>

### Objective

To explore and visualize customer behavior within an e-commerce marketplace (Olist Brazil) — focusing on:
- Purchasing patterns
- Delivery experience
- Payment behaviors
- Customer churn
- Product category performance
- Retention strategies

### Tools & Technologies

- SQL (PostgreSQL via pgAdmin 4) – Data prep, transformation, CTEs, JOINs, Window Functions
- Power BI – Data model + dashboarding
- Python – For early cleaning (null handling, parsing, merging)
- ERD Tool – For schema visualization

### Data Cleaning Summary

- Dropped nulls and duplicates
- Converted timestamp fields
- Standardized product category names
- Joined zipcodes to geolocation data
- Merged fields like city/state
- Created derived columns: delivery time, time to review, etc.

### SQL Analysis: Key Business Questions

1. Customer Segmentation
- Which cities/states have highest revenue?
- Who are high-LTV or repeat customers?

2. Sales & Product Trends
- Top-performing product categories
- Monthly sales trends

3. Delivery Experience
- Avg. delivery time vs. estimated
- Delays by region

4. Payment Behaviour
- Credit vs. voucher usage
- Avg. basket size

5. Churn & Retention
- What % of customers reorder?
- Where is churn highest?

### Power BI Dashboards

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

### Project Deliverables

Item	                  Description

SQL Scripts	            CTEs, joins, views
Power BI File	          Interactive dashboards
ERD Diagram	            Entity Relationships
Insights Summary	      Business recommendations
Cleaning Scripts	      Python scripts

### Key Insights

- High-spend states: [fill from visuals]

- Delivery delays = lower satisfaction in [region]

- Most churn-prone customers in [X] areas

- Credit card users contribute highest AOV

- Repeat customers favor [category]

### Next Steps / Future Enhancements

- Incorporate time series forecasting

- Predictive model for churn risk

- More recent datasets

- Link to web analytics (if available)

### Learnings

- Real-world datasets contain messy fields and foreign characters
- Importance of combining geolocation with business logic
- Power BI’s slicers/filters enhance story-telling
- SQL window functions power cohort and ranking analysis
