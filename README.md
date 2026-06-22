# Customer Purchase Behavior Analysis

## Overview

This project analyzes customer shopping behavior for a retail company to uncover purchasing trends, customer segments, loyalty patterns, and factors that influence buying decisions. The analysis combines **Python**, **SQL**, and **data visualization** techniques to transform raw transaction data into actionable business insights.

### Business Question

> How can the company leverage consumer shopping data to identify trends, improve customer engagement, and optimize marketing and product strategies?

---

## Business Problem

A retail company wants to better understand its customers' purchasing behavior to improve:

- Sales performance
- Customer engagement
- Customer retention and loyalty
- Product and marketing strategies

Management is particularly interested in understanding how factors such as demographics, discounts, subscriptions, product ratings, payment methods, shipping preferences, and seasonal trends influence purchasing decisions.

---

## Dataset Description

The dataset contains customer transaction and behavioral information, including:

| Feature                | Description                    |
| ---------------------- | ------------------------------ |
| Customer ID            | Unique customer identifier     |
| Age                    | Customer age                   |
| Gender                 | Customer gender                |
| Item Purchased         | Product purchased              |
| Category               | Product category               |
| Purchase Amount (USD)  | Transaction value              |
| Location               | Customer location              |
| Season                 | Purchase season                |
| Review Rating          | Product rating                 |
| Subscription Status    | Subscription membership status |
| Shipping Type          | Shipping method used           |
| Discount Applied       | Whether a discount was applied |
| Promo Code Used        | Whether a promo code was used  |
| Previous Purchases     | Number of previous purchases   |
| Payment Method         | Preferred payment method       |
| Frequency of Purchases | Purchase frequency             |

---

## Project Objectives

### Data Preparation

- Explore and understand the dataset
- Handle missing values
- Create derived features such as customer age groups
- Prepare the dataset for analysis

### Customer Analysis

- Identify spending patterns across demographic groups
- Analyze customer loyalty and repeat purchasing behavior
- Evaluate the impact of subscriptions on spending

### Product Analysis

- Identify top-performing products
- Analyze product ratings
- Determine category-level purchasing trends

### Purchase Drivers

- Investigate the effects of discounts and promotions
- Examine shipping preferences
- Analyze seasonal purchasing behavior
- Explore payment method patterns

---

## Project Structure

```text
customer-purchase-behavior-analysis/
│
├── data/
│   ├── raw/
│   └── processed/
│
├── notebooks/
│   ├── 01_exploratory_analysis.ipynb
│   └── 02_sql_analysis.ipynb
│
├── sql/
│   └── business_analysis_queries.sql
│
├── outputs/
│
├── requirements.txt
└── README.md
```

---

## Analysis Areas

### Revenue & Spending Analysis

- Revenue contribution by gender
- Revenue contribution by age group
- Subscription impact on spending
- Average customer spending patterns

### Customer Behavior & Segmentation

- Customer segmentation based on purchase history
- Repeat buyer analysis
- High-value customers using discounts
- Loyalty analysis

### Product Performance Analysis

- Top-rated products
- Most purchased products by category
- Product popularity trends

### Pricing, Discounts & Purchase Drivers

- Discount effectiveness
- Shipping preferences and spending behavior
- Seasonal purchasing trends
- Payment method analysis
- Age group and category purchasing behavior

---

## Technologies Used

### Python

- Pandas

### Database

- PostgreSQL
- SQLAlchemy
- psycopg2

### Visualization

- Power BI

### Version Control

- Git
- GitHub

---

## SQL Analysis Categories

The SQL analysis is organized into four business-focused areas:

1. **Revenue & Spending Analysis**
2. **Customer Behavior & Segmentation**
3. **Product Performance Analysis**
4. **Pricing, Discounts & Purchase Drivers**

These analyses help uncover customer trends, spending habits, loyalty patterns, and factors that influence purchasing decisions.

---

## Key Skills Demonstrated

- Exploratory Data Analysis (EDA)
- Data Cleaning and Transformation
- Feature Engineering
- SQL Query Development
- PostgreSQL Integration
- Customer Segmentation
- Business Intelligence
- Dashboard Development

---

## How to Run

### Clone the Repository

```bash
git clone https://github.com/Raphaelj1/customer-purchase-behavior-analysis.git
cd customer-purchase-behavior-analysis
```

### Install Dependencies

```bash
pip install -r requirements.txt
```

### Launch Jupyter Notebook

```bash
jupyter notebook
```

### Run the Analysis

Execute the notebooks in the following order:

1. `01_exploratory_analysis.ipynb`
2. `02_sql_analysis.ipynb`
