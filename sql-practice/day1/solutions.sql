-- 1) 30세 이상 직원
SELECT name, department FROM employees WHERE age >= 30;

-- 2) 총 주문 금액이 가장 큰 고객 (단일 1등)
SELECT customer_id, SUM(amount) AS total_amount
FROM orders
GROUP BY customer_id
ORDER BY total_amount DESC
LIMIT 1;

-- 2-확장) 공동 1등 포함
SELECT customer_id, SUM(amount) AS total_amount
FROM orders
GROUP BY customer_id
HAVING SUM(amount) = (
  SELECT MAX(total_sum) FROM (
    SELECT SUM(amount) AS total_sum FROM orders GROUP BY customer_id
  ) s
);

-- 3) 학년별 평균 80 이상
SELECT grade, AVG(score) AS avg_score
FROM students
GROUP BY grade
HAVING AVG(score) >= 80
ORDER BY avg_score DESC;
