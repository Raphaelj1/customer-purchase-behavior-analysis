-- REVENUE AND SPENDING ANALYSIS

-- Revenue by gender
SELECT gender,
SUM(purchase_amount) as revenue
FROM customer
GROUP BY gender

-- Subscription impact on spending
-- Average spending and total revenue between subscribers and non-subscribers
SELECT subscription_status,
	COUNT(customer_id) AS total_customers,
	ROUND(AVG(purchase_amount), 2) AS avg_spend,
	ROUND(SUM(purchase_amount), 2) AS total_revenue
FROM customer
GROUP BY subscription_status
ORDER BY total_revenue, avg_spend DESC

-- Revenue contribution of each age group
SELECT age_group,
	SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY age_group
ORDER BY total_revenue DESC


-- CUSTOMER BEHAVIOR & SEGMENTATION

-- High value discount users
-- Customers who used a discount but still spent more than the average purchase amount
SELECT customer_id, purchase_amount
FROM customer
WHERE discount_applied = 'Yes'
AND purchase_amount >= (
	SELECT AVG(purchase_amount)
	FROM customer
)

-- Customer segmentation based on purchase history
WITH customer_type AS (
	SELECT customer_id, previous_purchases,
	CASE 
		WHEN previous_purchases = 1 THEN 'New'
		WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
		ELSE 'Loyal'
		END AS customer_segment
	FROM customer
)
SELECT customer_segment, COUNT(*) AS "Number of Customers"
FROM customer_type
GROUP BY customer_segment

-- Repeat buyers vs subscription status
SELECT subscription_status,
	COUNT(customer_id) AS repeat_buyers
FROM customer
WHERE previous_purchases > 5
GROUP BY subscription_status


-- PRODUCT PERFORMANCE ANALYSIS

-- Top 5 products with the highest average review rating
SELECT item_purchased, 
	ROUND(AVG(review_rating::numeric), 2) AS "Average Product Rating"
FROM customer
GROUP BY item_purchased
ORDER BY AVG(review_rating) desc
LIMIT 5

-- Top 3 most purchased products within each category
WITH item_counts AS (
	SELECT category,
		item_purchased,
		COUNT(customer_id) AS total_orders,
		ROW_NUMBER() OVER(PARTITION BY category ORDER BY COUNT(customer_id) desc) AS item_rank
	FROM customer
	GROUP BY category, item_purchased
)
SELECT item_rank, category, item_purchased, total_orders
FROM item_counts
WHERE item_rank <= 3


-- PRICING, DISCOUNTS & PURCHASE DRIVERS

-- Top 5 products having the highest percentage of purchases with discounts applied
SELECT item_purchased,
	ROUND(100 * SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END)/COUNT(*), 2) AS discount_rate
FROM customer
GROUP BY item_purchased
ORDER BY discount_rate desc
LIMIT 5

-- Average purchase amounts between standard and express shipping
SELECT shipping_type,
	ROUND(AVG(purchase_amount), 2) AS "average_purchase_amount"
FROM customer
WHERE shipping_type in ('Standard', 'Express')
GROUP BY shipping_type

-- Seasonality vs spending
SELECT season,
       ROUND(AVG(purchase_amount), 2) AS avg_spend,
       SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY season
ORDER BY total_revenue DESC;

-- Payment method behavior
SELECT payment_method,
       ROUND(AVG(purchase_amount), 2) AS avg_spend,
       COUNT(*) AS transactions
FROM customer
GROUP BY payment_method
ORDER BY avg_spend DESC;

-- Discount effect on spending behavior
SELECT discount_applied,
       ROUND(AVG(purchase_amount), 2) AS avg_spend,
       COUNT(*) AS total_orders
FROM customer
GROUP BY discount_applied;

-- Category × age group behavior
SELECT age_group,
       category,
       ROUND(AVG(purchase_amount), 2) AS avg_spend
FROM customer
GROUP BY age_group, category
ORDER BY avg_spend DESC;

-- Loyalty vs spending frequency proxy
SELECT subscription_status,
       frequency_of_purchases,
       COUNT(*) AS customers
FROM customer
GROUP BY subscription_status, frequency_of_purchases
ORDER BY customers DESC;