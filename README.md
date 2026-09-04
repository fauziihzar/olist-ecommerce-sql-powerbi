# Brazilian E-Commerce Analytics — SQL & Power BI

End-to-end e-commerce data analysis project using **Python, MySQL, SQL, and Power BI** to analyze sales performance, delivery logistics, customer satisfaction, product categories, and seller performance.

---

## Project Overview

This project analyzes the **Brazilian E-Commerce Public Dataset by Olist**.

The original dataset contains approximately 100,000 orders from 2016–2018. For this portfolio project, a reproducible **10,000-order subset** was created using Python/Pandas to improve local processing efficiency while preserving relationships between orders and related tables.

### Analytics Workflow

**Data Subsetting → MySQL Database → SQL Analysis → Power BI Dashboard → Business Insights**

---

## Business Questions

The analysis focuses on the following business questions:

- How is overall sales performance?
- How efficiently are orders delivered?
- Is delivery performance associated with customer satisfaction?
- Which product categories generate the highest sales?
- Which sellers perform best across sales, delivery, and customer ratings?
- What are the main logistics performance indicators?

---

## Tools & Technologies

| Tool | Purpose |
|---|---|
| Python / Pandas | Data subsetting and validation |
| MySQL | Relational database management |
| SQL | Business analysis and KPI calculation |
| Power BI | Interactive dashboard and visualization |
| GitHub | Documentation and portfolio presentation |

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

The reduced dataset was created to make local SQL processing and Power BI development more efficient while maintaining the relational structure required for analysis.

---

## Database Validation

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

---

# SQL Analysis

The project contains **10 analytical SQL queries** covering sales, logistics, reviews, products, and seller performance.

### Key Analysis

| # | Analysis | Key Result |
|---|---|---|
| 1 | Overall Sales KPIs | $1.60M revenue, 10K orders, $160.23 AOV |
| 2 | Average Delivery Time | 12.41 days average delivery |
| 3 | Delivery Performance by Order Status | 9,715 delivered orders |
| 4 | Estimated vs Actual Delivery | 24.41 days estimated vs 12.41 days actual |
| 5 | Average Review Score | 4.09 / 5 |
| 6 | Review Score Distribution | 57.67% of reviews are 5-star |
| 7 | Top 10 Sellers | Top seller generated approximately $22,998.98 |
| 8 | Review Score by Delivery Performance | Late deliveries have lower average ratings |
| 9 | Product Category Sales | Leading categories identified by sales |
| 10 | Seller Performance | Sellers compared using sales, delivery, and ratings |

SQL scripts are available in:

`/sql`

---

# Power BI Dashboard

The Power BI dashboard provides an interactive view of sales, logistics, customer behavior, and seller performance.

### Dashboard Pages

#### 1. Executive Sales & Logistics Overview

Key metrics include:

- Total Revenue
- Total Orders
- Average Order Value
- On-Time Delivery Rate
- Average Review Score
- Average Delivery Delay
- Maximum Delivery Delay
- Annual Revenue Trend
- Average Rating by Delivery Status
- Top 10 Product Categories by Sales

#### 2. Customer & Seller Analysis

The second dashboard focuses on:

- Customer purchase frequency
- Repeat customer rate
- Customer state filtering
- Seller sales performance
- Seller on-time delivery rate
- Seller average review score

Dashboard files and screenshots are available in:

`/power_bi`

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

This indicates that although most delivered orders arrive on time, a smaller group of late orders can experience substantial delivery gaps.

> Note: **Average Delivery Time (12.41 days)** measures the total time from purchase to delivery, while **Average Delay (8.22 days)** measures how late an order arrived compared with its estimated delivery date. These are different metrics.

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

# Repository Structure

```text
olist-ecommerce-sql-powerbi/
│
├── README.md
│
├── sql/
│   ├── README.md
│   ├── 01_sales_logistics_analysis.sql
│   └── 02_customer_product_seller_analysis.sql
│
└── power_bi/
    ├── README.md
    ├── olist_ecommerce_dashboard.pbix
    ├── dashboard_01_executive_overview.png
    └── dashboard_02_customer_seller_analysis
