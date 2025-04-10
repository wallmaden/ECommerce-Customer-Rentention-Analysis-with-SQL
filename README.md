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

- **SQL (PostgreSQL via pgAdmin 4)** – Data prep, transformation, CTEs, JOINs, Window Functions
- **Power BI** – Data model + dashboarding
- **Python** – For early cleaning (null handling, parsing, merging)
- **ERD Tool** – For schema visualization

## Dataset Information

**Source:** [Kaggle: Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

## ERD/Model Files:

![Customer Retention Model](https://github.com/wallmaden/ECommerce-Customer-Retention-Analysis-with-SQL/raw/main/04%20Analysis%20%26%20Visualisations/Model.docx-1.png)

## Customer Retention Model

### Power BI Visualisation: 

## Project Deliverables

| Item                     | Description                         |
|--------------------------|-------------------------------------|
| SQL Scripts              | CTEs, joins, views                  |
| Power BI File            | Interactive dashboards              |
| ERD Diagram              | Entity Relationships                |
| Insights Summary         | Business recommendations            |
| Cleaning Scripts         | Python scripts                      |

## Data Preparation

### 1. Create Database & Tables

Eight base tables used:
- `olist_customers`
- `olist_geolocation`
- `olist_order_items`
- `olist_order_payments`
- `olist_orders`
- `olist_products`
- `olist_sellers`
- `product_category_name_translation`

Nineteen PostgreSQL views were created to aggregate and prepare data for analysis and visualization.

Examples:
- `v_customer_cohort`
- `v_sales_seasonality`
- `v_high_value_late_orders`
- `v_repeat_customers_rate`

### 2. Importing the Data

**Python cleaning included:**
- Null/duplicate removal
- Timestamp parsing
- Geolocation merges
- Derived fields: delivery time, review time, AOV

**Power BI:** Used PostgreSQL connector for seamless import with no extra transformation required.

## SQL Analysis: Key Business Questions

1. **Customer Segmentation**
   - High-revenue cities/states
   - Repeat vs one-time buyers

2. **Sales & Product Trends**
   - Top categories
   - Seasonality of purchases

3. **Delivery Experience**
   - Avg. vs estimated delivery time
   - Delay hotspots

4. **Payment Behaviour**
   - Method preferences
   - Basket size by type

5. **Churn & Retention**
   - Reorder rate
   - Geographic churn zones

## Power BI Dashboards

**Customer Heatmap** – Spending and order concentration  
**Order Funnel** – Orders → Delivery → Review conversion  
**Product Trends** – Top categories, returns, review scores  
**Payment & Revenue** – AOV, methods, value per state  
**Churn & Retention** – Cohort reordering, churn map  
**Delivery Overview** – Delay days, regions, causes

## 📥 Download Power BI Report (PBIX)

You can download the full Power BI report used in this project below:

🔗 [Download Power BI Report – ECommerce Customer Retention Case Study (PBIX)](https://drive.google.com/file/d/1xeVcNbYvTLqomBq6Rud8rNr61_plK2Ki/view?usp=drive_link)

> *Note: File is hosted via Google Drive. Open the link and click the download icon in the top-right corner.*

---

## Delivery Difference Days by Quarter and Month

![delivery_diff_days by Quarter and Month](https://github.com/wallmaden/ECommerce-Customer-Retention-Analysis-with-SQL/raw/main/04%20Analysis%20%26%20Visualisations/delivery_diff_days%20by%20Quarter%20and%20Month.png)

## Average Delivery Delay by Customer State

![Sum of avg_delay_days by customer_state](https://github.com/wallmaden/ECommerce-Customer-Retention-Analysis-with-SQL/raw/main/04%20Analysis%20%26%20Visualisations/Sum%20of%20avg_delay_days%20by%20customer_state.png)

## Table of Average Delivery Delay by Customer State

![Table of avg_delay_days by customer_state](https://github.com/wallmaden/ECommerce-Customer-Retention-Analysis-with-SQL/raw/main/04%20Analysis%20%26%20Visualisations/Table%20of%20avg_delay_days%20by%20customer_state.png)

---

## Key Insights

**High-spend States (2016–2018)**  
- SP: 37.5% of total spend  
- RJ: 13.4%  
- MG: 11.7%  
> These three states contribute **62.6%** of business, ideal for targeted growth.

**Delivery Delays Impact Satisfaction**
- Worst delays in **Q2**, recovery in **Q3**, worsened again in **Q4**
- Most delayed states: **AL, RO, TO, ES**

**Churn-Prone Customers**
- Higher churn in **Northern and Northeastern** regions
- Linked to slower deliveries and heavier reliance on boleto

**Payment Trends**
- 73.9% credit card, 19.0% boleto
- Credit card users have higher AOV and increasing usage year-on-year

**Repeat Customer Product Categories**
- Most repeat: **Health & Beauty**, **Books**, **Pet Products**
- Least repeat: **Furniture**, **Electronics**

---

## Sample Datasets Included

This repo includes GitHub-friendly `.csv` samples (1000 rows) for:
- Customers
- Orders
- Products
- Geolocation
- Payments
- Sellers

See the `/Sample_Data/` directory for a previewable version of cleaned inputs.

---

## Next Steps / Future Enhancements

- Incorporate time-series forecasting models (Prophet, ARIMA)
- Churn risk scoring using predictive ML
- Link with web session data if available
- Explore more recent datasets for time relevance

---

## Learnings

- Real-world datasets include messy fields, encoding inconsistencies, and structure misalignment
- Joining **geolocation** with customer & seller addresses allowed deeper regional strategy insights
- **SQL window functions** powered time-based cohort and churn logic
- Power BI enabled interactive storytelling and drill-downs across KPIs
- Segmenting customers by **LTV, payment behavior, and location** led to actionable strategies for marketing, logistics, and retention

---

## Author

**Paul Maden**  
Business & Data Analyst  
🌐 [www.paulsmaden.com](https://www.paulsmaden.com)  
📧 wallmaden@hotmail.com  

---
