# Olist E-Commerce SQL Analysis

SQL-based exploratory analysis of a real Brazilian e-commerce dataset. The goal is to answer 12 business questions across sales, logistics, payments, and seller performance using PostgreSQL.

**Dataset:** [Olist Brazilian E-Commerce — Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)  
**Tools:** PostgreSQL, pgAdmin

---

## Business Questions

| #   | Question                                                 |
| --- | -------------------------------------------------------- |
| Q1  | Top 10 product categories by total revenue               |
| Q2  | Payment method distribution (credit card vs others)      |
| Q3  | Average review score by product category                 |
| Q4  | Order count by order status                              |
| Q5  | % of delivered orders that arrived late                  |
| Q6  | Repeat buyers vs one-time customers                      |
| Q7  | Monthly order volume: 2017 vs 2018                       |
| Q8  | Average freight-to-price ratio by seller state           |
| Q9  | Sellers ranked by revenue within each state (ROW_NUMBER) |
| Q10 | Month-over-month revenue growth rate (LAG)               |
| Q11 | Top 3 sellers per product category (RANK)                |
| Q12 | Customer segmentation by spending tier (NTILE)           |

---

## Key Findings

**1. Health & beauty dominates revenue**  
Beauty products, gift items, and small accessories consistently top the revenue charts — suggesting Olist's core customer base skews toward personal and lifestyle purchases.

**2. Credit card dependency is high (~70% of payments)**  
Nearly 70% of transactions are paid by credit card, with other methods barely registering. This concentration is both an opportunity (optimize credit card UX, offer installment perks) and a risk (any friction in card payments directly impacts revenue).

**3. ~8% of orders are delivered late**  
Roughly 1 in 12 delivered orders missed the estimated delivery date. Sellers in certain states may contribute disproportionately — worth investigating alongside freight ratios.

**4. November is a revenue anomaly**  
November shows a sharp spike in order volume significantly above other months, followed by an immediate drop in the month-over-month growth rate — suggesting a concentrated sales event rather than organic growth. November then shows a strong rebound, likely tied to Black Friday.

---

## How to Reproduce

**1. Install tools**

- [PostgreSQL](https://www.postgresql.org/download/) (includes pgAdmin)

**2. Download the dataset**

- Download from [Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) and unzip into a local folder

**3. Set up the database**

- Follow setup.sql in /queries

**4. Run the queries**

- Open `/queries/` and run each `.sql` file in pgAdmin's Query Tool
