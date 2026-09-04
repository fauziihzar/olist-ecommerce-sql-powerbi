# Brazilian E-Commerce Analytics — SQL & Power BI

End-to-end e-commerce data analysis project using **Python, MySQL, SQL, and Power BI** to analyze sales performance, delivery logistics, customer satisfaction, product categories, and seller performance.

---

## Project Overview

This project analyzes the **Brazilian E-Commerce Public Dataset by Olist**.

The original dataset contains approximately 100,000 orders from 2016–2018. For this portfolio project, a reproducible **10,000-order subset** was created using Python/Pandas to improve local processing efficiency while preserving relationships between orders and related tables.

All analysis and reported KPIs in this project are based on the **10,000-order subset**.

### Analytics Workflow

**Data Subsetting → MySQL Database → SQL Analysis → Power BI Dashboard → Business Insights**

---

## Business Questions

This project focuses on the following business questions:

1. How is overall sales performance?
2. How efficiently are orders delivered?
3. Is delivery performance associated with customer satisfaction?
4. Which product categories generate the highest sales?
5. Which sellers perform best across sales, delivery, and customer ratings?
6. What are the main logistics performance indicators?

---

## Tools & Technologies

| Tool | Purpose |
|---|---|
| Python / Pandas | Data subsetting and data preparation |
| MySQL | Relational database management |
| SQL | Data validation, KPI calculation, and business analysis |
| Power BI | Interactive dashboard and visualization |
| GitHub | Version control and portfolio documentation |

---

## Dataset

**Dataset:** Brazilian E-Commerce Public Dataset by Olist

**Original scope:** Approximately 100,000 orders from 2016–2018

**Portfolio scope:** 10,000 orders

The subset preserves relationships between the main entities, including:

- Customers
- Orders
- Order Items
- Products
- Sellers
- Payments
- Reviews
- Product Category Translation

The reduced dataset was created to improve local processing efficiency while maintaining the relational structure required for SQL JOINs and business analysis.

---

# SQL Analysis

The project contains **10 analytical queries organized across five SQL scripts**, covering sales, logistics, reviews, products, and seller performance.

| # | Analysis | Key Result |
|---|---|---|
| 1 | Overall Sales KPIs | $1.60M revenue, 10K orders, $160.23 AOV |
| 2 | Average Delivery Time | 12.41 days average delivery |
| 3 | Delivery Performance | 9,715 delivered orders |
| 4 | Estimated vs Actual Delivery | 24.41 days estimated vs 12.41 days actual |
| 5 | Average Review Score | 4.09 / 5 |
| 6 | Review Score Distribution | 57.67% of reviews are 5-star |
| 7 | Top 10 Sellers | Top seller generated approximately $22,998.98 |
| 8 | Review Score by Delivery Performance | On-time deliveries average 4.28 vs 2.60 for late deliveries |
| 9 | Product Category Sales | Leading categories identified by sales |
| 10 | Overall Logistics Performance | 92.32% on-time delivery rate |

SQL scripts are available in the [`sql`](./sql/) folder.

---

# Power BI Dashboard

The Power BI dashboard provides an interactive view of sales performance, logistics, customer behavior, and seller performance.

## Dashboard 1 — Executive Sales & Logistics Overview

![Executive Sales & Logistics Overview](./power_bi/dashboard_01_executive_overview.png)

This dashboard focuses on:

- Total Revenue
- Total Orders
- Average Order Value
- On-Time Delivery Rate
- Average Review Score
- Average Delivery Delay
- Maximum Delivery Delay
- Revenue Trend
- Delivery Performance
- Top Product Categories

---

## Dashboard 2 — Customer & Seller Analysis

![Customer & Seller Analysis](./power_bi/dashboard_02_customer_seller_analysis.png)

This dashboard focuses on:

- Customer purchase behavior
- Repeat customer analysis
- Customer state analysis
- Seller sales performance
- Seller on-time delivery rate
- Seller average review score

The Power BI `.pbix` file and dashboard documentation are available in the [`power_bi`](./power_bi/) folder.

---

# Key Insights

### 1. Strong Overall Sales Performance

The 10,000-order dataset generated:

- **$1.60M total payment revenue**
- **10,000 orders**
- **$160.23 average order value**

