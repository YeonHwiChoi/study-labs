-- Day3 SQL 실습

-- 1. 부서별 최고 급여자 조회
SELECT e.emp_name, e.salary, d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.dept_id = e.dept_id
);

-- 2. 지난달 주문 고객 중 이번달에도 주문한 고객 조회
SELECT DISTINCT o1.customer_id, c.customer_name
FROM orders o1
JOIN customers c ON o1.customer_id = c.customer_id
WHERE DATE_TRUNC('month', o1.order_date) = DATE '2025-09-01'
  AND o1.customer_id IN (
    SELECT o2.customer_id
    FROM orders o2
    WHERE DATE_TRUNC('month', o2.order_date) = DATE '2025-08-01'
);

-- 3. 부서 평균 급여보다 높은 사원 조회
SELECT e.emp_name, e.salary, d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.dept_id = e.dept_id
);

-- 4. 주문하지 않은 고객 조회
SELECT c.customer_id, c.customer_name
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;