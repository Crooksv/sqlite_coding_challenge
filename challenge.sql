--Vincent Crooks
--Task 1

SELECT
  c.first_name || ' ' || c.last_name AS customer_full_name,
  SUM(oi.quantity * oi.unit_price) AS total_spend
FROM customers AS c
JOIN orders AS o
  ON o.customer_id = c.id
JOIN order_items AS oi
  ON oi.order_id = o.id
GROUP BY c.id
ORDER BY total_spend DESC
LIMIT 5;

--Task 2

SELECT
    p.category,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM products AS p
JOIN order_items AS oi
    ON oi.product_id = p.id
JOIN orders AS o
    ON o.id = oi.order_id
GROUP BY p.category
ORDER BY revenue DESC;

--Task 3

SELECT
    e.first_name,
    e.last_name,
    d.name AS department_name,
    e.salary AS employee_salary,
    dept_avg.avg_salary AS department_average
FROM employees AS e
JOIN departments AS d
    ON d.id = e.department_id
JOIN (
    SELECT
        department_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) AS dept_avg
    ON dept_avg.department_id = e.department_id
WHERE e.salary > dept_avg.avg_salary
ORDER BY department_name, employee_salary DESC;

--Task 4

SELECT
    city,
    COUNT(*) AS gold_customer_count
FROM customers
WHERE loyalty_level = 'Gold'
GROUP BY city
ORDER BY gold_customer_count DESC, city;
