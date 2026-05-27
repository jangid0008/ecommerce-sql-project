use ecommerce;

-- 1. Show all customers
SELECT * FROM customers;

-- 2. Show customer names and emails
SELECT name, email FROM customers;

-- 3. Show products sorted by price (high to low)
SELECT * FROM products
ORDER BY price DESC;

-- 4. Show products with price greater than 1000
SELECT * FROM products
WHERE price > 1000;

-- 5. Show orders with Delivered status
SELECT * FROM orders
WHERE order_status = 'Delivered';

-- 6. Show products between price 500 and 2000
SELECT * FROM products
WHERE price BETWEEN 500 AND 2000;

-- 7. Count total customers
SELECT COUNT(*) AS total_customers FROM customers;

-- 8. Find average product price
SELECT AVG(price) AS average_price FROM products;

-- 9. Find total payment amount
SELECT SUM(amount) AS total_revenue FROM payments;

-- 10. Count products category wise
SELECT category, COUNT(*) AS total_products FROM products
GROUP BY category;

-- 11. Find average product price category wise
SELECT category, AVG(price) AS avg_price FROM products
GROUP BY category;

-- 12. Show customer names with their orders
SELECT c.name, o.order_id, o.order_status FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;

-- 13. Show product names with ordered quantity
SELECT p.product_name, oi.quantity FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id;

-- 14. Show payment details with order status
SELECT p.payment_mode, p.amount, o.order_status FROM payments p
JOIN orders o
ON p.order_id = o.order_id;

-- 15. Find total revenue by payment mode
SELECT payment_mode, SUM(amount) AS total_amount FROM payments
GROUP BY payment_mode;

-- 16. Show categories having more than 5 products
SELECT category, COUNT(*) AS total_products FROM products
GROUP BY category
HAVING COUNT(*) > 5;

-- 17. Show all customers and their orders using LEFT JOIN
SELECT c.name, o.order_id, o.order_status FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

-- 18. Find products with price greater than average price
SELECT * FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- 19. Find customers who placed orders
SELECT * FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders);

-- 20. Find the most expensive product
SELECT * FROM products
WHERE price = (SELECT MAX(price) FROM products);