This provides a high-level view of sales performance within the selected dataset.

### 2. Delivery Performance Is Strong Overall

Among delivered orders with valid delivery dates:

- **9,715 delivered orders**
- **8,969 on-time orders**
- **746 late orders**
- **92.32% on-time delivery rate**

Overall delivery performance is relatively strong, although late deliveries remain an operational concern.

### 3. Late Deliveries Can Involve Significant Delays

Among late deliveries:

- **8.22 days average delay**
- **153 days maximum delay**

Although most delivered orders arrive on time, a smaller group of late orders can experience substantial delivery delays.

> **Note:** Average Delivery Time (12.41 days) measures the time from purchase to customer delivery, while Average Delay (8.22 days) measures how late an order arrived compared with its estimated delivery date. These are different metrics.

### 4. Delivery Performance Is Associated With Customer Satisfaction

Average review scores by delivery status:

| Delivery Status | Average Review |
|---|---:|
| On-Time | 4.28 |
| Late | 2.60 |

Late deliveries are associated with a **1.68-point lower average review score** compared with on-time deliveries.

This suggests that logistics performance is closely associated with customer satisfaction.

### 5. Review Ratings Are Concentrated at 5 Stars

Review distribution:

| Review Score | Reviews | Share |
|---:|---:|---:|
| 5 | 5,738 | 57.67% |
| 4 | 1,917 | 19.27% |
| 3 | 847 | 8.51% |
| 2 | 313 | 3.15% |
| 1 | 1,134 | 11.40% |

More than half of recorded reviews are 5-star ratings, while 1-star reviews represent **11.40%** of reviews.

### 6. Product Sales Are Concentrated in Leading Categories

The highest-selling categories include:

1. Watches & Gifts
2. Health & Beauty
3. Bed Bath Table
4. Sports Leisure
5. Computers Accessories

These categories represent important areas for inventory planning, marketing, and product strategy.

### 7. Seller Performance Varies

Seller performance was evaluated using:

- Total sales
- On-time delivery rate
- Average review score

The highest-ranked seller generated approximately **$22,998.98 in sales**, with a **92.9% on-time delivery rate** and **4.35 average review score**.

---

# SQL & Power BI Validation

The final Power BI dashboard KPIs were cross-checked against SQL query results to ensure consistency between the analytical layer and visualization layer.

| Metric | SQL | Power BI |
|---|---:|---:|
| Revenue | $1.60M | $1.60M |
| Orders | 10,000 | 10K |
| AOV | $160.23 | $160.23 |
| On-Time Delivery Rate | 92.32% | 92.3% |
| Average Review Score | 4.09 | 4.09 |
| Average Delay | 8.22 days | 8.22 days |
| Maximum Delay | 153 days | 153 days |

**Validation Status: PASS**

Minor differences in displayed precision, such as **92.32% vs 92.3%**, are due to Power BI formatting.

---

# Data Validation

The final MySQL database contains the following validated tables:

| Table | Rows |
|---|---:|
| Customers | 10,000 |
| Orders | 10,000 |
| Order Items | 11,383 |
| Products | 6,747 |
| Sellers | 1,654 |
| Payments | 10,476 |
| Reviews | 9,949 |
| Category Translation | 71 |

Core relationship validation returned **0 orphan records**.

The review table contains fewer records than the 10,000 orders because not every order has a corresponding review record.

---

# Project Components

- [`SQL Analysis`](./sql/) — Database creation, data import, validation, KPI calculation, and analytical queries
- [`Power BI Dashboard`](./power_bi/) — Interactive dashboard, `.pbix` file, screenshots, and dashboard documentation
- [`Data Preparation`](./notebooks/) — Python notebook used to create the 10,000-order subset

---

# Repository Structure

```text
olist-ecommerce-sql-powerbi/
│
├── README.md
│
├── notebooks/
│   └── create_olist_subset.ipynb
│
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_import_data.sql
│   ├── 03_data_validation.sql
│   ├── 04_sales_kpis.sql
│   └── 05_logistics_review.sql
│
└── power_bi/
    ├── README.md
    ├── olist_ecommerce_dashboard.pbix
    ├── dashboard_01_executive_overview.png
    └── dashboard_02_customer_seller_analysis.png
