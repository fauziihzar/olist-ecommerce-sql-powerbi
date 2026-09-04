# Brazilian E-Commerce Analytics — SQL & Power BI

End-to-end e-commerce analytics project using **Python, MySQL, SQL, and Power BI** to analyze sales performance, delivery logistics, customer satisfaction, product categories, and seller performance.

## Project Overview

This project uses the **Brazilian E-Commerce Public Dataset by Olist**.

The original dataset contains approximately 100,000 orders from 2016–2018. For this portfolio project, I created a reproducible **10,000-order subset** using Python/Pandas to improve local processing efficiency while preserving relationships between related tables.

### Analytics Workflow

Data Subsetting → MySQL Database → SQL Analysis → Power BI Dashboard → Business Insights

---

## Business Questions

- How is overall sales performance?
- How efficiently are orders delivered?
- Does delivery performance relate to customer satisfaction?
- Which product categories generate the highest sales?
- Which sellers perform best across sales, delivery, and customer ratings?
- What are the main logistics performance indicators?

---

## Tools

| Tool | Purpose |
|---|---|
| Python / Pandas | Data subsetting and validation |
| MySQL | Relational database management |
| SQL | Business analysis and KPI calculation |
| Power BI | Interactive dashboard and visualization |
| GitHub | Documentation and portfolio presentation |

---

# SQL Analysis

The project contains 10 analytical queries covering sales, logistics, reviews, products, and seller performance.

| # | Analysis | Key Result |
|---|---|---|
| 1 | Overall Sales KPIs | $1.60M revenue, 10K orders, $160.23 AOV |
| 2 | Average Delivery Time | 12.41 days average delivery |
| 3 | Delivery Performance by Order Status | 9,715 delivered orders |
| 4 | Estimated vs Actual Delivery | 24.41 days estimated vs 12.41 days actual |
| 5 | Average Review Score | 4.09 / 5 |
| 6 | Review Score Distribution | 57.67% of reviews are 5-star |
| 7 | Top 10 Sellers | Top seller generated $22,998.98 in sales |
| 8 | Review Score by Delivery Performance | 1-star reviews are more concentrated among late deliveries |
| 9 | Delivery Delay Analysis | 8.22 days average delay; 153 days maximum |
| 10 | Logistics Summary | 92.32% on-time delivery rate |

---

# Key Insights

### 1. Strong Overall Sales Performance

The 10,000-order dataset generated:

- **$1.60M total payment revenue**
- **10,000 orders**
- **$160.23 average order value**

This provides a high-level view of sales performance across the selected Olist dataset.

### 2. Delivery Performance Is Strong Overall

Among delivered orders with valid delivery dates:

- **9,715 delivered orders**
- **8,969 on-time orders**
- **746 late orders**
- **92.32% on-time delivery rate**

The overall delivery performance is relatively strong, although late deliveries remain an important operational issue.

### 3. Delivery Delays Are Material

Among late deliveries:

- **Average delay: 8.22 days**
- **Maximum delay: 153 days**

This indicates that while most orders are delivered on time, a smaller group of delayed orders can experience substantial delivery gaps.

### 4. Delivery Performance Is Associated With Customer Satisfaction

Average review scores by delivery status:

| Delivery Status | Average Review |
|---|---:|
| On-Time | 4.28 |
| Late | 2.60 |

Late deliveries are associated with a **1.68-point lower average review score** compared with on-time deliveries.

This suggests that logistics performance is closely related to customer satisfaction.

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

The highest-selling product categories include:

1. Watches & Gifts
2. Health & Beauty
3. Bed Bath Table
4. Sports Leisure
5. Computers Accessories

These categories represent important areas for inventory planning, marketing, and product strategy.

### 7. Seller Performance Varies

The Top 10 seller analysis evaluates sellers using:

- Total sales
- On-time delivery rate
- Average review score

The highest-ranked seller generated approximately **$22,998.98** in sales while maintaining a **92.9% on-time delivery rate** and **4.35 average review score**.

---

# Power BI Dashboard

## Executive Sales & Logistics Overview

The executive dashboard presents:

- Total Revenue
- Total Orders
- Average Order Value
- On-Time Delivery Rate
- Average Review Score
- Annual Revenue Trend
- Average Rating by Delivery Status
- Top 10 Product Categories by Sales
- Average Delay Days
- Maximum Delay Days

### Final Dashboard KPIs

| KPI | Value |
|---|---:|
| Total Revenue | $1.60M |
| Total Orders | 10K |
| Average Order Value | $160.23 |
| On-Time Delivery Rate | 92.3% |
| Average Review Score | 4.09 |
| Average Delay | 8.22 days |
| Maximum Delay | 153 days |

## SQL & Power BI Validation

The final dashboard KPIs were cross-checked against SQL query results to ensure consistency between the analytical layer and Power BI visualization.

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

Validation Result: All key dashboard KPIs were successfully reconciled with the final SQL results. Minor differences in displayed precision (e.g., 92.32% vs 92.3%) are due to Power BI formatting.

## Key Insights

- **Revenue & Orders:** The 10,000-order dataset generated approximately **$1.60M** in total revenue, with an average order value of **$160.23**.
- **Delivery Performance:** **92.32%** of delivered orders arrived on time, while **746 orders** were delivered late.
- **Delivery Delay:** Late orders experienced an average delay of **8.22 days**, with a maximum delay of **153 days**.
- **Customer Reviews:** The overall average review score was **4.09/5**, indicating a relatively positive customer rating across the dataset.
- **Delivery & Reviews:** On-time deliveries received a higher average review score than late deliveries, suggesting that delivery performance may be associated with customer ratings.
- **Seller Performance:** The top 10 sellers were compared based on **sales, on-time delivery rate, and average review score** to identify high-performing sellers.

---

# Data Validation

Final database validation confirmed:

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

# Repository Structure

```text
olist-ecommerce-sql-powerbi/
│
├── README.md
│
├── notebooks/
│   └── Membuat_subset_olist.ipynb
│
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_import_data.sql
│   ├── 03_data_validation.sql
│   ├── 04_sales_kpis.sql
│   └── 05_logistics_review.sql
│
├── powerbi/
│   └── Visualisasi.pdf
│
└── screenshots/
    ├── executive-dashboard.png
    ├── customer-seller-dashboard.png
    ├── sales-kpis.png
    ├── logistics-review.png
    ├── rfm-segmentation.png
    └── product-categories.png
