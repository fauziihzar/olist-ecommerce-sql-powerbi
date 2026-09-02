# Brazilian E-Commerce Analytics — SQL & Power BI

End-to-end e-commerce analytics project using **Python, MySQL, SQL, and Power BI** to analyze sales performance, logistics, customer retention, product categories, and seller performance.

## Project Overview

This project uses the **Brazilian E-Commerce Public Dataset by Olist**.

The original dataset contains approximately 100,000 orders from 2016–2018. For this project, I created a reproducible **10,000-order subset** using Python/Pandas to improve local processing efficiency while preserving relationships between related tables.

The project follows an end-to-end analytics workflow:

**Data Subsetting → MySQL Database → SQL Analysis → Power BI Dashboard → Business Insights**

---

## Business Questions

- How is overall sales performance?
- Does delivery performance affect customer satisfaction?
- How strong is customer retention?
- Which product categories generate the highest sales?
- How do sellers perform across sales, delivery, and customer ratings?

---

## Tools

| Tool | Purpose |
|---|---|
| Python / Pandas | Data subsetting and validation |
| MySQL | Relational database and data management |
| SQL | Business analysis and customer segmentation |
| Power BI | Dashboard and data visualization |
| GitHub | Project documentation |

---

## Key Insights

### 1. Sales Performance

- **Total Revenue:** $1.60M
- **Paid Orders:** 9,999
- **Average Order Value:** $160.25

The selected dataset generated approximately **$1.60M in payment-based revenue**, with an average value of approximately **$160 per paid order**.

---

### 2. Delivery Performance & Customer Satisfaction

| Delivery Status | Orders | Avg. Review |
|---|---:|---:|
| On-Time | 8,948 | 4.28 |
| Late | 728 | 2.60 |

Late deliveries were associated with a **1.68-point lower average review score** compared with on-time deliveries.

**Business implication:** Improving delivery reliability should be a key operational priority because delivery performance is closely associated with customer satisfaction.

---

### 3. Customer Retention

The Power BI analysis shows a **0.43% repeat purchase rate**.

RFM segmentation also shows:

- Recent Customers: **49.80%**
- Hibernating / Lost: **49.78%**
- At-Risk: **0.23%**
- Champions / Loyal: **0.19%**

**Business implication:** Customer retention represents a significant opportunity. Targeted reactivation campaigns, personalized offers, and loyalty strategies could help increase repeat purchases.

---

### 4. Top Product Categories

| Rank | Category | Product Sales |
|---|---|---:|
| 1 | Watches & Gifts | $126.6K |
| 2 | Health & Beauty | $124.1K |
| 3 | Bed Bath Table | $103.1K |
| 4 | Sports Leisure | $100.8K |
| 5 | Computers Accessories | $91.3K |

**Business implication:** High-performing categories should receive greater attention in inventory planning, promotions, and product strategy.

> Note: Category sales are calculated from `order_items.price`, while total revenue is calculated from `payments.payment_value`. These metrics represent different business measures.

---

## Power BI Dashboard

### Executive Sales & Logistics Overview

![Executive Dashboard](screenshots/executive-dashboard.png)

### Customer & Seller Analysis

![Customer & Seller Dashboard](screenshots/customer-seller-dashboard.png)

The dashboard provides interactive analysis of:

- Revenue and order performance
- Revenue trends
- Delivery performance
- Customer satisfaction
- Customer segmentation
- Product categories
- Seller performance

---

## Data Validation

The final MySQL database contains:

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

Core foreign-key validation returned **0 orphan records**.

A small number of review records were not loaded during the import process and are documented as a data-quality limitation.

---

## Repository Structure

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
│   ├── 05_logistics_review.sql
│   ├── 06_rfm_segmentation.sql
│   ├── 07_product_categories.sql
│   └── 08_seller_performance.sql
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
