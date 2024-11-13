/* 1. Top-Rated Products (INNER JOIN with Aggregation)
Find all products with an average rating above 4.5.
Use an INNER JOIN between Products and Reviews, grouping by product and filtering based on the average rating.
*/

SELECT p.product_id, p.product_name, AVG(r.rating) AS average_rating
FROM Products p
INNER JOIN Reviews r ON p.product_id = r.product_id
GROUP BY p.product_id, p.product_name
HAVING AVG(r.rating) > 4.5;


/*
2. Identify customers who share the same last name.
Use a SELF JOIN on the Customers table to list pairs of customers with matching last names. */

SELECT c1.customer_id, c1.first_name, c2.customer_id,c2.first_name,c1.last_name
FROM Customers c1
JOIN Customers c2 ON c1.last_name = c2.last_name AND c1.customer_id < c2.customer_id;



/* 3. List each customer’s total amount spent, their order count, and the average order amount.

Use INNER JOIN to link Customers, Orders, and OrderItems tables, and use aggregation functions
to calculate the total and average amounts for each customer. */

SELECT c.customer_id, c.first_name, c.last_name,
       COUNT(DISTINCT o.order_id) AS order_count,
       SUM(oi.quantity * oi.price_per_unit) AS total_amount_spent,
       AVG(oi.quantity * oi.price_per_unit) AS average_order_amount
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN OrderItems oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name;


/* 4. List all orders that do not have any associated review.

Use a LEFT JOIN between Orders and Reviews and filter to show only orders where review_id is NULL.*/

SELECT o.order_id, o.customer_id, o.order_date
FROM Orders o
LEFT JOIN Reviews r ON o.customer_id = r.customer_id 
WHERE r.review_id IS NULL;


/* 5. Display a list of all customers and all orders, including customers who have not placed orders and orders with no customer information.

Use a FULL OUTER JOIN between Customers and Orders. */

SELECT c.customer_id, c.first_name, c.last_name, o.order_id, o.order_date
FROM Customers c
FULL OUTER JOIN Orders o ON c.customer_id = o.customer_id;
