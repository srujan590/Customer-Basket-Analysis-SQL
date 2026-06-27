DESCRIBE basketbasket_details;
DESCRIBE customer_details;
SELECT * FROM basketbasket_details;
SELECT * FROM customer_details;
SELECT COUNT(*) AS Total_Customers
FROM customer_details;
SELECT COUNT(*) AS Total_Baskets
FROM basketbasket_details;
SELECT ROUND(AVG(customer_age),2)
FROM customer_details;
SELECT ROUND(AVG(basket_count),2)
FROM basketbasket_details;
SELECT sex,
COUNT(*) Total_Customers
FROM customer_details
GROUP BY sex;
SELECT
sex,
ROUND(AVG(customer_age),2)
FROM customer_details
GROUP BY sex;
SELECT
sex,
ROUND(AVG(tenure),2)
FROM customer_details
GROUP BY sex;
SELECT
customer_id,
SUM(basket_count) Total_Items
FROM basketbasket_details
GROUP BY customer_id
ORDER BY Total_Items DESC
LIMIT 10;
SELECT
customer_id,
ROUND(AVG(basket_count),2)
FROM basketbasket_details
GROUP BY customer_id;
SELECT MAX(basket_count)
FROM basketbasket_details;
SELECT MIN(basket_count)
FROM basketbasket_details;
SELECT
b.customer_id,
c.sex,
c.customer_age,
c.tenure,
b.product_id,
b.basket_date,
b.basket_count
FROM basketbasket_details b
JOIN customer_details c
ON b.customer_id=c.customer_id;
SELECT
c.sex,
SUM(b.basket_count) AS Total_Items
FROM basketbasket_details b
JOIN customer_details c
ON b.customer_id=c.customer_id
GROUP BY c.sex;
SELECT
c.sex,
ROUND(AVG(b.basket_count),2)
FROM basketbasket_details b
JOIN customer_details c
ON b.customer_id=c.customer_id
GROUP BY c.sex;
SELECT *
FROM customer_details
ORDER BY customer_age DESC
LIMIT 10;
SELECT *
FROM customer_details
ORDER BY tenure DESC
LIMIT 10;
SELECT *
FROM customer_details
WHERE customer_age>
(
SELECT AVG(customer_age)
FROM customer_details
);
SELECT *
FROM basketbasket_details
WHERE basket_count>
(
SELECT AVG(basket_count)
FROM basketbasket_details
);
SELECT
customer_id,
SUM(basket_count) Total_Items,
RANK() OVER(
ORDER BY SUM(basket_count) DESC
) Customer_Rank
FROM basketbasket_details
GROUP BY customer_id;

